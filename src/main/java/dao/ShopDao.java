package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import model.Category;
import model.Products;

public class ShopDao extends BaseDao {
	public List<Category> selectAllCategory() {
		List<Category> cate = new ArrayList<Category>();
		String sql = "SELECT * FROM category";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category c1 = new Category();
				c1.setCategoryID(rs.getInt("CategoryID"));
				c1.setCategoryName(rs.getString("categoryName"));
				cate.add(c1);
			}
			return cate;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public List<Products> filterProducts(String keyword, Integer categoryID, BigDecimal minPrice, BigDecimal maxPrice,
			String[] sizes, String sort) {
		List<Products> list = new ArrayList<>();

// Sử dụng StringBuilder để xây dựng câu lệnh SQL động
// Dùng DISTINCT hoặc GROUP BY vì 1 sản phẩm có nhiều variant (size), 
// nếu không join sẽ bị lặp sản phẩm nhiều lần.
		StringBuilder sql = new StringBuilder("SELECT p.*, SUM(od.quantity) as total_sold " + "FROM Products p "
				+ "LEFT JOIN Products_Variants pv ON p.ProductsID = pv.productID "
				+ "LEFT JOIN ORDER_DETAILS od ON p.ProductsID = od.productID " + "WHERE 1=1 ");

// 1. Lọc theo từ khóa
		if (keyword != null && !keyword.isEmpty()) {
			sql.append(" AND p.productsName LIKE ? ");
		}

// 2. Lọc theo Category
		if (categoryID != null) {
			sql.append(" AND p.categoryID = ? ");
		}

// 3. Lọc theo Giá (Dựa trên bảng Products)
		if (minPrice != null) {
			sql.append(" AND p.price >= ? ");
		}
		if (maxPrice != null) {
			sql.append(" AND p.price <= ? ");
		}

// 4. Lọc theo Size (Nằm ở bảng Products_Variants)
		if (sizes != null && sizes.length > 0) {
			sql.append(" AND pv.size IN (");
			for (int i = 0; i < sizes.length; i++) {
				sql.append("?");
				if (i < sizes.length - 1)
					sql.append(",");
			}
			sql.append(") ");
		}

// Gom nhóm lại để tính toán và tránh trùng lặp
		sql.append(" GROUP BY p.ProductsID ");

// 5. Sắp xếp (Sort)
		if (sort != null) {
			switch (sort) {
			case "price_asc":
				sql.append(" ORDER BY p.price ASC ");
				break;
			case "price_desc":
				sql.append(" ORDER BY p.price DESC ");
				break;
			case "newest":
				sql.append(" ORDER BY p.createAt DESC ");
				break;
			case "sold_desc":
				sql.append(" ORDER BY total_sold DESC ");
				break;
			default:
				sql.append(" ORDER BY p.ProductsID DESC ");
			}
		}

		try (Connection conn = getConnection(); // Hàm lấy connection của bạn
				PreparedStatement ps = conn.prepareStatement(sql.toString())) {

			int index = 1;
// Gán giá trị cho các dấu ? theo đúng thứ tự
			if (keyword != null && !keyword.isEmpty())
				ps.setString(index++, "%" + keyword + "%");
			if (categoryID != null)
				ps.setInt(index++, categoryID);
			if (minPrice != null)
				ps.setBigDecimal(index++, minPrice);
			if (maxPrice != null)
				ps.setBigDecimal(index++, maxPrice);
			if (sizes != null && sizes.length > 0) {
				for (String s : sizes) {
					ps.setString(index++, s);
				}
			}

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Products p = new Products();
				p.setProductID(rs.getInt("ProductsID"));
				p.setProductName(rs.getNString("productsName"));
				p.setCategoryID(rs.getInt("categoryID"));
				p.setPrice(rs.getBigDecimal("price"));
				p.setImg(rs.getNString("img"));
				p.setStatus(rs.getString("status"));
// Thêm các trường khác...
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
