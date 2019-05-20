package model.bean;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class Publisher {
	private int pid;
	@NotBlank
	@Size(min=5,max=200)
	private String name;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Publisher(int pid, String name) {
		super();
		this.pid = pid;
		this.name = name;
	}
	public Publisher() {
		super();
	}

}
