package model;

import java.util.List;

public class User {
	private Integer idUser;
	private String firstName;
	private String lastName;
	private String email;
	private List<String> address;
	private Boolean verify;
	private String username;
	private String password;
	private Integer role;
	
	
	public User(Integer idUser, String firstName, String lastName, String email, List<String> address, Boolean verify,
			String username, String password) {
		super();
		this.idUser = idUser;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.verify = verify;
		this.username = username;
		this.password = password;
		
		
	}
	public User( String firstName, String lastName,String email, Boolean verify,
			String username, String password, Integer role) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.verify = verify;
		this.username = username;
		this.password = password;
		this.role=role;
	}
	public User() {
		super();
	}
	public Integer getIdUser() {
		return idUser;
	}
	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public List<String> getAddress() {
		return address;
	}
	public void setAddress(List<String> address) {
		this.address = address;
	}
	public Boolean getVerify() {
		return verify;
	}
	public void setVerify(Boolean verify) {
		this.verify = verify;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	

}
