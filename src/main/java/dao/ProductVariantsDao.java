package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.ProductVariants;
import model.Products;

public class ProductVariantsDao extends BaseDao {
	public ProductVariants SelectByProductVariantID(int variantID) {
		// TODO Auto-generated method stub
		ProductVariants variants = null;
		String sql = "Select * from products_variants  WHERE variantID = ? LIMIT 1 " ;

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, variantID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				variants = new ProductVariants();
				variants.setVariantID(rs.getInt("variantID"));
				variants.setProductID(rs.getInt("productID"));
				variants.setSize(rs.getString("size"));
				variants.setSku(rs.getString("sku"));
				variants.setPriceAdjustment(rs.getBigDecimal("priceAdjustment"));
				;
				variants.setStock(rs.getInt("stock"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return variants;
	}

	public List<ProductVariants> SelectByProductIDInProductVariants(int id) {
		// TODO Auto-generated method stub
		ProductVariants productVariants = null;
		List<ProductVariants> list = new ArrayList<>();
		String sql = "Select * from products_variants WHERE productID = ?";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				productVariants = new ProductVariants();
				productVariants.setVariantID(rs.getInt("variantID"));
				productVariants.setProductID(rs.getInt("productID"));
				productVariants.setSize(rs.getString("size"));
				productVariants.setSku(rs.getString("sku"));
				productVariants.setPriceAdjustment(rs.getBigDecimal("priceAdjustment"));
				productVariants.setStock(rs.getInt("stock"));
				productVariants.setStatus(rs.getString("status"));
				list.add(productVariants);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Products getProductFromVariant(int variantID) {
		Products products = null;
		String sql = "Select p.img,p.productsName,p.price from products_variants v  JOIN products p ON p.ProductsID = v.productID WHERE v.variantID = ?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, variantID);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				products = new Products();
				products.setImg(rs.getString("img"));
				products.setProductName(rs.getString("productsName"));
				products.setPrice(rs.getBigDecimal("price"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public List<String> getColorBySize(int productid, String size) {
		List<String> color = new ArrayList<String>();
		String sql = "Select DISTINCT color FROM products_Variants where productID=? AND size=? AND status='active'";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, productid);
			ps.setString(2, size);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String c = rs.getString("color");
				color.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return color;
	}

	public ProductVariants selectById(int variantID) {
		ProductVariants variant = null;

		String sql = "SELECT * FROM products_variants WHERE variantID = ? AND Status='active'";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, variantID);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				variant = new ProductVariants();
				variant.setVariantID(rs.getInt("variantID"));
				variant.setProductID(rs.getInt("productID"));
				variant.setSize(rs.getString("size"));
				variant.setPriceAdjustment(rs.getBigDecimal("priceAdjustment"));
				variant.setStock(rs.getInt("stock"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return variant;
	}
	public ProductVariants selectToModify(int variantID, int productID) {
		ProductVariants variant = null;

		String sql = "SELECT * FROM products_variants WHERE variantID = ? AND productID=?";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, variantID);
			ps.setInt(2, productID);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				variant = new ProductVariants();
				variant.setSize(rs.getString("size"));
				variant.setPriceAdjustment(rs.getBigDecimal("priceAdjustment"));
				variant.setStock(rs.getInt("stock"));
				variant.setStatus(rs.getString("status").toUpperCase());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return variant;
	}
}
