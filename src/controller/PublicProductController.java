package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.bean.Book;
import model.bean.DetailOrder;
import model.dao.BookDao;
import model.dao.OrderDao;
import util.SlugUtil;

@Controller

public class PublicProductController {
	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private SlugUtil slugUtil;
	
	@RequestMapping(value = "addBookToCart", method = RequestMethod.POST, produces = "text/html ; charset=UTF-8")
	public @ResponseBody String addToCart(@RequestParam("aid_book") int id, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Book pro = bookDao.getItem(id);
		List<DetailOrder> listDetailOrder;
		if(session.getAttribute("listDetailOrder")  == null) {
			listDetailOrder = new ArrayList<>();
			DetailOrder detailOrder = new DetailOrder(id, 1);
			listDetailOrder.add(detailOrder);
		}
		else
		{
			boolean tonTaiTrongList = false;
			listDetailOrder = (List<DetailOrder>) session.getAttribute("listDetailOrder");
			for (DetailOrder detailOrder : listDetailOrder) {
				Book proTam = bookDao.getItem(detailOrder.getId_pro());
				if(proTam.getBid() == id) {
					detailOrder.setQty(detailOrder.getQty() + 1);
					tonTaiTrongList = true;
				}	
			}
			if(tonTaiTrongList == false) {
				listDetailOrder.add(new DetailOrder(id,1));
			}
		}
		
		session.setAttribute("listDetailOrder", listDetailOrder);
		session.setAttribute("numProduct", listDetailOrder.size());
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("<div id='showempty'></div><div class='blockcontent' id='showcart'><div class='cartadd'><i class='fa fa-check'></i>");
		stringBuilder.append(pro.getBook_name());
		stringBuilder.append("</div><div class='cartintro'>Bạn có <span id='cartnumber'>");
		stringBuilder.append(listDetailOrder.size());
		stringBuilder.append("</span> sản phẩm trong giỏ</div><table cellpadding='0' cellspacing='0' width='100%'><tbody><tr><td colspan='2'><table cellpadding='2' cellspacing='0' width='100%' id='thtitle'><tbody>");
		stringBuilder.append("<tr><th width='20%' colspan='2' align='left'>Sản phẩm trong giỏ</th><th width='20%' align='right'>Giá gốc</th><th width='20%' align='right'>Giá giảm</th><th width='20%' align='right'>Số lượng</th><th width='20%' align='right'>Thành tiền</th></tr>");
		stringBuilder.append("</tbody></table><div class='showboxcart' id='contentcart'><table cellpadding='2' cellspacing='0' width='100%' class='productscart'><tbody>");
		int sumMoney = 0;
		for (DetailOrder detailOrder : listDetailOrder) {
			Book bookInCart = bookDao.getItem(detailOrder.getId_pro());
			int bookId = bookInCart.getBid();
			stringBuilder.append("<tr id='proAdd" + bookId + "'><td nowrap='nowrap'>");
			stringBuilder.append("<img src='" + request.getContextPath() + "/files/" + bookInCart.getPicture() + "' width='40' height='50' alt='" + bookInCart.getBook_name() + "'> ");
			stringBuilder.append("</td>");
			stringBuilder.append("<td><div class='productname'> ");
			stringBuilder.append("<a href='" + request.getContextPath() + "/sach-truyen/" + bookId +"/"+ SlugUtil.makeSlug(bookInCart.getBook_name()) + ".html' title='" + bookInCart.getBook_name() + "'>" + bookInCart.getBook_name() + "</a></div></td>");
			stringBuilder.append("<td align='right' width='20%'><div class='sprice' style='text-decoration: line-through;' id='price2910'> ");
			stringBuilder.append((int)bookInCart.getPrice());
			stringBuilder.append("₫</div></td>");
			stringBuilder.append("<td align='right' width='20%'><div class='sprice' id='price" + bookId + "'> ");
			int realPrice = (int)(bookInCart.getPrice() - bookInCart.getSale() * bookInCart.getPrice() / 100);
			stringBuilder.append(realPrice);
			stringBuilder.append("₫</div></td>");
			stringBuilder.append("<td class='quantity' align='right' width='20%'><input name='quantity2910' onkeydown='validateUserInput();' type='number' size='3' maxlength='3' class='small' value='" + detailOrder.getQty() + "' onkeyup='changeQty( " + bookInCart.getBid() + " , this.value);' onchange='changeQty(" + bookInCart.getBid() + " , this.value);' autocomplete='off'><div style='padding-right:15px'><a href='javascript:' onclick='changeQty(" + bookId  + ", 0);'>Xóa</a></div></td><td align='right' width='20%'><span id='cart-intoMoney" + bookId + "'>");
			stringBuilder.append(realPrice * detailOrder.getQty());
			stringBuilder.append(" ₫</span></td></tr>");
			sumMoney += realPrice * detailOrder.getQty();
		}
		stringBuilder.append("</tbody></table></div>");
		stringBuilder.append("<table cellpadding='2' cellspacing='1' width='100%'><tbody>");
		stringBuilder.append("<tr id='couponvalue' style='display:none'><td class='cardtool'><b>Ưu đãi</b></td><td class='cart-subtotal cardtool'><span id='cart-coupon'>0 ₫</span></td></tr><tr><td class='cardtool'><b>Thành tiền:</b></td><td class='cart-subtotal cardtool'><span id='cart-total'><b> ");
		stringBuilder.append(sumMoney);
		stringBuilder.append("₫</b></span></td></tr></tbody></table></td></tr><tr class='actions'><td><a href='javascript:void(0)' class='continue' onclick='return closeCart();'><i class='fa fa-play'></i> Thêm sản phẩm khác vào giỏ hàng</a></td><td align='right' style='padding-top:10px;'><a href='" + request.getContextPath() + "/thong-tin-giao-hang' class='redbuttom'>Thực hiện thanh toán</a></td></tr></tbody></table></td></tr></tbody></table></div>");
		return stringBuilder.toString();
	}
	
	@RequestMapping(value = "showBookToCart", method = RequestMethod.POST, produces = "text/html ; charset=UTF-8")
	public @ResponseBody String showCart(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		List<DetailOrder> listDetailOrder;
		if(session.getAttribute("listDetailOrder")  == null) {
			return "<div id='showempty'><div class=\"empty\">Giỏ hàng chưa có sản phẩm</div></div>";
		}
		else
		{
			listDetailOrder = (List<DetailOrder>) session.getAttribute("listDetailOrder");
			session.setAttribute("listDetailOrder", listDetailOrder);
			session.setAttribute("numProduct", listDetailOrder.size());
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("<div id='showempty'></div><div class='blockcontent' id='showcart'>");
			stringBuilder.append("<div class='cartintro'>Bạn có <span id='cartnumber'>");
			stringBuilder.append(listDetailOrder.size());
			stringBuilder.append("</span> sản phẩm trong giỏ</div><table cellpadding='0' cellspacing='0' width='100%'><tbody><tr><td colspan='2'><table cellpadding='2' cellspacing='0' width='100%' id='thtitle'><tbody>");
			stringBuilder.append("<tr><th width='20%' colspan='2' align='left'>Sản phẩm trong giỏ</th><th width='20%' align='right'>Giá gốc</th><th width='20%' align='right'>Giá giảm</th><th width='20%' align='right'>Số lượng</th><th width='20%' align='right'>Thành tiền</th></tr>");
			stringBuilder.append("</tbody></table><div class='showboxcart' id='contentcart'><table cellpadding='2' cellspacing='0' width='100%' class='productscart'><tbody>");
			int sumMoney = 0;
			for (DetailOrder detailOrder : listDetailOrder) {
				Book bookInCart = bookDao.getItem(detailOrder.getId_pro());
				int bookId = bookInCart.getBid();
				stringBuilder.append("<tr id='proAdd" + bookId + "'><td nowrap='nowrap'>");
				stringBuilder.append("<img src='" + request.getContextPath() + "/files/" + bookInCart.getPicture() + "' width='40' height='50' alt='" + bookInCart.getBook_name() + "'> ");
				stringBuilder.append("</td>");
				stringBuilder.append("<td><div class='productname'> ");
				stringBuilder.append("<a href='" + request.getContextPath() + "/sach-truyen/" + bookId +"/"+ SlugUtil.makeSlug(bookInCart.getBook_name()) + ".html' title='" + bookInCart.getBook_name() + "'>" + bookInCart.getBook_name() + "</a></div></td>");
				stringBuilder.append("<td align='right' width='20%'><div class='sprice' style='text-decoration: line-through;' id='price2910'> ");
				stringBuilder.append((int)bookInCart.getPrice());
				stringBuilder.append("₫</div></td>");
				stringBuilder.append("<td align='right' width='20%'><div class='sprice' id='price" + bookId + "'> ");
				int realPrice = (int)(bookInCart.getPrice() - bookInCart.getSale() * bookInCart.getPrice() / 100);
				stringBuilder.append(realPrice);
				stringBuilder.append("₫</div></td>");
				stringBuilder.append("<td class='quantity' align='right' width='20%'><input name='quantity2910' onkeydown='validateUserInput();' type='number' size='3' maxlength='3' class='small' value='" + detailOrder.getQty() + "' onkeyup='changeQty( " + bookInCart.getBid() + " , this.value);' onchange='changeQty(" + bookInCart.getBid() + " , this.value);' autocomplete='off'><div style='padding-right:15px'><a href='javascript:' onclick='changeQty(" + bookId  + ", 0);'>Xóa</a></div></td><td align='right' width='20%'><span id='cart-intoMoney" + bookId + "'>");
				stringBuilder.append(realPrice * detailOrder.getQty());
				stringBuilder.append(" ₫</span></td></tr>");
				sumMoney += realPrice * detailOrder.getQty();
			}
			stringBuilder.append("</tbody></table></div>");
			stringBuilder.append("<table cellpadding='2' cellspacing='1' width='100%'><tbody>");
			stringBuilder.append("<tr id='couponvalue' style='display:none'><td class='cardtool'><b>Ưu đãi</b></td><td class='cart-subtotal cardtool'><span id='cart-coupon'>0 ₫</span></td></tr><tr><td class='cardtool'><b>Thành tiền:</b></td><td class='cart-subtotal cardtool'><span id='cart-total'><b> ");
			stringBuilder.append(sumMoney);
			stringBuilder.append("₫</b></span></td></tr></tbody></table></td></tr><tr class='actions'><td><a href='javascript:void(0)' class='continue' onclick='return closeCart();'><i class='fa fa-play'></i> Thêm sản phẩm khác vào giỏ hàng</a></td><td align='right' style='padding-top:10px;'><a href='" + request.getContextPath() +"/thong-tin-giao-hang' class='redbuttom'>Thực hiện thanh toán</a></td></tr></tbody></table></td></tr></tbody></table></div>");
			return stringBuilder.toString();
		}
	}
	
	
	@RequestMapping(value = "changequantity", method = RequestMethod.GET)
	public @ResponseBody ResponseForUpdate update(@RequestParam("productid") int id,@RequestParam("value") int soLuongMoi, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		List<DetailOrder> listDetailOrder = (List<DetailOrder>) session.getAttribute("listDetailOrder");
		int numPro = 0;
		long sumMoney = 0;
		long retainMoney = 0;
		DetailOrder detailOrderRemove = null;
		for (DetailOrder detailOrder : listDetailOrder) {
			if(detailOrder.getId_pro() == id) {
				if (soLuongMoi <= 0) {
					detailOrderRemove = detailOrder;
				} else {
					detailOrder.setQty(soLuongMoi);
					Book pro = bookDao.getItem(id);
					retainMoney =  (int)(pro.getPrice() - pro.getPrice() * pro.getSale() / 100) * soLuongMoi;
					sumMoney += retainMoney;
					numPro += 1;
				}
			} else {
				Book pro = bookDao.getItem(detailOrder.getId_pro());
				sumMoney += (int)(pro.getPrice() - pro.getPrice() * pro.getSale() / 100) * detailOrder.getQty();
				numPro += 1;
			}
		}
		if (detailOrderRemove != null) {
			listDetailOrder.remove(detailOrderRemove);
		}
		if (listDetailOrder.size() == 0) {
			session.removeAttribute("listDetailOrder");
			session.removeAttribute("numProduct");
		} else {
			session.setAttribute("listDetailOrder", listDetailOrder);
			session.setAttribute("numProduct", listDetailOrder.size());
		}
		
		return new ResponseForUpdate(sumMoney, numPro, retainMoney);
		
	}
	
	public class ResponseForUpdate {
		private long sumMoney;
		private int numProduct;
		private long retainMoney;
		
		public ResponseForUpdate(long money, int numPro, long moneyRetain) {
			sumMoney = money;
			numProduct = numPro;
			retainMoney = moneyRetain;
		}
	}
	
	
//
//	@RequestMapping(value = "/filter", method = RequestMethod.POST, produces = "text/html ; charset=UTF-8")
//	public @ResponseBody String filter(@RequestParam("cost") int cost,@RequestParam("id") int id,@RequestParam("isParent") int isParent,@RequestParam("type") int type,HttpServletResponse response, HttpServletRequest request) throws IOException {
//		response.setCharacterEncoding("UTF-8");
//		request.setCharacterEncoding("UTF-8");
//		
//		
//		List<Book> listPro = null;
//		if(isParent == 1) {
//			if(type == 0) {
//				listPro = bookDao.filterCatParent(id,cost);
//			}
//			else
//			{
//				listPro = bookDao.filterCatParentAndType(id, cost, type);
//			}
//		}
//		else
//		{
//			listPro = bookDao.filterCatChil(id,cost);
//			
//		}
//		
//		
//		if(listPro == null || listPro.size() == 0)
//		{
//			return "<div style='font-size: 40px;color: green;text-align: center'> Không có kết quả</div>";
//		}
//		else
//		{
//			String ketqua = "";
//			for(int i=0;i<listPro.size();i++) {
//				Book pro = listPro.get(i);
//				if(i % 3 == 0) {
//					ketqua += "<div class='product-one' style='margin-top: 20px'>";
//				}
//				ketqua += "<div class='col-md-4 product-left p-left'><div class='product-main simpleCart_shelfItem'>";
//				ketqua += "<a href='" + request.getContextPath() + "/san-pham/" + SlugUtil.makeSlug(pro.getName_pro())+ "/" + pro.getId_pro()  + "' class='mask'>";
//				ketqua += "<img style='height: 180px' class='img-responsive zoom-img' src='" + request.getContextPath()  + "/files/" + pro.getPic1() + "' alt='' /></a>";
//				ketqua += "<div class='product-bottom'><h3>" + pro.getName_pro()+ "</h3><p>Explore Now</p>";
//				ketqua += "<h4><a class='item_add' href='javascript:void(0)' onclick='return getaddCart(" +pro.getId_pro()+ ",'" + pro.getName_pro() + "', ' " + (pro.getPrice() - pro.getPrice()* pro.getSale() /100) + "');'><i></i></a>";
//				ketqua += "<span class=' item_price'>";
//				if(pro.getSale() > 0) {
//					ketqua += "<span style='text-decoration: line-through;'>$" + pro.getPrice() + "</span>";
//				}
//				ketqua += "&nbsp &nbsp $" + (pro.getPrice() - pro.getPrice()* pro.getSale() /100) + "</span></h4></div>";
//				
//				if(pro.getSale() > 0) {
//					ketqua += "<div class='srch srch1'><span>-" +pro.getSale()+ "%</span></div>";
//				}
//				
//				ketqua +="</div></div>";
//				if(i % 3 == 2)
//				{
//					ketqua += "<div class='clearfix'></div>";
//				}
//				
//				if(i % 3 != 2 && i == listPro.size() - 1)
//				{
//					ketqua += "<div class='clearfix'></div>";
//				}
//			}
//			
//			return ketqua;
//		}
//	}
//
//	@RequestMapping(value = "thong-ke", method = RequestMethod.POST, produces = "text/html ; charset=UTF-8")
//	public @ResponseBody String active(@RequestParam("month") int month,@RequestParam("year") int year,HttpServletResponse response, HttpServletRequest request) throws IOException {
//		response.setCharacterEncoding("UTF-8");
//		request.setCharacterEncoding("UTF-8");
//		List<Order> listOrder = null;
//		if(month == 0) {
//			listOrder = orderDao.getItemsByYear(year);
//		}
//		else
//		{
//			listOrder = orderDao.getItemsByMothAndYear(month, year);
//		}
//		float tongTien = 0;
//		String ketqua = "";
//		ketqua += "<table id='table'><thead><tr><th>ID</th><th>Tổng tiền</th><th>Xem chi tiết</th></tr></thead><tbody>";
//		for (Order order : listOrder) {
//			tongTien += order.getAmount();
//			ketqua += "<tr><td>";
//			ketqua += order.getId_order();
//			ketqua += "</td><td>";
//			ketqua += order.getAmount();
//			ketqua += "$</td><td>";
//			ketqua += "<a href='" + request.getContextPath() + "/admin/order/view/" + order.getId_order() + "' title='' class='btn btn-primary'><span class='glyphicon glyphicon-eye-open '></span> Xem</a></td></tr>";
//		}
//		
//		ketqua += "</tbody></table><br><div style='color:green;float: right' >Tổng tiền : " + tongTien + "$</div><br>";
//		
//		
//		
//		return ketqua;
//	}
}
