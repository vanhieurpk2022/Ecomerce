package model;

public class UserSession {
	private Integer idUser;
	private String username;
	private String fullName;
	private Integer role;
	public UserSession(Integer idUser, String username, String fullName, Integer role) {
		super();
		this.idUser = idUser;
		this.username = username;
		this.fullName = fullName;
		this.role = role;
	}
	
	public Integer getIdUser() {
		return idUser;
	}
	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	
	
}
