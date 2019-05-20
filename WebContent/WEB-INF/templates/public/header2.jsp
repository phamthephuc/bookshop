<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Yêu là thế (Bản Đặc Biệt, Số Lượng Có Hạn)</title>	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content="Yêu là thế (Bản Đặc Biệt, Số Lượng Có Hạn)" />
	<meta name="keywords" content="Yêu là thế (Bản Đặc Biệt, Số Lượng Có Hạn)" />
	<meta name="generator" content="Yêu là thế (Bản Đặc Biệt, Số Lượng Có Hạn)" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />	
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta name="Copyright" content="Design A web.">
	<link rel="shortcut icon" href="/layouts/fontpage/images/favicon.ico" />
	<link type="text/css" href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/styles.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/font-awesome.min.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/styles.resolution.css" rel="stylesheet" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/system/css/boxy.css" type="text/css" />   
	<script type="text/javascript" src="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/system/js/jquery-1.8.2.min.js"></script>
    <script src="/ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/system/js/common.js"></script>
	<script type='text/javascript' src='${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/system/js/jquery.boxy.js'></script>
	<script type="text/javascript">var app = '';</script>
	<link href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/products.css" type="text/css" rel="stylesheet"/>
	
    <!--[if IE]>
	<link rel="stylesheet" href="layouts/fontpage/css/styles.ie.css" type="text/css" />
    <![endif]-->
    <!-- Facebook Pixel Code -->
    <script>
    !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
    n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
    document,'script','https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '329084620879246', {
    em: 'insert_email_variable,'
    });
    fbq('track', 'PageView');
    </script>
    <noscript><img height="1" width="1" style="display:none"
    src="https://www.facebook.com/tr?id=329084620879246&ev=PageView&noscript=1"
    /></noscript>
    <!-- DO NOT MODIFY -->
    <!-- End Facebook Pixel Code -->
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
		
<script type="text/javascript" src="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/js/jquery.elevatezoom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/js/gohome.js"></script>
<link href="${pageContext.request.contextPath}/templates/public/nobita.vn/layouts/fontpage/css/draggable.css" type="text/css" rel="stylesheet" />
<body>
<div id="main_contener">
	<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '428690924198349',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.8'
    });
    FB.AppEvents.logPageView();   
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "/connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<div id="header">
<div class="block banner " id="banner_TopHeader"><div class="blockcontent"></div></div>
</div>
<div id="header">
    <div class="top_header">
        <div id="container">          
           <div class="mainlogo">
                <div class="block banner " id="banner_mainlogo"><div class="blockcontent"><a href="/banners/view/1/logo-chinh.html" title="Logo chính" target="_self"><img src="stores/banners/logo.png" border="0" title="Logo chính" width="220" height="44"></a></div></div>
            </div>
            <div class="rightheader">
                <div class="search">
                <form action="/products/search/index.html" onsubmit="return checksearch();"  method="get">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="input" width="100%">
                            <input type="text" value="" name="keyword" id="keyword" size="10" class="inputfield" title="Tìm" autocomplete="off" onfocus="clearText(this)" onblur="clearText(this)" />
                            </td>
                            <td class="search-submit" nowrap="nowrap" width="40">
                            <input type="submit" value="Tìm" alt="Tìm">
                            <input type="hidden" name="productid" id="productid" value="0" />
                            </td>
                        </tr>
                    </table>              
                </form>
                <div class="autocomplete" id="autocomplete"></div>
                </div>
                <div class="shoptool">
                    <ul class="right_topbar">
                    
                        <li>
                            <div class="textlable" title="Tài khoản của bạn">
                                Tài khoản của bạn<i class="fa fa-sort-desc"></i>
                            </div>
                            <div class="subcontent">
                                 <div class="buttom">
    <div><a href="javascript:" class="btn_face" onclick="checkLoginState();"></a></div>
    <div><a class="btn_login" href="/users/login/index.html">Đăng nhập</a></div>
    <div align="center" class="loginlink">
        Khách hàng mới? <a href="/users/register/index.html">Tạo tài khoản</a>
    </div>
</div>
<script>
	function testAPI(response)
	{
		var accessToken = response.authResponse.accessToken;
		FB.api('/me', function(response)
		{
			url = '/users/loginopenid/1/index.html';
			url = addQuery(url, 'fid='+response.id);
			url = addQuery(url, 'access_token='+accessToken);			
			document.location.href = url;
		});
	}
		
	function checkLoginState()
	{
		FB.getLoginStatus(function(response)
		{
			if (response.status === 'connected')
			{
				testAPI(response);
			}
			else
			{
				FB.login(function(response)
				{
					if (response.authResponse)
					{
						if(response.status)
						{
							testAPI(response);
						}
					}	
				}, {scope: 'public_profile,email'});
			}
		});
  	}
	
	window.fbAsyncInit = function()
	{
	  FB.init({
		appId      : '368970956612542',
		cookie     : true,  
		xfbml      : true,
		version    : 'v2.1'
	  });
	};
</script>
                            </div>
                        </li>
                        <li>
                            <div class="textlable" title="Giỏ hàng">
                                Giỏ hàng (<span class="shownumber">0</span>)
                                <i class="fa fa-sort-desc"></i>
                            </div>
                            <div class="subcontent">
                                <h3>Giỏ hàng</h3>
                                <div id="cartslist">
                                </div>
                                <div class="buttom" id="showcartlink">
                              	<a class="cartlink" href="/orders/carts/gio-hang.html" title="GIỎ HÀNG CỦA TÔI">
                                Xem giỏ hàng<i class="fa fa-play"></i></a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
    <div id="mainmenu">
        <div id="container">
            <div class="mainmenu_contener">
                <div class="mainmenu">
                	<span class="while"></span>
                    <span><h2><i class="fa fa-bars"></i>Danh mục sản phẩm</h2></span>
<ul class="submenu0" id="submenu0"><li class="group"><a href="javascript:"class="havechild" 4>Nổi bật</a><ul class="submenu1" id="submenu1"><li ><a href="/sach-ban-chay.html"  target="_self">Sách bán chạy</a></li><li ><a href="/sach-moi.html"  target="_self">Sách mới</a></li><li ><a href="/sach-sap-phat-hanh.html"  target="_self">Sắp phát hành</a></li><li ><a href="/sach-giam-gia.html"  target="_self">Sách giảm giá</a></li></ul></li><li ><a href="/danh-muc/1/sach-kinh-te.html" class="havechild" 8 target="_self">Sách kinh tế</a><ul class="submenu1" id="submenu1"><li ><a href="/danh-muc/18/tai-chinh-ke-toan.html"  target="_self">Tài chính - Kế toán</a></li><li ><a href="/danh-muc/17/quan-tri-lanh-dao.html"  target="_self">Quản trị - Lãnh đạo</a></li><li ><a href="/danh-muc/16/marketing-ban-hang.html"  target="_self">Marketing - Bán hàng</a></li><li ><a href="/danh-muc/15/ky-nang-lam-viec.html"  target="_self">Kỹ năng làm việc</a></li><li ><a href="/danh-muc/13/kinh-te-hoc.html"  target="_self">Kinh tế học</a></li><li ><a href="/danh-muc/12/khoi-nghiep.html"  target="_self">Khởi nghiệp</a></li><li ><a href="/danh-muc/11/doanh-nhan-tap-doan.html"  target="_self">Doanh nhân - Tập đoàn</a></li><li ><a href="/danh-muc/10/bai-hoc-kinh-doanh.html"  target="_self">Bài học kinh doanh</a></li></ul></li><li class="active"><a href="/danh-muc/2/van-hoc-nuoc-ngoai.html" class="havechild" 9 target="_self">Văn học nước ngoài</a><ul class="submenu1" id="submenu1"><li ><a href="/danh-muc/25/tieu-su-hoi-ky.html"  target="_self">Tiểu sử - Hồi ký</a></li><li ><a href="/danh-muc/24/truyen-lich-su-kiem-hiep.html"  target="_self">Truyện lịch sử - Kiếm hiệp</a></li><li ><a href="/danh-muc/23/truyen-ngan-tan-van.html"  target="_self">Truyện ngắn - Tản văn</a></li><li ><a href="/danh-muc/22/tac-pham-kinh-dien.html"  target="_self">Tác phẩm kinh điển</a></li><li ><a href="/danh-muc/21/huyen-bi-gia-tuong.html"  target="_self">Huyền bí - Giả tưởng</a></li><li ><a href="/danh-muc/20/truyen-trinh-tham-kinh-di.html"  target="_self">Truyện trinh thám - Kinh dị</a></li><li class="active"><a href="/danh-muc/19/tieu-thuyet-tinh-cam-lang-man.html"  target="_self">Tiểu thuyết tình cảm - Lãng mạn</a></li><li ><a href="/danh-muc/14/tieu-thuyet-dam-my.html"  target="_self">Tiểu thuyết đam mỹ</a></li><li ><a href="/danh-muc/68/bach-hop.html"  target="_self">Bách Hợp</a></li></ul></li><li ><a href="/danh-muc/3/van-hoc-trong-nuoc.html" class="havechild" 6 target="_self">Văn học trong nước</a><ul class="submenu1" id="submenu1"><li ><a href="/danh-muc/26/tieu-thuyet.html"  target="_self">Tiểu thuyết</a></li><li ><a href="/danh-muc/27/truyen-ngan-tan-van.html"  target="_self">Truyện ngắn - Tản văn</a></li><li ><a href="/danh-muc/57/huyen-bi-gia-tuong.html"  target="_self">Huyền bí - Giả tưởng</a></li><li ><a href="/danh-muc/58/phong-su-ky-su.html"  target="_self">Phóng sự - Ký sự</a></li><li ><a href="/danh-muc/3/trinh-tham-kinh-di.html"  target="_self">Trinh thám - Kinh dị</a></li><li ><a href="/danh-muc/3/tieu-su-hoi-ky.html"  target="_self">Tiểu sử - Hồi Ký</a></li></ul></li><li ><a href="/danh-muc/4/sach-ki-nang-song.html" class="havechild" 2 target="_self">Sách kĩ năng sống</a><ul class="submenu1" id="submenu1"><li ><a href="/danh-muc/41/ky-nang-song.html"  target="_self">Kỹ năng sống</a></li><li ><a href="/danh-muc/56/nghe-thuat-song-dep.html"  target="_self">Nghệ thuật sống đẹp</a></li></ul></li><li ><a href="/danh-muc/5/sach-tuoi-teen.html" class="havechild" 4 target="_self">Sách tuổi teen</a><ul class="submenu1" id="submenu1"><li ><a href="/danh-muc/30/van-hoc-teen.html"  target="_self">Văn học teen</a></li><li ><a href="/danh-muc/29/huong-nghiep-ky-nang.html"  target="_self">Hướng nghiệp - kỹ năng</a></li><li ><a href="/danh-muc/64/light-novel.html"  target="_self">Light Novel</a></li><li ><a href="/danh-muc/69/truyen-tranh-comic.html"  target="_self">Truyện tranh, Comic</a></li></ul></li><li ><a href="/danh-muc/6/hoc-ngoai-ngu.html" class="havechild" 4 target="_self">Học ngoại ngữ</a><ul class="submenu1" id="submenu1"><li ><a href="/danh-muc/47/tu-dien.html"  target="_self">Từ điển</a></li><li ><a href="/danh-muc/48/sach-hoc-tieng-anh.html"  target="_self">Sách học tiếng Anh</a></li><li ><a href="/danh-muc/50/sach-hoc-tieng-hoa.html"  target="_self">Sách học tiếng Hoa</a></li><li ><a href="/danh-muc/49/sach-hoc-tieng-nhat.html"  target="_self">Sách học tiếng Nhật</a></li></ul></li><li ><a href="/danh-muc/7/sach-thieu-nhi.html" class="havechild" 5 target="_self">Sách thiếu nhi</a><ul class="submenu1" id="submenu1"><li ><a href="/danh-muc/31/truyen-co-tich-than-thoai.html"  target="_self">Truyện cổ tích - Thần thoại</a></li><li ><a href="/danh-muc/33/vua-hoc-vua-choi.html"  target="_self">Vừa học vừa chơi</a></li><li ><a href="/danh-muc/32/kien-thuc-ki-nang.html"  target="_self">Kiến thức - Kĩ năng</a></li><li ><a href="/danh-muc/7/van-hoc.html"  target="_self">Văn học</a></li><li ><a href="/truyen-ke-cho-be.html"  target="">Truyện kể cho bé</a></li></ul></li><li ><a href="/danh-muc/8/thuong-thuc-doi-song.html" class="havechild" 5 target="_self">Thương thức đời sống</a><ul class="submenu1" id="submenu1"><li ><a href="/danh-muc/53/van-hoa-du-lich.html"  target="_self">Văn hóa - Du lịch</a></li><li ><a href="/danh-muc/42/cham-soc-suc-khoe.html"  target="_self">Chăm sóc sức khỏe</a></li><li ><a href="/danh-muc/45/phong-thuy-nha-cua.html"  target="_self">Phong thủy - Nhà cửa</a></li><li ><a href="/danh-muc/43/nau-an.html"  target="_self">Nấu ăn</a></li><li ><a href="/danh-muc/55/the-thao-giai-tri.html"  target="_self">Thể thao - Giải trí</a></li></ul></li><li ><a href="/danh-muc/9/sach-chuyen-nganh.html" class="havechild" 10 target="_self">Sách chuyên ngành</a><ul class="submenu1" id="submenu1"><li ><a href="/danh-muc/36/giao-duc.html"  target="_self">Giáo dục</a></li><li ><a href="/danh-muc/35/cong-nghe-thong-tin.html"  target="_self">Công nghệ thông tin</a></li><li ><a href="/danh-muc/38/lich-su-dia-ly.html"  target="_self">Lịch sử - Địa lý</a></li><li ><a href="/danh-muc/37/khoa-hoc-tu-nhien.html"  target="_self">Khoa học tự nhiên</a></li><li ><a href="/danh-muc/39/my-thuat-kien-truc.html"  target="_self">Mỹ thuật - Kiến trúc</a></li><li ><a href="/danh-muc/34/chinh-tri-triet-hoc.html"  target="_self">Chính trị - Triết học</a></li><li ><a href="/danh-muc/9/danh-nhan-nguoi-noi-tieng.html"  target="_self">Danh nhân - Người nổi tiếng</a></li><li ><a href="/danh-muc/9/tam-linh-ton-giao.html"  target="_self">Tâm linh - Tôn giáo</a></li><li ><a href="/danh-muc/40/y-duoc.html"  target="_self">Y dược</a></li><li ><a href="/danh-muc/9/khoa-hoc-xa-hoi.html"  target="_self">Khoa học xã hội</a></li></ul></li><li ><a href="/danh-muc/51/van-phong-pham-qua-tang.html" class="havechild" 3 target="_self">Văn Phòng Phẩm - Quà Tặng</a><ul class="submenu1" id="submenu1"><li ><a href="/danh-muc/70/bop-viet-hop-but.html"  target="_self">Bóp Viết - Hộp Bút</a></li><li ><a href="/danh-muc/71/binh-nuoc-binh-giu-nhiet.html"  target="_self">Bình Nước, Bình Giữ Nhiệt</a></li><li ><a href="/danh-muc/72/phu-kien-qua-tang.html"  target="_self">Phụ Kiện, Quà Tặng</a></li></ul></li><li class="-bold"><a href="/Cong-ty-phat-hanh.html" class="havechild" 0 target="_self">Công ty phát hành</a><ul class="submenubig" id="submenu1"><li class="-bold"><a href="/thuong-hieu/4/thai-ha.html">Thái Hà</a></li><li class="-bold"><a href="/thuong-hieu/6/bach-viet.html">Bách Việt</a></li><li class="-bold"><a href="/thuong-hieu/33/alphabooks.html">Alphabooks</a></li><li class="-bold"><a href="/thuong-hieu/34/nha-nam.html">Nhã Nam</a></li><li class="-bold"><a href="/thuong-hieu/35/owlbooks.html">Owlbooks</a></li><li class="-bold"><a href="/thuong-hieu/36/cam-phong.html">Cẩm Phong</a></li><li class="-bold"><a href="/thuong-hieu/37/quang-van.html">Quảng Văn</a></li><li class="-bold"><a href="/thuong-hieu/38/van-viet.html">Văn Việt</a></li><li class="-bold"><a href="/thuong-hieu/39/limbooks.html">Limbooks</a></li><li class="-bold"><a href="/thuong-hieu/40/skybooks.html">Skybooks</a></li><li class="-bold"><a href="/thuong-hieu/41/asbooks.html">Asbooks</a></li><li class="-bold"><a href="/thuong-hieu/42/amak.html">Amak</a></li><li class="-bold"><a href="/thuong-hieu/43/dinh-ti.html">Đinh Tị</a></li><li class="-bold"><a href="/thuong-hieu/44/pavicobooks.html">Pavicobooks</a></li><li class="-bold"><a href="/thuong-hieu/45/phuong-nam.html">Phương Nam</a></li><li class="-bold"><a href="/thuong-hieu/46/dong-a.html">Đông A</a></li><li class="-bold"><a href="/thuong-hieu/47/van-lang.html">Văn Lang</a></li><li class="-bold"><a href="/thuong-hieu/48/nguoi-tre-viet.html">Người Trẻ Việt</a></li><li class="-bold"><a href="/thuong-hieu/49/lantabra.html">Lantabra</a></li><li class="-bold"><a href="/thuong-hieu/50/nxb-kim-dong.html">NXB Kim Đồng</a></li><li class="-bold"><a href="/thuong-hieu/51/nxb-tre.html">NXB Trẻ</a></li><li class="publishmore"><a href="/Cong-ty-phat-hanh.html">Tất cả công ty phát hành</a></li></ul></li></ul>
                </div>
                <div class="hotline">
                    <div class="block " id="content_SupportOnline"><div class="blockcontent"><div>
	<strong><span style="color:#000000;"><span style="font-size:14px;">Hotline: 097. 4941. 097</span></span></strong></div>
</div></div>
                </div>
            </div>
             <div class="clear"></div>
        </div>
    </div>
</div>
<div class="clear"></div>