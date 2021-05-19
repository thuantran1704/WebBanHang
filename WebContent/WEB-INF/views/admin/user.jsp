<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Quản lý khách hàng</title>
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
<body >

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
	<div class="col-md-2 sidebar">
		<!-- uncomment code for absolute positioning tweek see top comment in css -->
		<div class="absolute-wrapper"></div>
		<!-- Menu -->
		<div class="side-menu">
			<nav class="navbar navbar-default" role="navigation">
				<!-- Main Menu -->
				<div class="side-menu-container">
					<ul class="nav navbar-nav">
						<li class="active"><a href="admin/user.htm"><span
								class="glyphicon glyphicon-user"></span> Quản lý khách hàng</a></li>
						<li><a href="product/index.htm"><span
								class="glyphicon glyphicon-lock"></span> Quản lý sản phẩm</a></li>
						<li><a href="admin/order.htm"><span
								class="glyphicon glyphicon-paste"></span> Quản lý đơn hàng</a></li>

						<!-- Dropdown-->
						<li class="panel panel-default" id="dropdown"><a
							data-toggle="collapse" href="#dropdown-lvl1"> <span
								class="glyphicon glyphicon-user"></span> Tài khoản <span
								class="caret"></span>
						</a> <!-- Dropdown level 1 -->
							<div id="dropdown-lvl1" class="panel-collapse collapse">
								<div class="panel-body">
									<ul class="nav navbar-nav">
										<li><a href="user/login.htm"><i
												class="fa fa-sign-out"></i> Đăng xuất</a></li>
									</ul>
								</div>
							</div></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div class="col-md-10 content">
		<div class="panel panel-default">
			<div class="panel-heading text-center"
				style="color: chocolate; font-size: 20px;">Quản lý Khách Hàng</div>

			<div class="panel-body ">
				<div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-lg-push-4"
						style="text-align: center;"">
						<a href="admin/insertuser.htm" class="btn btn-primary"><i
							class="glyphicon glyphicon-plus"></i> Thêm khách hàng</a>
						<div>
							<hr>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<table class="table table-responsive table-hover table-bordered ">
						<thead>
							<tr class="" style="background-color: #7b68ee;">
								<th class="text-center">STT</th>
								<th class="text-center">Mã KH</th>
								<th class="text-center">Username</th>
								<th class="text-center">Password</th>
								<th class="text-center">Họ</th>
								<th class="text-center">Tên</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${users}" varStatus="status" begin="1">
								<tr>
									<td style="width: 6%; padding-top: 15px;" class="text-center">${status.index}</td>
									<td style="width: 10%; padding-top: 15px;" class="text-center"	>${u.maKH}</td>
									<td style="width: 16%; padding-top: 15px;" class="text-center">${u.username}</td>
									<td style="width: 12%; padding-top: 15px;" class="text-center">${u.password}</td>
									<td style="width: 10%; padding-top: 15px;" class="text-center">${u.ho}</td>
									<td style="width: 10%; padding-top: 15px;" class="text-center">${u.ten}</td>
									<td style="width: 20%;" class="text-center"><a
										href="admin/updateuser/${u.maKH}.htm" class="btn btn-info"><i
											class="glyphicon glyphicon-pencil"></i> Edit</a> <a
										href="admin/deleteuser/${u.maKH}.htm" class="btn btn-danger"
										onclick="return confirm('Bạn có chắc chắn muốn xoá ${u.username}?');"><i
											class="glyphicon glyphicon-remove"></i> Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$('.navbar-toggle-sidebar').click(
					function() {
						$('.navbar-nav').toggleClass('slide-in');
						$('.side-body').toggleClass('body-slide-in');
						$('#search').removeClass('in').addClass('collapse')
								.slideUp(200);
					});

			$('#search-trigger').click(function() {
				$('.navbar-nav').removeClass('slide-in');
				$('.side-body').removeClass('body-slide-in');
				$('.search-input').focus();
			});
		});
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