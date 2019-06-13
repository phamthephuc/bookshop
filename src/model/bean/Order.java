package model.bean;

import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class Order {
	private int id_order;
	private int id_user;
	
	@NotBlank
	@Size(min=5,max=200)
	private String fullname;
	
	@Email
	private String email;
	
	@NotBlank
	@Size(min=10,max=11)
	private String phone;
	
	@NotBlank
	@Size(min=6,max=200)
	private String address_ship;
	
	private float amount;
	private int id_payment;
	private String message;
	private Date date_create_order;
	private int id_status;
	private String name_payment;
	private String name_status;
	public int getId_order() {
		return id_order;
	}
	public void setId_order(int id_order) {
		this.id_order = id_order;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress_ship() {
		return address_ship;
	}
	public void setAddress_ship(String address_ship) {
		this.address_ship = address_ship;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public int getId_payment() {
		return id_payment;
	}
	public void setId_payment(int id_payment) {
		this.id_payment = id_payment;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getDate_create_order() {
		return date_create_order;
	}
	public void setDate_create_order(Date date_create_order) {
		this.date_create_order = date_create_order;
	}
	public int getId_status() {
		return id_status;
	}
	public void setId_status(int id_status) {
		this.id_status = id_status;
	}
	public String getName_payment() {
		return name_payment;
	}
	public void setName_payment(String name_payment) {
		this.name_payment = name_payment;
	}
	public String getName_status() {
		return name_status;
	}
	public void setName_status(String name_status) {
		this.name_status = name_status;
	}
	public Order(int id_order, int id_user, String fullname, String email, String phone, String address_ship,
			int amount, int id_payment, String message, Date date_create_order, int id_status, String name_payment,
			String name_status) {
		super();
		this.id_order = id_order;
		this.id_user = id_user;
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
		this.address_ship = address_ship;
		this.amount = amount;
		this.id_payment = id_payment;
		this.message = message;
		this.date_create_order = date_create_order;
		this.id_status = id_status;
		this.name_payment = name_payment;
		this.name_status = name_status;
	}
	public Order() {
		super();
	}
	
	
}
