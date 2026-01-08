package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.ProductVariants;
import model.Products;
import model.reviews;

public class ProductsDao extends BaseDao {

	public List<Products> SelectAll(int offset, int limit) {
		List<Products> products = new ArrayList<>();
		String sql = "Select * from Products WHERE status='ACTIVE' order by ProductsID Limit ? offset ?;";
		try (Connection conn =getConnection();

				PreparedStatement ps = conn.prepareStatement(sql);) {
			int getOff = offset * limit;

			ps.setInt(1, limit);
			ps.setInt(2, getOff);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				products.add(new Products(rs.getInt("ProductsID"), rs.getString("productsName"),
						rs.getInt("categoryID"), rs.getBigDecimal("price"), rs.getString("status"), rs.getString("img"),
						rs.getString("DESCRIPTION")));

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return products;
	}

	public Products SelectByProductID(int id) {
		// TODO Auto-generated method stub
		String sql = "SELECT \r\n"
				+ "    p.*,\r\n"
				+ "    COUNT(r.review_id) AS userReviewed,\r\n"
				+ "\r\n"
				+ "    SUM(CASE WHEN r.rating = 5 THEN 1 ELSE 0 END) AS Rate5,\r\n"
				+ "    SUM(CASE WHEN r.rating = 4 THEN 1 ELSE 0 END) AS Rate4,\r\n"
				+ "    SUM(CASE WHEN r.rating = 3 THEN 1 ELSE 0 END) AS Rate3,\r\n"
				+ "    SUM(CASE WHEN r.rating = 2 THEN 1 ELSE 0 END) AS Rate2,\r\n"
				+ "    SUM(CASE WHEN r.rating = 1 THEN 1 ELSE 0 END) AS Rate1\r\n"
				+ "\r\n"
				+ "FROM products p\r\n"
				+ "LEFT JOIN reviews r \r\n"
				+ "    ON r.product_id = p.ProductsID\r\n"
				+ "WHERE p.ProductsID = ?\r\n"
				+ "GROUP BY p.ProductsID\r\n"
				+ "LIMIT 1;";

		Products product = null;
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				product = new Products(rs.getInt("ProductsID"), rs.getString("productsName"), rs.getInt("categoryID"),
						rs.getBigDecimal("price"), rs.getString("status"), rs.getString("img"),
						rs.getString("DESCRIPTION"));
				List<reviews> rv = new ArrayList<>();
				reviews re5 = new reviews(rs.getInt("Rate5"));
				reviews re4 = new reviews(rs.getInt("Rate4"));
				reviews re3 = new reviews(rs.getInt("Rate3"));
				reviews re2 = new reviews(rs.getInt("Rate2"));
				reviews re1 = new reviews(rs.getInt("Rate1"));
				rv.add(re5);
				rv.add(re4);
				rv.add(re3);
				rv.add(re2);
				rv.add(re1);
				product.setReview_count(rs.getInt("userReviewed"));
				product.setRate(rv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	public List<Products> SelectByCategory(int type) {
		// TODO Auto-generated method stub
		List<Products> list = new ArrayList<Products>();
		String sql = "Select * from Products WHERE CategoryID=? LIMIT 4";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, type);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Products(rs.getInt("ProductsID"), rs.getString("productsName"), rs.getInt("categoryID"),
						rs.getBigDecimal("price"), rs.getString("status"), rs.getString("img"),
						rs.getString("DESCRIPTION")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Products selectByVariantId(int variantID) {
		Products p = null;

		String sql = "SELECT p.* FROM products p JOIN Products_variants pv ON p.productsID = pv.productID WHERE pv.variantID =?";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, variantID);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				p = new Products();
				p.setProductID(rs.getInt("productsID"));
				p.setProductName(rs.getString("productsName"));
				p.setCategoryID(rs.getInt("categoryID"));
				p.setPrice(rs.getBigDecimal("price"));
				p.setStatus(rs.getString("status"));
				p.setImg(rs.getString("img"));
				p.setDescription(rs.getString("description"));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}
	
	// phục vụ chức năng tìm kiếm
	public List<Products> searchProducts(String keyword) {
	    List<Products> products = new ArrayList<>();

	    String sql =
	        "SELECT p.* " +
	        "FROM Products p " +
	        "JOIN Category c ON p.categoryID = c.categoryID " +
	        "WHERE p.status = 'ACTIVE' AND ( " +
	        "   p.productsName LIKE ? " +
	        "   OR c.categoryName LIKE ? " +
	        ") " +
	        "ORDER BY p.ProductsID DESC";

	    try (Connection conn = getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        String key = "%" + keyword.trim() + "%";
	        ps.setString(1, key);
	        ps.setString(2, key);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            products.add(new Products(
	                rs.getInt("ProductsID"),
	                rs.getString("productsName"),
	                rs.getInt("categoryID"),
	                rs.getBigDecimal("price"),
	                rs.getString("status"),
	                rs.getString("img"),
	                rs.getString("DESCRIPTION")
	            ));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return products;
	}


}
