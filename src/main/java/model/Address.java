package model;

public class Address {
	private Integer addressID;
	private String address;
	private String district;
	private String city;
	private String country;
	private String postalCode;
	public Address(Integer addressID, String address, String district, String city, String country, String postalCode) {
		super();
		this.addressID = addressID;
		this.address = address;
		this.district = district;
		this.city = city;
		this.country = country;
		this.postalCode = postalCode;
	}
	public Integer getAddressID() {
		return addressID;
	}
	public void setAddressID(Integer addressID) {
		this.addressID = addressID;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	
}
