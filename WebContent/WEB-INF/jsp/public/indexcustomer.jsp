<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<div class="pathway"><ul><li><a href="${pageContext.request.contextPath}/" title="Trang chủ">Trang chủ</a></li><li>Quản lý tài khoản</li></ul></div>
</div>
<div class="clear"></div>
<script type="text/javascript">
</script>
<div id="container">
        <div class="sortable" id="layoutGroup3">
            <div class="block" id="module_customerMenu">
	<h2>Tài khoản của bạn</h2>
	<div class="blockcontent">
    	<ul>
        	<li class="bold">Quản lý tài khoản</li>
			<li><a href="${pageContext.request.contextPath}/customer/thay-doi-thong-tin">Thông tin tài khoản</a></li>
            <li><a href="${pageContext.request.contextPath}/customer/xem-don-hang">Đơn hàng của tôi</a></li> 
        </ul>    
    </div>
</div>
        </div>
        <div class="sortable" id="layoutGroup4">
            <div class="block" id="module_customer">
	<h2>Quản lý tài khoản</h2>
	<div class="blockcontent">
    	<div class="customer">
           <p>Xin chào,  <b>${objUserLogin.fullname }</b>!</p>
           <p>Trong mục quản lý tài khoản, bạn có thể xem các hoạt động gần đây của bạn và cấp nhật  thông tin tài khoản. Chọn một link bên dưới để xem hoặc chỉnh sửa thông tin.</p>
        </div>
        <div class="customer">
        </div>
    	<div class="customer">
           <h3>Thông tin</h3>
            <table cellpadding="0" cellspacing="0" width="100%" class="ordertable">
                <tbody><tr>
                	<th align="left" width="50%">
                    	Thông tin tài khoản người dùng
                        <a class="more" href="${pageContext.request.contextPath}/thay-doi-mat-khau" title="Thay đổi">Thay đổi</a>
                    </th>
                    <th align="left">Địa chỉ giao hàng mặc định
                        <a class="more" href="${pageContext.request.contextPath}/thay-doi-thong-tin">Sửa địa chỉ</a>
                    </th>
                </tr>
                <tr>
                	<td valign="top">
           				<div class="cfield"> <b>${objUserLogin.fullname }</b></div>
			           	<div class="cfield">${objUserLogin.email }</div>
                        <div class="cfield">
                        	<a href="${pageContext.request.contextPath}/thay-doi-mat-khau" title="Sửa mật khẩu">Sửa mật khẩu</a>
                        </div>
                    </td>
                	<td>
                    	<div>
           				<div class="cfield">Anh/Chị <b>${objUserLogin.fullname }</b></div>
			           	<div class="cfield">${objUserLogin.address }</div>
                        <div class="cfield">${objUserLogin.phone }</div>
                        <div class="cfield">${objUserLogin.email }</div>
                        <div class="cfield">
                        	<a href="${pageContext.request.contextPath}/thay-doi-thong-tin" title="Sửa địa chỉ">Sửa địa chỉ</a>
                        </div>
                        </div>
                    </td>
                </tr>
           </tbody></table>
        </div>

	</div>
</div>
<script type="text/javascript">
	$(function()
	{
		$('.boxy').boxy();
	});
</script>
        </div>		
        <div class="clear"></div>
    </div>