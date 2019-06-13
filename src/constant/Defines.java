package constant;

public class Defines {
	// định nghĩa các thông số cho ứng dụng web
	private String urlPublic;
	private String urlAdmin;
	public static final String SUCCESS = "Xử lý thành công"; 
	public static final String ERROR = "Có lỗi xảy ra"; 
	public static final String NOT_ALLOWED = "Không có quyền thực hiện chức năng";
	public static final int ROW_COUNT = 20;
	public static final String DIR_UPLOAD = "files"; 
	public static final int MAX_BOOK_SHOW = 20;
	public static final String orderingByPrice = "price";
	public static final String orderingBy = "price";
	public static final long FREE_SHIP_PRICE = 250000;
	public static final long SHIP_FEE = 20000;
	public String getUrlPublic() {
		return urlPublic;
	}
	public void setUrlPublic(String urlPublic) {
		this.urlPublic = urlPublic;
	}
	public String getUrlAdmin() {
		return urlAdmin;
	}
	public void setUrlAdmin(String urlAdmin) {
		this.urlAdmin = urlAdmin;
	}
	
	
}
