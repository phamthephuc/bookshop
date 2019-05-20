package model.bean;
import javax.validation.constraints.Size;

public class Payment {
	private int id;
	private String name;
	public Payment(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Size(min=5,max=200)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Payment() {
		super();
	}
	
	
}
