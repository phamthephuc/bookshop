package model.bean;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class User {

	private int id;
	
	@Size(min=5,max=200)
	private String username;
	
	@Size(min=5,max=200)
	private String password;
	
	@Size(min=5,max=200)
	private String fullname;
	
	private int role_id;
	
	private int enable;
	
	@Email
	private String email;
	
	private String role_name;
	
	@Size(min=6,max=2000)
	private String address;
	
	@Size(min=10,max=12)
	private String phone;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public User(int id, String username, String password, String fullname, int role_id, int enable, String email,
			String role_name, String address, String phone) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.role_id = role_id;
		this.enable = enable;
		this.email = email;
		this.role_name = role_name;
		this.address = address;
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public User(int id, String username, String password, String fullname, int role_id, int enable,String email,String role_name,String address) {
		super();
		this.address = address;
		this.role_name = role_name;
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.role_id = role_id;
		this.enable = enable;
		this.email = email;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public User(int id, String username, String password, String fullname) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
	}
	
	public User() {
		super();
	}
	
	
}
