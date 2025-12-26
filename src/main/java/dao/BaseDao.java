package dao;

import java.sql.Connection;

import util.JDBCUtil;

public class BaseDao {
	protected Connection getConnection() throws Exception {
        return JDBCUtil.getConnection();
    }	
	

}
