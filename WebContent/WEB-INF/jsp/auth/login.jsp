<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div id="container">
	<div class="pathway">
		<ul>
			<li><a href="${pageContext.request.contextPath}/" title="Trang chủ">Trang chủ</a></li>
			<li>Đăng ký</li>
		</ul>
	</div>
</div>
<div id="container">
        <div class="sortable" id="layoutGroup1">
            <div class="block" id="module_Login">
	<h1>
    	Đăng nhập <span>hoặc</span>
        <a href="${pageContext.request.contextPath}/register" title="Đăng ký">Đăng ký</a>
    </h1>
	<div class="blockcontent">
    	<div class="loginsocial">
        	<h3>Đăng nhập bằng</h3>
            <div class="buttom">
                <div><a href="javascript:" class="btn_face" onclick="checkLoginState();"></a></div>
                <div style="display:none">
                	<a href="javascript:" class="btn_google" onclick="google_login();"></a>
                </div>
                <div style="display:none">
                	<a href="javascript:" class="btn_yahoo" onclick="yahoo_login();"></a>
                </div>
            </div>
        </div>
		<div class="loginform">
        	<h3>Đăng nhập bằng tài khoản Greenbooks</h3>
			<form method="post" name="fgf" id="fgf" action="${pageContext.request.contextPath}/login" onsubmit="return ValidateForm(CheckForm);">
            	<div class="field">
                    <div class="textlabel">
                        <label for="idusername">Username</label> <span class="Required">*</span>:
                    </div>
                    <input type="text" name="username" id="idusername" onfocus="showhelp(1)" value="" autocomplete="off">
                    <span class="help" id="help1">Nhập username của bạn</span>
                </div>
                <div class="field">
                    <div class="textlabel">
                        <label for="idpassword">Mật khẩu</label> <span class="Required">*</span>:
                    </div>
                        <input id="idpassword" autocomplete="off" onfocus="showhelp(2)" type="password" name="password">
                        <span class="help" id="help2">Nhập mật khẩu của bạn</span>
				</div> 
                <div class="field">
					<div class="textlabel"></div>
					<a href="#" title="Quên mật khẩu?">Quên mật khẩu?</a>
				</div>
				<div class="clear"></div>
                <div class="field">
                    <div class="textlabel">
                        &nbsp;
                    </div>
                        <input type="hidden" name="redirect" value="">
                        <input type="submit" align="absmiddle" class="loginbuton" value="Đăng nhập">
                        &nbsp;&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/register" title="Đăng ký" class="link_register">Tạo tài khoản</a>
				</div>
			</form>
		</div>
        <div class="clear"></div>
	</div>
</div>
        </div>
		<div class="clear"></div>
    </div>