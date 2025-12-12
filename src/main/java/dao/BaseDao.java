package dao;

import java.util.List;

import model.ProductVariants;
import model.Products;
import model.User;

public class BaseDao implements IDao{

	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkAccount(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean SelectUsernameIsContains(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User getFullName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Products> SelectAll(int offset,int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Products SelectByProductID(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Products> SelectByCategory(int type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductVariants SelectByProductVariantID(int variantID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVariants> SelectByProductIDInProductVariants(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Products getProductFromVariant(int variantID) {
		// TODO Auto-generated method stub
		return null;
	}


}
