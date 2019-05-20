package model.bean;

import javax.validation.constraints.Size;

public class Slide {
	private int id_slide;
	
	@Size(min=0,max=2000)
	private String picture;
	
	@Size(min=0,max=2000)
	private String link;
	public int getId_slide() {
		return id_slide;
	}
	public void setId_slide(int id_slide) {
		this.id_slide = id_slide;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Slide(int id_slide, String picture, String link) {
		super();
		this.id_slide = id_slide;
		this.picture = picture;
		this.link = link;
	}
	public Slide() {
		super();
	}
	
}
