<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container"></div>
<div class="clear">&nbsp;</div>
<div id="container">
        <div id="layoutGroup1">
            <div class="orderthanhs">
                <div class="title">Cám ơn bạn đã đặt hàng tại greenbook!</div>
                <p style="font-weight:bold;">Xin chào ${objUserLogin.fullname }</p>
               <%--  <p></p><p>Mã số đơn hàng của bạn là: <b>${objOrderRecent.id }</b></p>Thông tin chi tiết về đơn hàng đã được gởi đến địa chỉ email<strong> ${objUserLogin.email }</strong>. Bạn vui lòng kiểm tra hộp thư đến, nếu không tìm thấy vui lòng tìm thêm trong hộp thư spam.<p></p> --%>
                <div class="block " id="content_OrderThanks"><div class="blockcontent"><p>
	<strong>Lưu ý:</strong></p>
<p>
	Nếu là khách hàng mới Greenbooks sẽ tiến hành xác nhận đơn hàng qua điện thoại để xác nhận thông tin bạn đã cung cấp trong đơn hàng. Sau khi đồng ý greenbook sẽ tiến hành xử lý đơn hàng.</p>
<p>
	Sau lần mua hàng đầu tiên thành công, các đơn hàng tiếp theo sẽ được xác nhận bằng tin nhắn</p>
</div></div>
                <p class="clear"></p>
                <div class="fleft">
                	
                </div>
                <div class="fright">
                	<a href="${pageContext.request.contextPath}/" title="Trang chủ">Trở về trang chủ</a>
                </div>
                <p class="clear"></p>
            </div>		
        </div>
    </div>