<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<head>
<title>Colored  an Admin Panel Category Flat Bootstrap Responsive Website Template | Buttons :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Colored Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/css/bootstrap.css">
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath }/templates/admin/css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/css/font.css" type="text/css"/>
<link href="${pageContext.request.contextPath }/templates/admin/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<script src="${pageContext.request.contextPath }/templates/admin/js/jquery2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath }/templates/admin/js/modernizr.js"></script>
<script src="${pageContext.request.contextPath }/templates/admin/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath }/templates/admin/js/screenfull.js"></script>
<script src="${pageContext.request.contextPath }/libraries/ckeditor/ckeditor.js"></script>
		<script>
		$(function () {
			$('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

			if (!screenfull.enabled) {
				return false;
			}

			$('#toggle').click(function () {
				screenfull.toggle($('#container')[0]);
			});	
		});
		</script>

<!--//skycons-icons-->	
</head>
<body class="dashboard-page">
	<nav class="main-menu">
		<ul>
			<li>
				<a href="${pageContext.request.contextPath }/admin">
					<i class="fa fa-home nav_icon"></i>
					<span class="nav-text">
					Dashboard
					</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/cats">
					<i class="icon-fa fa-list-alt nav-icon"></i>
					<span class="nav-text">
						Danh mục
					</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/books">
					<i class="fa fa-book nav-icon"></i>
					<span class="nav-text">
						Sách
					</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/orders">
					<i class="icon-fa fa-shopping-cart nav-icon"></i>
					<span class="nav-text">
						Đơn hàng
					</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/users">
					<i class="icon-fa fa-user nav-icon"></i>
					<span class="nav-text">
						Người dùng
					</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/thong-ke">
					<i class="fa fa-bar-chart nav-icon"></i>
					<span class="nav-text">
						Thống kê
					</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/authors">
					<i class="icon-fa fa-file-text nav-icon"></i>
					<span class="nav-text">
						Tác giả
					</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/publishers">
					<i class="icon-fa fa-users nav-icon"></i>
					<span class="nav-text">
						Nhà xuất bản
					</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/slides">
					<i class="icon-fa fa-image nav-icon"></i>
					<span class="nav-text">
						Slide
					</span>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/admin/payments">
					<i class="icon-fa fa-money nav-icon"></i>
					<span class="nav-text">
						Hình thức thanh toán
					</span>
				</a>
			</li>
			
		</ul>
		<ul class="logout">
			<li>
			<a href="${pageContext.request.contextPath }/auth/logout">
			<i class="icon-off nav-icon"></i>
			<span class="nav-text">
			Logout
			</span>
			</a>
			</li>
		</ul>
	</nav>
	<section class="wrapper scrollable">
		<nav class="user-menu">
			<a href="javascript:;" class="main-menu-access">
			<i class="icon-proton-logo"></i>
			<i class="icon-reorder"></i>
			</a>
		</nav>
