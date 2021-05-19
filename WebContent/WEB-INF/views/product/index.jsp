<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Quản lý Sản phẩm</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="vendor/bootstrap.js"></script>
<script type="text/javascript" src="js/1.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<link rel="stylesheet" href="vendor/bootstrap.css">
<link rel="stylesheet" href="vendor/font-awesome.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style type="text/css">
.button_scroll2top {
	display: none;
	width: 80px;
	height: 80px;
	padding-top: 20px;
	padding-left: 10px;
	position: fixed;
	z-index: 999;
	right: -45px;
	top: 45%;
	background: #fb3;
	border-radius: 999px;
	cursor: pointer;
	opacity: 0.6;
	color: #fff;
	font-size: 2.0em;
}

.button_scroll2top:hover {
	opacity: 1.0;
}
</style>
</head>
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

	<div class="col-md-2 sidebar">
		<!-- uncomment code for absolute positioning tweek see top comment in css -->
		<div class="absolute-wrapper"></div>
		<!-- Menu -->
		<div class="side-menu">
			<nav class="navbar navbar-default" role="navigation">
				<!-- Main Menu -->
				<div class="side-menu-container">
					<ul class="nav navbar-nav">
						<li><a href="admin/user.htm"><span
								class="glyphicon glyphicon-user"></span> Quản lý khách hàng</a></li>
						<li class="active"><a href="product/index.htm"><span
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
				style="color: chocolate; font-size: 20px;">Quản lý Sản Phẩm</div>
			<div class="panel-body ">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-lg-push-4"
					style="text-align: center;">
					<a href="product/insert.htm" class="btn btn-primary"><i
						class="glyphicon glyphicon-plus"></i> Thêm sản phẩm</a>
					<div>
						<hr>
					</div>
				</div>

				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<table class="table table-responsive table-hover table-bordered ">
						<thead>
							<tr class="" style="background-color: #7b68ee;">
								<th class="text-center">Mã SP</th>
								<th class="text-center">Ảnh</th>
								<th class="text-center">Tên</th>
								<th class="text-center">Giá</th>
								<th class="text-center">Ngày tạo</th>
								<th class="text-center">Số Lượng</th>
								<th class="text-center">Loại</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${products}" varStatus="status">
								<tr>
									<td style="width: 6%; padding-top: 35px;" class="text-center">${p.maSP}</td>
									<td style="width: 8%;"><img src="${p.anhSP}"
										alt="${p.tenSP}" style="max-height: 80px; max-width: 80px;" /></td>
									<td style="width: 30%; padding-top: 30px;">${p.tenSP}</td>
									<td style="width: 10%; padding-top: 3%;" class="text-center"><span
										class="price"><strong><f:formatNumber
													value="${p.giaSP}" type="number" />₫</strong></span></td>
									<td style="width: 10%; padding-top: 3%;" class="text-center">${p.ngayTaoSP}</td>
									<td style="width: 8%; padding-top: 3%;" class="text-center">${p.soLuongSP}</td>
									<td style="padding-top: 3%; width: 12%;" class="text-center">${p.type.tenLoaiSP}</td>

									<td class="text-center" style="padding-top: 30px;">
										<button class="btn btn-primary">
											<a href="product/update/${p.maSP}.htm"
												class="on-default edit-row"> <span style="color: white;"
												class="fa fa-pencil"> Edit</span></a>
										</button>
									</td>

									<td class="text-center" style="padding-top: 30px;">
										<button class="btn btn-danger">
											<a href="product/delete/${p.maSP}.htm"
												class="on-default remove-row"
												onclick="return confirm('Bạn có chắc chắn muốn xoá ${p.tenSP}?');""><span
												style="color: white;" class="fa fa-trash-o"> Delete</span></a>
										</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-lg-push-5"
					style="text-align: center;">
					<div class="btn-toolbar" role="toolbar"
						aria-label="Toolbar with button groups">
						<div class="btn-group me-2" role="group" aria-label="First group">
							<c:forEach begin="1" end="${tongSoTrang }" varStatus="status">
								<a href="product/index/page${status.index }.htm" role="button"
									class="btn btn-primary">${status.index}</a>
							</c:forEach>
						</div>
					</div>
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
						THUẬN TRẦN <i>CODE WANTS TO BE SIMPLE </i> is an initiative to
						help the upcoming programmers with the code. Scanfcode focuses on
						providing the most efficient code or LOVES as the code wants to be
						simple. We will help programmers build up concepts in different
						programming languages that include C, C++, Java, HTML, CSS,
						Bootstrap, JavaScript, NHẬT PHỤNG, Android, SQL and Algorithm.
					</p>
				</div>

				<div class="col-xs-6 col-md-3" style="text-align: center;">
					<h6>Categories</h6>
					<ul class="footer-links">
						<li><a href="home/gucci.htm"">
					Gucci</a>
					</li>
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
		<div class="button_scroll2top" onclick="page_scroll2top()">
			<div class="fa fa-chevron-up" />
		</div>
</body>
<script>
	$(window).scroll(function() {
		if ($(window).scrollTop() >= 600) {
			$('.button_scroll2top').show();
		} else {
			$('.button_scroll2top').hide();
		}
	});
	function page_scroll2top() {
		$('html,body').animate({
			scrollTop : 0
		}, 'slow');
	}
</script>
</html>