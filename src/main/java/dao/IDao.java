package dao;

import java.util.List;

import model.Products;
import model.User;

public interface IDao {

	boolean addUser(User user);
	
	boolean checkAccount(String username);
	public boolean SelectUsernameIsContains(String username) ;
	public User getFullName(String username);
	public List<Products> SelectAll(int offset,int limit);
	public Products SelectByProductID(int id);
	public List<Products> SelectByCategory(int type);
	
}
