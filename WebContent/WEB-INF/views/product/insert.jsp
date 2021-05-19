<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Thêm sản phẩm</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="vendor/bootstrap.js"></script>
<script type="text/javascript" src="js/1.js"></script>
<link rel="stylesheet" href="vendor/bootstrap.css">
<link rel="stylesheet" href="vendor/font-awesome.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<style type="text/css">
.col-lg-push-t {
	left: 10%;
}

.col-lg-push-tt {
	left: 100%;
}

.form-sec {
	background: #ccc;
	padding: 15px;
	background: #f8f9fa;
	padding: 15px;
	box-shadow: 0 0 4px #ccc;
}
</style>
<body>

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
					<a class="navbar-brand"><img class="logo-web"
						src="images/thuan.png" /></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false" style="padding-top: 32px;">Admin<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li role="separator" class="divider"></li>
								<li><a href="home/logout.htm"> Đăng xuất</a></li>
								<li role="separator" class="divider"></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!---------------------------------------------------------------------------------------------->

	<div class="container" style="margin-top: 10px;">

		<div
			class="form-sec col-xs-12 col-sm-12 col-md-4 col-lg-4 col-lg-push-4 col-md-push-4">
			<h4 class="text-center" style="color: chocolate;">Thêm sản phẩm</h4>

			<p style="color: red;">${message}</p>
			<form:form method="post" action="product/insert.htm"
				modelAttribute="product" enctype="multipart/form-data">
				<div class="form-group">
					<label>Tên sản phẩm:</label>
					<form:errors path="tenSP" style="color:red;" />
					<form:input path="tenSP" type="text" class="form-control"
						placeholder="Tên sản phẩm..." />
				</div>
				<div class="form-group">
					<label>Ảnh sản phẩm:</label>
					<form:errors path="anhSP" style="color:red;" />
					<form:input path="anhSP" type="hidden" class="form-control"
						placeholder="Ảnh sản phẩm..." />
					<input type="file" name="photo" class="form-control"
						placeholder="Ảnh sản phẩm..." />

				</div>
				<div class="form-group">
					<label>Loại sản phẩm:</label>
					<form:select class="form-control" path="type.maLoaiSP"
						items="${types}" itemValue="maLoaiSP" itemLabel="tenLoaiSP"></form:select>
				</div>

				<div class="form-group">
					<label>Giá:</label>
					<form:errors path="giaSP" style="color:red;" />
					<form:input path="giaSP" type="text" class="form-control"
						placeholder="Giá sản phẩm..." />
				</div>
				<div class="form-group">
					<label>Mô tả sản phẩm:</label>
					<form:errors path="moTaSP" style="color:red;" />
					<form:textarea rows="5" path="moTaSP" type="text"
						class="form-control" placeholder="Mô tả sản phẩm..." />
				</div>
				<div class="form-group">
					<label>Số lượng:</label>
					<form:errors path="soLuongSP" style="color:red;" />
					<form:input path="soLuongSP" type="text" class="form-control"
						placeholder="Số lượng sản phẩm..." />
				</div>

				<button type="submit" class="btn btn-primary"
					style="margin: auto; display: block;">Thêm</button>
			</form:form>
		</div>
	</div>

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