package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
import util.JDBCUtil;

public class UserDao extends BaseDao {

	public boolean addUser(User user) {
		  String sql = "INSERT INTO USERS(firstname,lastname,email,verify,username,password) VALUES (?,?,?,?,?,?)";
		    
		    int result =0;
		    try (Connection conn = JDBCUtil.getConnection();
		         PreparedStatement ps = conn.prepareStatement(sql)) {
		        
		        ps.setString(1, user.getFirstName());
		        ps.setString(2, user.getLastName());
		        ps.setString(3, user.getEmail());
		        ps.setInt(4, user.getVerify() ? 1 : 0); // Thử đổi từ setBoolean sang setInt
		        ps.setString(5, user.getUsername());
		        ps.setString(6, user.getPassword());
		        
		        result= ps.executeUpdate();
		        
		        System.out.println("số dòng ảnh hưởng:"+sql);
		        System.out.println("số dòng ảnh hưởng:"+result);
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		return result >0;
	}
	public boolean SelectUsernameIsContains(String username) {
		try {
			Connection conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM USERS WHERE username=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			ResultSet result = pst.executeQuery();
			return result.next();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}	
		
		
		return false;
	}
	
	public boolean checkAccount(String username) {
		try {
			Connection conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM USERS WHERE username=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			ResultSet result = pst.executeQuery();
			return result.next();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	public User getFullName(String username) {
		try {
			Connection conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM USERS WHERE username=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			ResultSet result = pst.executeQuery();
			User user = new User();
			while(result.next()) {
			user.setIdUser(result.getInt("userID"));
			user.setFirstName(result.getString("firstName"));
			user.setLastName(result.getString("lastName"));
			user.setEmail(result.getString("email"));
			//user.setAddress(result.getInt("address"));
			
			user.setVerify((result.getInt("verify") ==1)?true:false);
			user.setUsername(result.getString("username"));
			user.setPassword(result.getString("password"));

			}
			return user;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return null;
	} 
}
