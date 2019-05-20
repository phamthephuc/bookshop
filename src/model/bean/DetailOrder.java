package model.bean;

public class DetailOrder {
	private int id_detailOrder;
	private int id_order;
	private int id_pro;
	private int qty;
	private String name_pro;
	private float price;
	private int sale;
	public int getId_detailOrder() {
		return id_detailOrder;
	}
	public void setId_detailOrder(int id_detailOrder) {
		this.id_detailOrder = id_detailOrder;
	}
	public int getId_order() {
		return id_order;
	}
	public void setId_order(int id_order) {
		this.id_order = id_order;
	}
	public int getId_pro() {
		return id_pro;
	}
	public void setId_pro(int id_pro) {
		this.id_pro = id_pro;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getName_pro() {
		return name_pro;
	}
	public void setName_pro(String name_pro) {
		this.name_pro = name_pro;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public DetailOrder() {
		super();
	}
	
	public DetailOrder(int id_pro, int qty) {
		super();
		this.id_pro = id_pro;
		this.qty = qty;
	}
	public DetailOrder(int id_detailOrder, int id_order, int id_pro, int qty, String name_pro, float price, int sale) {
		super();
		this.id_detailOrder = id_detailOrder;
		this.id_order = id_order;
		this.id_pro = id_pro;
		this.qty = qty;
		this.name_pro = name_pro;
		this.price = price;
		this.sale = sale;
	}
	
	
}
