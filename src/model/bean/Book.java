package model.bean;

import java.sql.Date;
import java.sql.Timestamp;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

public class Book {
	private int bid;
	@Size(min=5,max=200)
	private String book_name;
	private int category_id;
	private String category_name;
	private int author_id;
	private int publisher_id;
	private String author_name;
	private String publisher_name;
	@Min(1)
	private float price;
	@Min(1)
	@Max(100)
	private int sale;
	private Date realease_date;
	private String picture;
	@Min(0)
	@Size(min=20,max=200)
	private String preview;
	private int number_rest;
	@Min(0)
	private int number_start;
	@Min(1)
	private int pages;
	private boolean is_active;
	

	
	public int getNumber_start() {
		return number_start;
	}
	public void setNumber_start(int number_start) {
		this.number_start = number_start;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getNumber_rest() {
		return number_rest;
	}
	public void setNumber_rest(int number_rest) {
		this.number_rest = number_rest;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
	}
	public Book() {
		super();
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBook_name() {
		return book_name;
	}
	
	
	public Book(int bid, String book_name, int category_id, int author_id, int publisher_id, float price, int sale,
			Date realease_date, String picture, String preview, int number_rest, int number_start, int pages,
			boolean is_active) {
		super();
		this.bid = bid;
		this.book_name = book_name;
		this.category_id = category_id;
		this.author_id = author_id;
		this.publisher_id = publisher_id;
		this.price = price;
		this.sale = sale;
		this.realease_date = realease_date;
		this.picture = picture;
		this.preview = preview;
		this.number_rest = number_rest;
		this.number_start = number_start;
		this.pages = pages;
		this.is_active = is_active;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}
	public int getPublisher_id() {
		return publisher_id;
	}
	public void setPublisher_id(int publisher_id) {
		this.publisher_id = publisher_id;
	}
	public Date getRealease_date() {
		return realease_date;
	}
	public void setRealease_date(Date realease_date) {
		this.realease_date = realease_date;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public boolean isIs_active() {
		return is_active;
	}
	public void setIs_active(boolean is_active) {
		this.is_active = is_active;
	}
	public String getAuthor_name() {
		return author_name;
	}
	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}
	public String getPublisher_name() {
		return publisher_name;
	}
	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
	}
	public Book(int bid, String book_name, int category_id, String category_name, int author_id, int publisher_id,
			float price, int sale, Date realease_date, String picture, String preview, int number_rest,
			int number_start, int pages, boolean is_active, String author_name, String publisher_name) {
		super();
		this.bid = bid;
		this.book_name = book_name;
		this.category_id = category_id;
		this.category_name = category_name;
		this.author_id = author_id;
		this.publisher_id = publisher_id;
		this.price = price;
		this.sale = sale;
		this.realease_date = realease_date;
		this.picture = picture;
		this.preview = preview;
		this.number_rest = number_rest;
		this.number_start = number_start;
		this.pages = pages;
		this.is_active = is_active;
		this.author_name = author_name;
		this.publisher_name = publisher_name;
	}
	
	@Override
	public String toString() {
		return this.getBook_name();
	}
	
}
