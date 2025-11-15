package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Products;
import model.User;
import util.JDBCUtil;

public class ProductsDao extends BaseDao {

	@Override
	public List<Products> SelectAll(int offset,int limit) {
		List<Products> products = new ArrayList<>();
		try {
			int getOff = offset*limit;
			Connection conn = JDBCUtil.getConnection();
			String sql = "Select * from Products order by productID Limit ? offset ?;";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, limit);
			ps.setInt(2, getOff);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				products.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getBigDecimal(4),
						rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8)));

			}
			rs.close();
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return products;
	}

	public Products SelectByProductID(int id) {
		// TODO Auto-generated method stub
		Products product=null;
		try {

			Connection conn = JDBCUtil.getConnection();
			String sql = "Select * from Products WHERE productID = ? LIMIT 1";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				product = new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getBigDecimal(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
			}
			rs.close();
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}
	@Override
	public List<Products> SelectByCategory(int type) {
		// TODO Auto-generated method stub
		List<Products> list = new ArrayList<Products>();
		try {

			Connection conn = JDBCUtil.getConnection();
			String sql = "Select * from Products WHERE CategoryID=? LIMIT 4";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, type);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add( new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getBigDecimal(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8)));
			}
			rs.close();
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
