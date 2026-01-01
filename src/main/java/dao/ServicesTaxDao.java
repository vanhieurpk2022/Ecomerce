package dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;

import model.Address;

public class ServicesTaxDao extends BaseDao{
	
	public BigDecimal getPriceByCity(String city){
		String sql = "SELECT price FROM shipping WHERE city_name =?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setString(1, city);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				return result.getBigDecimal(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BigDecimal.ZERO;
	}
	public BigDecimal isCodeValid(String voucherCode){
		String sql = "SELECT discount FROM vouchers WHERE code =? AND status=1";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

			ps.setString(1, voucherCode);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				return result.getBigDecimal(1);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return BigDecimal.ZERO;

	}
}
