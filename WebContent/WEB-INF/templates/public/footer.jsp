<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
 	function addCart() {
		address = '${pageContext.request.contextPath}/addBookToCart';
		var bookId = ${objBook.bid};
		$.ajax({
					url : address,
					dataType : "html",
					type : "POST",
					cache : false,
					data : {
						aid_book : bookId
					},
					error : function(e) {
						Boxy.alert('Lỗi ajax add', null, {
							title : 'Lỗi'
						});
						return false;
					},
					success : function(data) {
						$("#module_productscart").empty();
						$("#module_productscart").append(data);
						$('#showcartlink').show();
						getcartnumber();
						return true;
					}
				});
		document.getElementById("cart-show-new").style.display = 'block';
		document.getElementById("cart-list").style.display = 'block';
		document.getElementById("overlay").style.display = 'block';
		 return true;
	}
	
	function checkform() {
		var fp = document.getElementById("morep").elements;
		var c = 0;

		for (i = 0; i < fp.length; i++) {
			if (fp[i].type == "checkbox" && fp[i].checked)
				c++;
		}

		if (c > 0) {
			return true;
		} else {
			alert("Chọn ít nhất một sản phẩm để thêm vào giỏ");
			return false;
		}
	}
	
	function showelevate() {
		$("#mainimage")
				.elevateZoom(
						{
							gallery : 'gallery_01',
							cursor : 'pointer',
							galleryActiveClass : "active",
							imageCrossfade : true,
							loadingIcon : 'http://nobita.vn/layouts/fontpage/images/spinner.gif'
						});

		$("#mainimage").bind("click", function(e) {
			var ez = $('#mainimage').data('elevateZoom');
			ez.closeAll();
			$.fancybox(ez.getGalleryList());
			return false;
		});
	}

	$(document).ready(function() {
		showelevate();
	});

	$(function() {
		$('.boxy').boxy({
			ovlay : true,
			unloadOnHide : true
		});
	});
</script>
<script type="text/javascript">
	var loading = '<img src="http://nobita.vn/layouts/system/images/loading.gif" border="0" />';	
	function validateUserInput()
	{
		var code = this.event.keyCode;
		if ((code < 48 || (code > 57 && code < 96) || code > 105) && code!==46&&code!==8&&code!==37&&code!==39) 
		{
			this.event.preventDefault();      
		}
	}
	function changeQty(productid, value)
	{
		//var name = productid;
		if(value !== '') {
			url = addQuery('${pageContext.request.contextPath }/changequantity', 'productid=' + productid);
			url = addQuery(url, 'value=' + value);	
			//alert(url);
			$.ajax({
				dataType: "json",
				//type: 'POST',
				contentType: "application/json",
				//url: '${pageContext.request.contextPath }/changequantity',
				url:url,
				success: function (data, status)
				{
					sumMoney = data.sumMoney;
					retainMoney = data.retainMoney;
					numProduct = data.numProduct;
					haveErrorNumber = data.haveErrorNumber;
					if (haveErrorNumber) {
						$('#errorNumber').removeClass('hidein');
					} else {
						$('#errorNumber').addClass('hidein');
					}
					
					$("#cart-intoMoney"+productid).empty();
					$("#cart-intoMoney"+productid).append(retainMoney + ' đ');
					$("#cartnumber").empty();
					$("#cartnumber").append(numProduct);				
					$("#cart-total b").empty();
					$("#cart-total b").append(sumMoney + ' đ');
					if (value <= 0) {
						$('#proAdd'+productid).remove();
						if (numProduct == 0) {
							$('#cartadd').empty();
							$('#showempty').empty();
							$('#showempty').append('<div class="empty">Giỏ hàng chưa có sản phẩm</div>');
							$('#showcart').empty();
						}
						$('.shownumber').empty();
						$('.shownumber').append(numProduct);
						if ($('#shipPage').text()) {
							
							window.location.href = "${pageContext.request.contextPath }/";
						}
					}
					
				},
				error: function ()
				{
					Boxy.alert('Lỗi ajax', null, {title: 'Lỗi'});
				}
			});
		}
	}
	
	
	
	function huyDonHang(orderId)
	{
		//var name = productid;
		if(orderId !== '') {
			address = '${pageContext.request.contextPath}/huy-don-hang';
			$.ajax({
						url : address,
						dataType : "html",
						type : "POST",
						cache : false,
						data : {
							orderId : orderId
						},
						error : function(e) {
							Boxy.alert('Lỗi ajax', null, {
								title : 'Lỗi'
							});
							return false;
						},
						success : function(data) {
							if (data != "OK") {
								Boxy.alert('Bạn không có quyền thay đổi đơn hàng này', null, {
									title : 'Lỗi'
								});
								return false;
							} else {
								$('#cancelOrder' + orderId).empty();
								$('#statusOrder' + orderId).empty();
								$('#statusOrder' + orderId).append('Đã hủy');
							}
						}
					});
		}
	}
	
	function changequantity(type, productid, value, cid)
	{
		//var name = productid;
		if(value =='') value =0;
		url = addQuery('${pageContext.request.contextPath }/changequantity', 'productid=' + productid);
		url = addQuery(url, 'cid=' + cid);
		url = addQuery(url, 'value=' + value);	
		url = addQuery(url, 'type=' + type);
		//alert(url);
		$.ajax({
			dataType: "json",
			//type: 'POST',
			contentType: "application/json",
			//url: '${pageContext.request.contextPath }/changequantity',
			url:url,
			success: function (data, status)
			{
				subtotal = data.subtotal;
				intoMoney = data.intoMoney;
				coupon = data.coupon;
				totalam = data.totalam;
				
				$("#cart-intoMoney"+productid).empty();
				$("#cart-intoMoney"+productid).append(intoMoney);
				$("#cart-subtotal").empty();
				$("#cart-subtotal").append(subtotal);
				$("#cart-coupon").empty();
				$("#cart-coupon").append(coupon);				
				$("#cart-total b").empty();
				$("#cart-total b").append(totalam);
				getcartnumber();
				if(type == 2 && value == 0)
				{
					getcartnumber();
					var count = data.count;
					
					$('#cam'+productid).remove();	
					$('#shownumber').empty();
					$('#shownumber').append(count);
					$('#cartadd').empty();
					if(subtotal == '0')
					{
						$('#showempty').empty();
						$('#showempty').append('<div class="empty">Giỏ hàng chưa có sản phẩm</div>');
						$('#showcart').empty();
					}
					else
					{
						$('.subcontent .total b').empty();
						$('.subcontent .total b').append(data.subtotal);
					}
					
				}
			},
			error: function ()
			{
				Boxy.alert('Lỗi ajax', null, {title: 'Lỗi'});
			}
		});
	}
	/* function delCart(id){
		//alert(id);
		$('#cartadd').empty();
		document.getElementById("cartdel").style.display = 'block';
		alert(${bookDao.getItem(id).getName_book()});
	} */
	function submitform(obj, id)
	{
		$("#ajaxresultload").empty();
		$("#ajaxresultload").append(loading);
		address = obj.action;
		var formdata = $("#coupon").serialize();	
		$.ajax({
			type: "POST",
			dataType: "json",
			url: address,
			data: formdata,
			cache: false,
			error: function(e)
			{
				Boxy.alert('Lỗi ajax', null, {title: 'Lỗi'});
			},
			success: function(data)
			{
				if(data.err > 0)
				{
					$('#ajaxresultload').empty();
					$('#cart-coupon').empty();
					$('#cart-coupon').append(data.coupon);
					$('#cart-coupon').append("%");
					$('#couponvalue').show();
					$('#displayform').empty();
					$('#cart-total').empty();
					$('#cart-total').append(data.total+ " ₫");
				}
				else
				{
					$("#ajaxresultload").empty();
					$("#ajaxresultload").append(data.msg);
				}				
			}
		});
	}
	function goBack() {
	    window.history.back();
	}
	function ajax() {
		var a = 2;
		$.ajax({
			url : '${pageContext.request.contextPath}/testajax',
			dataType : "json",
			type : "POST",
			cache : false,
			/* data:{
				aid:a
			}, */
			error : function(e) {
				Boxy.alert('Lỗi ajax', null, {
					title : 'Thông báo'
				});
				return;
			},
			success : function(data) {
				alert(data.name_author);
				/* $('.shownumber').empty();
				$('.shownumber').append(data.id);
				if (data.id > 0) {
					get();
				} else {
					$('#showcartlink').hide();
					$('#cartslist').empty();
					$('#cartslist')
							.append(
									'<span class="empty">Giỏ hàng chưa có sản phẩm</span>');
				} */
			}
		});
	}
	
</script>
<div id="footer">
	<div id="container">
		<div class="footer_menu">
			<div class="block " id="menu_Footer">
				<div class="blockcontent">
					<ul>
						<li class="group">Hỗ trợ khách hàng
							<ul>
								<li class="group">Hotline: <b><a href="https://www.facebook.com/phuc.pham.5268">0984.946.627 (Gặp Mr.Phuc)</a></b></li>
								<li class="group">Email: greenbooks@gmail.com</li>
							</ul>
						</li>
						<li class="group">Giới thiệu
							<ul>
								<li><a href="#" title="Về nobita" target="_self">Về
										GreenBooks</a></li>
							</ul>
						</li>
						<li class="group">Tài khoản
							<ul>
								<li><a href="" title="Danh sách đơn hàng" target="_self">Danh
										sách đơn hàng</a></li>
							</ul>
						</li>
						<li class="group">Hướng dẫn
							<ul>
								<li><a href="" title="Hướng dẫn mua hàng" target="_self">Hướng
										dẫn mua hàng</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="clear"></div>
		<div class="footer_address">
			<div class="block " id="content_FooterAddress">
				<div class="blockcontent">
					<div style="text-align: center;">Copyright &copy; 2019 Green
						Books</div>
					<div style="text-align: center;">&nbsp;</div>
					<div style="text-align: center;">Địa chỉ: <a href="https://www.facebook.com/vy.leba">K856/H37/08 Tôn Đức Thắng,
						Liên Chiểu, Đà Nẵng</a></div>
					<div style="text-align: center;">&nbsp;</div>
					<div style="text-align: center;">&nbsp;</div>
				</div>
			</div>
		</div>
	</div>
<!-- 	<div class="homecoupon">
		<div class="titlebar">
			<div class="fleft">Nhiều ưu đãi hấp dẫn đang chờ bạn</div>
			<div class="fright">
				<span onclick="showdialog(0)">-</span>
			</div>
			<div class="clear"></div>
		</div>
		<form action="newsletters/submit/index.html"
			onsubmit="updateemail(this); return false;" id="homecoupon">
			<div align="center" style="margin: 5px">
				<input placeholder="Nhập email của bạn vào đây" type="email"
					value="" id="newemail" class="homeemail" name="newemail"
					required="">
			</div>
			<div align="center" style="margin: 5px">
				<input type="submit" class="homesubmit" value="Đăng ký"
					name="subscribe" id="homesubmit">
			</div>
			<span id="help1"></span> <input type="hidden"
				name="C89bebf2de67ef5b5f19651230e7e2303" value="1" />
		</form>
	</div> -->
<!-- 	<div class="coupon">
		<a href="javascript:" onclick="showdialog(1)">Ưu đãi</a>
	</div> -->
	<div id="bttop" class="bttop">
		<i class="fa fa-arrow-up"></i>
	</div>
	<script type="text/javascript">
	$(function(){
		$(window).scroll(function(){if($(this).scrollTop()!=0){
			$('#bttop').fadeIn();}else{$('#bttop').fadeOut();}});
			$('#bttop').click(function(){$('body,html').animate({scrollTop:0},800);
		});		
	});
	function showdialog(value)
	{
		if(value == 1)
		{
			$(".homecoupon").show();
		}else
		{
			$(".homecoupon").hide();
		}
	}
	
	
	
	var previousScroll = 0;
	$(window).scroll(function()
	{
		var currentScroll = $(this).scrollTop();
		if (currentScroll < previousScroll && currentScroll > 300)
		{
			if($('.top_header').css('position') != 'fixed')
			{
				$('.top_header').css('position','fixed');
			}
		}else
		{
			$('.top_header').css('position','inherit');
		}
		previousScroll = currentScroll;
	});

	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	ga('create', 'UA-56977516-1', 'auto');
	ga('send', 'pageview');

	
</script>
</div>
</div>
</body>
</html>
