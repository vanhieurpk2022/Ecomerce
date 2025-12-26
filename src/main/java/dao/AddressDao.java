package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Address;

public class AddressDao extends BaseDao{
	public List<Address> selectAddressByUserID(int id){
		List<Address> list = new ArrayList<Address>();
		String sql = "select * from address where userID =? ORDER BY isDefault DESC";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
		while(result.next()) {
			Address add = new Address();
			add.setAddressID(result.getInt("addressID"));
			add.setFullAddress(result.getString("fulladdress"));
			add.setDistrict(result.getString("district"));
			add.setCity(result.getString("city"));
			add.setWard(result.getString("ward"));
			add.setPhone(result.getString("phone"));
			add.setUserID(result.getInt("userID"));
			add.setIsDefault(result.getBoolean("isDefault"));
			
			list.add(add);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean addAddressByUserID( Address address) {
		String sql = "insert into address(fulladdress,district,city,ward,phone,userID,isDefault) values(?,?,?,?,?,?,?)";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setString(1, address.getFullAddress());
			ps.setString(2, address.getDistrict());
			ps.setString(3, address.getCity());

			ps.setString(4, address.getWard());
			ps.setString(5, address.getPhone());
			ps.setInt(6, address.getUserID());

			ps.setBoolean(7, address.getIsDefault());


			int result = ps.executeUpdate();
			return result >0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean deleteAddressByID( int id ) {
		String sql = "delete FROM address where addressID=?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, id);
			
			int result = ps.executeUpdate();
			return result >0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean updateAllIsDefaultAddress(int userID) {
		String sql = "UPDATE  address SET isDefault = 0 where userID=?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, userID);
			
			int result = ps.executeUpdate();
			return result >0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean updateCurrentAddressByID(int id, int userID) {
		// reset lại các point
		updateAllIsDefaultAddress(userID);
		String sql = "UPDATE  address SET isDefault = 1 where addressID=?  AND userID=? ";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setInt(1, id);
			ps.setInt(2, userID);

			int result = ps.executeUpdate();
			return result >0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
