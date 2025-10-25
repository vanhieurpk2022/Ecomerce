package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	private static final String URL ="jdbc:mysql://localhost:3306/clothestore";
	private static final String USER ="root";
	private static final String PASSWORD="";
	
	public static Connection getConnection() {
		Connection con = null;
	
		try {
			
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            
            // tạo kết nối
            con =DriverManager.getConnection(URL,USER,PASSWORD);
            
		} catch (ClassNotFoundException  e) {
			// TODO: handle exception
			System.out.println("Không tìm thấy driver mysql");
		} catch(SQLException e) {
			System.out.println("Lỗi kết nối CSDL");
			e.printStackTrace();
		}
		return con;
	}
	 public static void main(String[] args) {
	        getConnection();
	    }
}
