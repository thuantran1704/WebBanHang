<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Đặt lại mật khẩu</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="vendor/bootstrap.js"></script>
<script type="text/javascript" src="js/1.js"></script>
<link rel="stylesheet" href="vendor/bootstrap.css">
<link rel="stylesheet" href="vendor/font-awesome.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/login.css">
</head>

<style type="text/css">
input.hidden {
	position: absolute;
	left: -9999px;
}

#profile-image1 {
	cursor: pointer;
	width: 100px;
	height: 100px;
	border: 2px solid #03b1ce;
}

.tital {
	font-size: 16px;
	font-weight: 500;
}

.bot-border {
	border-bottom: 1px #f8f8f8 solid;
	margin: 5px 0 5px 0
}
</style>

<body background="images/theme.jpg">
	<!--------------HEADER------------->
	<div id="header" class="container-fluid">
		<nav class="navbar navbar-default none_nav">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="home/index.htm"><img
						class="logo-web" src="images/thuan.png" /></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-center" style="padding-top: 20px;">
						<li class="active"><a href="home/index.htm">TRANG CHỦ</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">SẢN PHẨM <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li role="separator" class="divider"></li>
								<li><a href="home/gucci.htm">Gucci</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="home/dior.htm">Dior</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="home/fendi.htm">Fendi</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="home/prada.htm">Prada</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="home/rayban.htm">Rayban</a></li>
								<li role="separator" class="divider"></li>
							</ul></li>
						<li><a href="#">DỊCH VỤ</a></li>
						<li><a href="">LIÊN HỆ</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!---------------------------------------------------------------------------------------------->
	<div class="container-acc" style="margin-top: 10px;">
		<div class="row-2">
			<div
				class="col-sm-12 col-md-12 col-xs-12 col-lg-6 col-lg-push-3 mb-30">
				<div class="login-form">
					<div class="text-center">
						<strong><h3 style="color: darkred;">Đặt lại mật khẩu</h3></strong>
						<p style="color: red;">${message}</p>
					</div>

					<c:set var="pass" scope="session" value="" />
					<c:set var="pass1" scope="session" value="" />
					<form action="user/setpass/${username}.htm">
						<div class="form-group">
							<label>Mật khẩu mới : </label> <input class="form-control"
								value="${pass}" name="pass" id="password" onkeyup='check();'
								type="password" placeholder="Mật khẩu mới..." />
						</div>
						<div class="form-group">
							<label>Nhập lại mật khẩu : </label> <input class="form-control"
								value="${pass1}" type="password" name="pass1"
								id="confirm_password" onkeyup='check();'
								placeholder="Nhập lại mật khẩu..."></input>
						</div>
						<button type="submit" class="btn btn-primary"
							style="margin: auto; display: block; margin-top: 30px; margin-bottom: 20px;">Lấy
							mật khẩu</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var check = function() {
			if (document.getElementById('password').value == document
					.getElementById('confirm_password').value) {
				document.getElementById('message').style.color = 'green';
				document.getElementById('message').innerHTML = 'Mật khẩu chính xác.';
			} else {
				document.getElementById('message').style.color = 'red';
				document.getElementById('message').innerHTML = 'Mật khẩu chưa chính xác. Vui lòng xác nhân lại!';
			}
		}
	</script>
	<!--------------FOOTER------------->
	<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-6" style="text-align: center;">
					<h6>About</h6>
					<p class="text-justify">
						Scanfcode.com <i>CODE WANTS TO BE SIMPLE </i> is an initiative to
						help the upcoming programmers with the code. Scanfcode focuses on
						providing the most efficient code or snippets as the code wants to
						be simple. We will help programmers build up concepts in different
						programming languages that include C, C++, Java, HTML, CSS,
						Bootstrap, JavaScript, PHP, Android, SQL and Algorithm.
					</p>
				</div>

				<div class="col-xs-6 col-md-3" style="text-align: center;">
					<h6>Categories</h6>
					<ul class="footer-links">
						<li><a href="home/gucci.htm"">Gucci</a></li>
						<li><a href="home/dior.htm">Dior</a></li>
						<li><a href="home/fendi.htm">Fendi</a></li>
						<li><a href="home/prada.htm">Prada</a></li>
						<li><a href="home/rayban.htm">Rayban</a></li>
					</ul>
				</div>

				<div class="col-xs-6 col-md-3" style="text-align: center;">
					<h6>Quick Links</h6>
					<ul class="footer-links">
						<li><a href="#">About Us</a></li>
						<li><a href="#">Contact Us</a></li>
						<li><a href="#">Contribute</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Sitemap</a></li>
					</ul>
				</div>
			</div>
			<hr>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-sm-6 col-xs-12">
					<p class="copyright-text">
						Copyright &copy; 2020 All Rights Reserved by <a
							href="https://www.facebook.com/thuantran878/">Thuận Trần</a>.
					</p>
				</div>
				<div class="col-md-4 col-sm-6 col-xs-12">
					<ul class="social-icons">
						<li><a class="facebook"
							href="https://www.facebook.com/thuantran878/"><i
								class="fa fa-facebook"></i></a></li>
						<li><a class="twitter"
							href="https://www.facebook.com/thuantran878/"><i
								class="fa fa-twitter"></i></a></li>
						<li><a class="finstagram"
							href="https://www.facebook.com/thuantran878/"><i
								class="fa fa-instagram"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>