package model;

public class Address {
	private Integer addressID;
	private Integer userID;
	private String fullAddress;
	private String city;
	private String district;
	private String ward;
	private String phone;
	private Boolean isDefault;

	public Address(Integer addressID, Integer userID, String fullAddress, String city, String district, String ward,
			String phone, Boolean isDefault) {
		super();
		this.addressID = addressID;
		this.userID = userID;
		this.fullAddress = fullAddress;
		this.city = city;
		this.district = district;
		this.ward = ward;
		this.phone = phone;
		this.isDefault = isDefault;
	}

	public Address() {
		super();
	}

	public Integer getAddressID() {
		return addressID;
	}

	public void setAddressID(Integer addressID) {
		this.addressID = addressID;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getWard() {
		return ward;
	}

	public void setWard(String ward) {
		this.ward = ward;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Boolean getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}

}
