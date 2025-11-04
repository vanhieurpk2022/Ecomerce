package dao;

import model.User;

public interface IDao {

	boolean addUser(User user);
	
	boolean checkAccount(String username);
	public boolean SelectUsernameIsContains(String username) ;
	public User getFullName(String username);
}
