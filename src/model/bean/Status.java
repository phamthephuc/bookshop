package model.bean;

import javax.validation.constraints.Size;

public class Status {
	private int id_status;
	
	@Size(min=5,max=200)
	private String name_status;
	public int getId_status() {
		return id_status;
	}
	public void setId_status(int id_status) {
		this.id_status = id_status;
	}
	public String getName_status() {
		return name_status;
	}
	public void setName_status(String name_status) {
		this.name_status = name_status;
	}
	public Status(int id_status, String name_status) {
		super();
		this.id_status = id_status;
		this.name_status = name_status;
	}
	public Status() {
		super();
	}
	
}
