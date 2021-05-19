<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Đơn hàng của bạn</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="vendor/bootstrap.js"></script>
<script type="text/javascript" src="js/1.js"></script>
<link rel="stylesheet" href="vendor/bootstrap.css">
<link rel="stylesheet" href="vendor/font-awesome.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
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
					<a class="navbar-brand" href="home/index/${user.username}.htm"><img
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
								<li><a href="home/gucci/${user.username}.htm">Gucci</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="home/dior/${user.username}.htm">Dior</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="home/fendi/${user.username}.htm">Fendi</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="home/prada/${user.username}.htm">Prada</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="home/rayban/${user.username}.htm">Rayban</a></li>
								<li role="separator" class="divider"></li>
							</ul></li>
						<li><a href="#">DỊCH VỤ</a></li>
						<li><a href="#">LIÊN HỆ</a></li>

					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><c:choose>
								<c:when test="${user.username==null}">
									<a href="user/login.htm" style="padding-top: 35px;"> ĐĂNG
										NHẬP </a>
								</c:when>
								<c:otherwise>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false" style="padding-top: 32px;">${user.username}<span
											class="caret"></span></a>
										<ul class="dropdown-menu">
											<li role="separator" class="divider"></li>
											<li><a href="cart/order/${user.username}.htm">Đơn
													hàng</a></li>
											<li role="separator" class="divider"></li>
											<li><a href="user/userinfo/${user.username}.htm">Thông
													tin tài khoản</a></li>
											<li role="separator" class="divider"></li>
											<li><a href="home/logout.htm"> Đăng xuất</a></li>
											<li role="separator" class="divider"></li>
										</ul></li>
								</c:otherwise>
							</c:choose></li>
						<li><a href="cart/index/${user.username}.htm"><img
								src='<c:url value= "images/giohang.png" />'></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!---------------------------------------------------------------------------------------------->
	<h4 class="text-center" style="color: red; margin-top: 10px;">${message}</h4>

	<div class="container"
		style="margin-top: 0px; background-color: white;">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover table-bordered table-responsive"
					style="margin-top: 10px;">
					<thead style="border: solid 2px black; color: blue;">
						<tr>
							<th style="width: 34%"; class="text-center">Mã đơn hàng</th>
							<th style="width: 34%"; class="text-center">Ngày tạo</th>
							<th class="text-center">Trạng thái</th>
							<th> </th>
						</tr>
					</thead>
					<tbody
						style="border: solid 2px black">
						<tr>
							<th class="text-center">${hd.maHD}</th>
							<th class="text-center">${hd.ngay}</th>
							<th class="text-center">${hd.trangThai}</th>
							<td class="col-sm-1 col-md-1"><a
								href="cart/orderdelete/${hd.maHD}.htm"><button type="button"
										class="btn btn-danger">
										<span class="glyphicon glyphicon-remove"></span> HỦY
									</button></a></td>
						</tr>
					</tbody>
				</table>
				<table class="table table-hover table-bordered table-responsive"
					style="margin-top: 10px;">
					<thead
						style="border-left: solid 2px black; border-right: solid 2px black; border-top: solid 2px black;  color: #000080;">
						<tr>
							<th style="width: 56%"; class="text-center">Tên sản phẩm</th>
							<th class="text-center">Số lượng</th>
							<th class="text-center">Giá</th>
							<th class="text-center">Số tiền</th>
						</tr>
					</thead>
					<tbody style="border: solid 2px black; padding-top: 20px">
						<c:forEach var="c" items="${hd.ctHoaDons}" varStatus="status">
							<tr>
								<td class="col-sm-8 col-md-6">
									<div class="media" style="padding-top: 10px;">
										<a class="thumbnail pull-left"
											href="home/one-product/${c.sanpham.maSP}/${user.username}.htm">
											<img class="media-object" src="${c.sanpham.anhSP}"
											style="width: 70px; height: 70px;">
										</a>
										<div class="media-body"
											style="padding-top: 30px; padding-left: 10px;">
											<h4 class="media-heading">
												<a
													href="home/one-product/${c.sanpham.maSP}/${user.username}.htm">${c.sanpham.tenSP}</a>
											</h4>
										</div>
									</div>
								</td>
								<td class="col-sm-1 col-md-1"
									style="text-align: center; padding-top: 50px;">${c.soLuong}</td>
								<td class="col-sm-1 col-md-1 text-center"
									style="text-align: center; padding-top: 50px;"><strong>
										<f:formatNumber value="${c.sanpham.giaSP}" type="number" />₫
								</strong></td>
								<td class="col-sm-1 col-md-1 text-center"
									style="text-align: center; padding-top: 50px;"><strong><f:formatNumber
											value="${c.soTien}" type="number" />₫</strong></td>
							</tr>
						</c:forEach>
						<tr>
							<th></th>
							<th></th>
							<th class="text-center" , style="color: red;">Tổng tiền</th>
							<th class="text-center" style="color: red;"><strong> <f:formatNumber
										value="${hd.soTien}" type="number" />₫
							</strong></th>
						</tr>
					</tbody>
				</table>

				<div class="text-center" style="margin-bottom: 30px;">
					<a href="home/index/${user.username}.htm"><button type="button"
							class="btn btn-default">
							<span class="glyphicon glyphicon-shopping-cart"></span> Tiếp tục
							mua hàng
						</button></a>
				</div>
			</div>
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