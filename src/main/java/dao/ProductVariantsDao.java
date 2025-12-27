package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.ProductVariants;
import model.Products;

public class ProductVariantsDao extends BaseDao{
	public ProductVariants SelectByProductVariantID(int variantID) {
		// TODO Auto-generated method stub
				ProductVariants variants=null;
				String sql = "Select * from products_variants  WHERE variantID = ? LIMIT 1";

				try(	Connection conn = getConnection();
						PreparedStatement ps = conn.prepareStatement(sql);) {

				
					ps.setInt(1, variantID);
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						variants = new ProductVariants();
						variants.setVariantID(rs.getInt("variantID"));
						variants.setProductID(rs.getInt("productID"));
						variants.setSize(rs.getString("size"));
						variants.setSku(rs.getString("sku"));
						variants.setPriceAdjustment(rs.getBigDecimal("priceAdjustment"));;
						variants.setStock(rs.getInt("stock"));
					
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return variants;
	}
	public List<ProductVariants> SelectByProductIDInProductVariants(int id) {
		// TODO Auto-generated method stub
		ProductVariants productVariants=null;
		List<ProductVariants> list = new ArrayList<>();
		String sql = "Select * from products_variants WHERE productID = ?";

		try(	Connection conn =getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);) {

		
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			System.out.println("Đã thực thi câu lệnh:" +sql);
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
		Products products=null;
		String sql = "Select p.img,p.productsName,p.price from products_variants v  JOIN products p ON p.ProductsID = v.productID WHERE v.variantID = ?";
		try(
				Connection conn = getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);) {

			
			ps.setInt(1, variantID);
			ResultSet rs = ps.executeQuery();
			
			System.out.println("Đã thực thi câu lệnh:" +sql);
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
	public List<String> getColorBySize(int productid,String size){
		List<String> color= new ArrayList<String>();
		String sql = "Select DISTINCT color FROM products_Variants where productID=? AND size=? AND status='active'";
		try(
				Connection conn = getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);) {

			
			ps.setInt(1, productid);
			ps.setString(2, size);
			ResultSet rs = ps.executeQuery();
			
			System.out.println("Đã thực thi câu lệnh:" +sql);
			while (rs.next()) {
				String c = rs.getString("color");
				color.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return color;
	}
}
