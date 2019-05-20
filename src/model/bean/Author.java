package model.bean;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class Author {
	private int aid;
	@NotBlank
	@Size(min=5,max=200)
	private String name;
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Author(int aid, String name) {
		super();
		this.aid = aid;
		this.name = name;
	}
	public Author() {
		super();
	}

}
