package model.bean;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class Category {

	private int cid;
	private int id_parent;
	
	private String name_parent;
	
	
	
	public String getName_parent() {
		return name_parent;
	}
	public void setName_parent(String name_parent) {
		this.name_parent = name_parent;
	}
	public int getId_parent() {
		return id_parent;
	}
	public void setId_parent(int id_parent) {
		this.id_parent = id_parent;
	}
	@NotBlank
	@Size(min=5,max=200)
	private String cname;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Category(int cid, String cname,int id_parent,String name_parent) {
		super();
		this.name_parent = name_parent;
		this.id_parent = id_parent;
		this.cid = cid;
		this.cname = cname;
	}
	public Category() {
		super();
	}
	
	
}
