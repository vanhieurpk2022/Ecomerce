package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Address;
import model.Category;
import model.Order;
import model.OrderDetail;
import model.ProductVariants;
import model.Products;
import model.User;
import util.Encode;

public class AdminDao extends BaseDao{

	public int selectTotalUser(){
		String sql = "select count(*) from users";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ResultSet result = ps.executeQuery();
		result.next();
		return result.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int selectSumRevenue(){
		String sql = "SELECT SUM(o.totalAmount) AS doanhthu FROM orders o where o.status='SUCCESS'";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ResultSet result = ps.executeQuery();
		result.next();
		return result.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int selectCountOrders(){
		String sql = "SELECT count(*) as TongDonHang FROM orders";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ResultSet result = ps.executeQuery();
		result.next();
		return result.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int selectTotalProducts(){
		String sql = "select count(*) as TongSanPham FROM products";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ResultSet result = ps.executeQuery();
		result.next();
		return result.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public List<Order> selectOrdersRecent(){
		List<Order> list = new ArrayList<Order>();
		Order or = null;
		String sql = "SELECT o.*,u.*  FROM orders o "
				+ "JOIN users u ON u.userID = o.userID ORDER BY o.createdAt DESC LIMIT 5";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				or=  new Order();
				or.setOrderID(rs.getInt("orderID"));
				or.setStatus(rs.getString("STATUS"));
				or.setCreatedAt(rs.getTimestamp("createdAt"));
				or.setTotalAmount(rs.getBigDecimal("totalAmount"));
				or.setPaymentMethod(rs.getString("paymentMethod"));
				User us = new User();
				us.setFirstName(rs.getString("firstName"));
				us.setLastName(rs.getString("lastName"));
		
			
				or.setUser(us);	
				list.add(or);
			}
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public List<User> selectListUser(){
		List<User> list = new ArrayList<User>();
		String sql = "SELECT u.*,oa.SoDonDaMua FROM users u\r\n"
				+ "JOIN (SELECT COUNT(*) AS SoDonDaMua,o.userID FROM orders o) oa ON oa.userID =u.userID;";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			User s1 = new User();
			s1.setIdUser(rs.getInt("userID"));
			s1.setFirstName(rs.getString("firstName"));
			s1.setLastName(rs.getString("lastName"));
			s1.setEmail(rs.getString("email"));
			s1.setPhone(rs.getString("Phone"));
			s1.setPuchasedOrders(rs.getInt("SoDonDaMua"));
			s1.setStatus(rs.getInt("status"));
			s1.setCreatedAt(rs.getTimestamp("createAt"));
			list.add(s1);
			}
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean bannedAccount(int userID){
		String sql = "UPDATE USERS SET status =0 WHERE userID =?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, userID);
			int re = ps.executeUpdate();
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean unBannedAccount(int userID){
		String sql = "UPDATE USERS SET status =1 WHERE userID =?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, userID);
			int re = ps.executeUpdate();
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean deleteAccount(int userID){
		String sql = "UPDATE  users SET status=-1 WHERE userID= ?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, userID);

			int re = ps.executeUpdate();
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean resetPassword(int userID){
		String passwordReset = Encode.hash("123456");
		String sql = "UPDATE USERS SET password="+passwordReset +" WHERE userID=?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, userID);

			int re = ps.executeUpdate();
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public List<ProductVariants> selectProductVariantsByProductsID(int productID){
		List<ProductVariants> listProducts = new ArrayList<ProductVariants>();
		String sql = "SELECT \r\n"
				+ "    pv.variantID,\r\n"
				+ "    pv.productID,\r\n"
				+ "    pv.size,\r\n"
				+ "    pv.status,\r\n"
				+ "    pv.stock,\r\n"
				+ "    pv.priceAdjustment,\r\n"
				+ "    p.img,\r\n"
				+ "    p.productsName,\r\n"
				+ "    COALESCE(SUM(od.quantity), 0) AS sold,\r\n"
				+ "    (p.price + pv.priceAdjustment) AS finalPrice\r\n"
				+ "FROM products_variants pv\r\n"
				+ "LEFT JOIN order_details od \r\n"
				+ "    ON od.variantID = pv.variantID\r\n"
				+ "JOIN products p \r\n"
				+ "    ON p.ProductsID = pv.productID\r\n"
				+ "WHERE pv.productID = ?\r\n"
				+ "GROUP BY \r\n"
				+ "    pv.variantID,\r\n"
				+ "    pv.productID,\r\n"
				+ "    pv.size,\r\n"
				+ "    pv.status,\r\n"
				+ "    pv.stock,\r\n"
				+ "    pv.priceAdjustment,\r\n"
				+ "    p.img,\r\n"
				+ "    p.productsName,\r\n"
				+ "    p.price";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			
			ps.setInt(1, productID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ProductVariants pv = new ProductVariants();
				Products p = new Products();
				p.setImg(rs.getString("img"));
				p.setProductName(rs.getString("productsName"));
				
				pv.setProducts(p);
				pv.setSold(rs.getInt("sold"));
				pv.setVariantID(rs.getInt("variantID"));
				pv.setProductID(rs.getInt("productID"));
				pv.setFinalPrice(rs.getBigDecimal("finalPrice"));
				pv.setPriceAdjustment(rs.getBigDecimal("priceAdjustment"));
				pv.setStatus(rs.getString("status").toUpperCase());
				pv.setStock(rs.getInt("stock"));
				pv.setSize(rs.getNString("size"));
				
				listProducts.add(pv);
			}
			return listProducts;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public List<Products> selectListProducts(){
		List<Products> listProducts = new ArrayList<Products>();
		String sql = "SELECT \r\n"
				+ "    p.*,\r\n"
				+ "    c.categoryName,\r\n"
				+ "    IFNULL(v.SoLuongBienThe, 0) AS SoLuongBienThe\r\n"
				+ "FROM products p\r\n"
				+ "JOIN category c ON c.categoryID = p.categoryID\r\n"
				+ "LEFT JOIN (\r\n"
				+ "    SELECT productID, COUNT(*) AS SoLuongBienThe\r\n"
				+ "    FROM products_variants\r\n"
				+ "    GROUP BY productID\r\n"
				+ ") v ON v.productID = p.ProductsID\r\n"
				+ "ORDER BY p.ProductsID;";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Products p1 = new Products();
				p1.setProductID(rs.getInt("ProductsID"));
				p1.setProductName(rs.getString("productsName"));
				
				Category cate = new Category();
				cate.setCategoryName(rs.getString("categoryName"));
				p1.setCate(cate);
				
				p1.setPrice(rs.getBigDecimal("price"));
				p1.setStatus(rs.getString("status").toUpperCase());
				p1.setQuantityVariantCurr(rs.getInt("SoLuongBienThe"));
				listProducts.add(p1);
			}
			return listProducts;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public Products selectProductsById(int getId) {
	Products listProducts = null;
		String sql = "SELECT p.* FROM products p WHERE p.productsID = ?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, getId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				 listProducts = new Products();
				 listProducts.setStatus(rs.getString("status"));
				 listProducts.setProductID(rs.getInt("productsID"));
				 
			}
			
			return listProducts;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean lockProductsByProductsID(int getId) {
		String sql = "UPDATE PRODUCTS SET status ='LOCK' WHERE productsID =?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, getId);
			int re = ps.executeUpdate();
			
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean unLockProductsByProductsID(int getId) {
		String sql = "UPDATE PRODUCTS SET status ='ACTIVE' WHERE productsID =?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, getId);
			int re = ps.executeUpdate();
			
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean lockProductsByVariantID(int getId) {
		// TODO Auto-generated method stub
		String sql = "UPDATE products_variants SET status ='LOCK' WHERE variantID =?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, getId);
			int re = ps.executeUpdate();
			
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean unLockProductsByVariantID(int getId) {
		// TODO Auto-generated method stub
		String sql = "UPDATE products_variants SET status ='ACTIVE' WHERE variantID =?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, getId);
			int re = ps.executeUpdate();
			
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean insertVariant(ProductVariants pv) {
		String sql = "INSERT INTO products_variants\r\n"
				+ "(productID, size, priceAdjustment, stock, status)\r\n"
				+ "VALUES\r\n"
				+ "(?, ?, ?, ?, ?);";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, pv.getProductID());
			ps.setString(2, pv.getSize());
			ps.setBigDecimal(3, pv.getPriceAdjustment());
			ps.setInt(4, pv.getStock());
			ps.setString(5, pv.getStatus());
			
			int re = ps.executeUpdate();
			
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean insertProduct(Products p) {
		String sql = "INSERT INTO Products \r\n"
				+ "( productsName, categoryID, price, status,img,description)\r\n"
				+ "VALUES\r\n"
				+ "(?, ?, ?, ?, ?,?);";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, p.getProductName());
			ps.setInt(2, p.getCategoryID());
			ps.setBigDecimal(3, p.getPrice());
			ps.setString(4, p.getStatus());
			ps.setString(5, p.getImg());
			ps.setString(6, p.getDescription());

			int re = ps.executeUpdate();
			
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public List<Category> selectAllCategory() {
		List<Category> cate = new ArrayList<Category>();
		String sql = "SELECT * FROM category";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
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
	public List<Order> getOrders() {
		List<Order> or = new ArrayList<Order>();
		String sql = "SELECT o.*,u.* FROM orders o JOIN users u ON u.userID = o.userID";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User u1 = new User();
				u1.setFirstName(rs.getString("firstName"));
				u1.setLastName(rs.getString("lastName"));
				u1.setPhone(rs.getString("phone"));
				
				
				Order o1=  new Order();
				o1.setUser(u1);
				o1.setOrderID(rs.getInt("orderID"));
				o1.setCreatedAt(rs.getTimestamp("createdAt"));
				o1.setTotalAmount(rs.getBigDecimal("totalAmount"));
				o1.setPaymentMethod(rs.getString("paymentMethod").toUpperCase());
				o1.setStatus(rs.getString("status").toUpperCase());
				or.add(o1);
			}
			return or;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public List<OrderDetail> getOrdersDetailsByOrderID(int orderID) {
		List<OrderDetail> or = new ArrayList<OrderDetail>();
		String sql = "SELECT od.*,pv.size,p.productsName,p.img, p.price + pv.priceAdjustment AS subVariant FROM order_details od \r\n"
				+ "JOIN products p ON p.ProductsID = od.productID \r\n"
				+ "JOIN products_variants pv ON pv.variantID = od.variantID \r\n"
				+ "WHERE orderID=?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			
			ps.setInt(1, orderID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				OrderDetail od = new OrderDetail();
				Products p = new Products();
				p.setImg(rs.getString("img"));
				p.setProductName(rs.getString("productsName"));
				od.setProduct(p);
				
				ProductVariants pv = new ProductVariants();
				pv.setSize(rs.getString("size"));
				
				od.setVariant(pv);
				od.setQuantity(rs.getInt("quantity"));
				od.setPrice(rs.getBigDecimal("price"));
				
				or.add(od);
			}
			return or;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public Order getOrdersFromOrderIDToOrderDetails(int orderID) {
		Order or = null;
		String sql = 
				"SELECT o.orderID,u.firstName,u.lastName,u.email,u.Phone,o.shipping_fee,o.discountAmount,o.totalAmount,ass.*,o.`STATUS`,o.paymentMethod,s.city_name,o.subtotal FROM orders o JOIN users u ON u.userID = o.userID  JOIN address ass ON ass.addressID = o.addressID JOIN shipping s ON s.city_code = ass.city_code WHERE   o.orderID=?;";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			
			ps.setInt(1, orderID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				or = new Order();
				or.setPaymentMethod(rs.getString("paymentMethod").toUpperCase());
				or.setShipping_fee(rs.getBigDecimal("shipping_fee"));
				or.setDiscountAmount(rs.getBigDecimal("discountAmount"));
				or.setTotalAmount(rs.getBigDecimal("totalAmount"));
				or.setStatus(rs.getString("status"));
				or.setSubtotal(rs.getBigDecimal("subtotal"));
				or.setOrderID(rs.getInt("orderID"));
				
				User u1 = new User();
				u1.setFirstName(rs.getString("firstName"));
				u1.setLastName(rs.getString("lastName"));
				u1.setEmail(rs.getString("email"));
				u1.setPhone(rs.getString("phone"));
				
				Address add =new Address();
				add.setFullAddress(rs.getString("fulladdress"));
				add.setWard(rs.getString("ward"));
				add.setCityName(rs.getString("city_name"));
				add.setCountry(rs.getString("country"));
				
				or.setUser(u1);
				or.setAddress(add);
				
				
			}
			return or;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public boolean updateNewStatusOrder(int orderID,String status) {
		String sql = "UPDATE orders SET status = ? WHERE orderID=?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			
			ps.setString(1, status);
			ps.setInt(2, orderID);
			int re = ps.executeUpdate();
		
			return re>0;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
