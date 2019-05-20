package model.bean;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

public class SaleCode {
	private int id_code;
	
	@Size(min=20,max=200)
	private String code;
	
	@Min(1)
	@Max(100)
	private int discount;
	
	@Min(1)
	@Max(2000)
	private int number_rest;
	public int getId_code() {
		return id_code;
	}
	public void setId_code(int id_code) {
		this.id_code = id_code;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getNumber_rest() {
		return number_rest;
	}
	public void setNumber_rest(int number_rest) {
		this.number_rest = number_rest;
	}
	public SaleCode(int id_code, String code, int discount, int number_rest) {
		super();
		this.id_code = id_code;
		this.code = code;
		this.discount = discount;
		this.number_rest = number_rest;
	}
	public SaleCode() {
		super();
	}
	
	
	
}
