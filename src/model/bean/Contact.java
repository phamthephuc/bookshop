package model.bean;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class Contact {
	@NotBlank
	private int cid;
	
	@NotBlank
	@Size(min=5,max=200)
	private String fullname;
	
	@Email
	private String email;
	
	@NotBlank
	@Size(min=10,max=12)
	private String phone;
	
	@NotBlank
	@Size(min=20,max=200)
	private String content;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Contact(int cid, String fullname, String email, String phone, String content) {
		super();
		this.cid = cid;
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
		this.content = content;
	}
	public Contact() {
		super();
	}
	
	
	
}
