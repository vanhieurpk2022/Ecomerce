package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
import util.JDBCUtil;

public class UserDao implements IDao {

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
		return true;
	}
	public boolean SelectUsernameIsContains(String username) {
		try {
			Connection conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM USER WHERE username=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				return false;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		
		
		return true;
	}
}
