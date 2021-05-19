<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Giỏ hàng của bạn</title>
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
<style type="text/css">
.table &amp ;amp ;gt ;tbody &amp ;amp ;gt ;tr &amp ;amp ;gt ;td, .table
	 &amp ;amp ;gt ;tfoot &amp ;amp ;gt ;tr &amp ;amp ;gt ;td {
	vertical-align: middle;
}

@media screen and (max-width: 600px) {
	table#cart tbody td .form-control {
		width: 20%;
		display: inline !important;
	}
	.actions .btn {
		width: 36%;
		margin: 1.5em 0;
	}
	.actions .btn-info {
		float: left;
	}
	.actions .btn-danger {
		float: right;
	}
	table#cart thead {
		display: none;
	}
	table#cart tbody td {
		display: block;
		padding: .6rem;
		min-width: 320px;
	}
	table#cart tbody tr td:first-child {
		background: #333;
		color: #fff;
	}
	table#cart tbody td:before {
		content: attr(data-th);
		font-weight: bold;
		display: inline-block;
		width: 8rem;
	}
	table#cart tfoot td {
		display: block;
	}
	table#cart tfoot td .btn {
		display: block;
	}
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
					<a class="navbar-brand" href="home/index/${user.username}.htm"><img
						class="logo-web" src="images/thuan.png" /></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-center" style="padding-top: 20px;">
						<li class="active"><a href="home/index/${user.username}.htm">TRANG
								CHỦ</a></li>
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
						<c:choose>
							<c:when test="${user.username==null}">
							</c:when>
							<c:otherwise>
								<li><a href="cart/index/${user.username}.htm"><img
										src='<c:url value= "images/giohang.png" />'></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!---------------------------------------------------------------------------------------------->
	<h3 class="text-center" style="color: darkred; margin-top: 10px;">
		<strong>Giỏ hàng của bạn</strong>
	</h3>
	<br>
	<div class="container">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Tên sản phẩm</th>
					<th style="width: 10%">Giá</th>
					<th style="width: 8% ">Số lượng</th>
					<th style="width: 22%" class="text-center">Thành tiền</th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${ct}" varStatus="status">
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-3 col-md-3">
									<a class="thumbnail pull-left"
										href="home/one-product/${c.sanpham.maSP}/${user.username}.htm">
										<img class="media-object" src="${c.sanpham.anhSP}"
										style="width: 80px; height: 70px;">
									</a>
								</div>
								<div class="col-sm-8"
									style="padding-top: 20px;">
									<h4 class="nomargin">
										<a
											href="home/one-product/${c.sanpham.maSP}/${user.username}.htm">${c.sanpham.tenSP}</a>
									</h4>
								</div>
							</div>
						</td>

						<td style="padding-top: 38px;"><strong><f:formatNumber
									value="${c.sanpham.giaSP}" type="number" />₫</strong></td>
						<td style="padding-top: 30px;">
							<form action="cart/update/${c.maCTHD}.htm">
								<input type="number" name="soLuong" min="1" class="form-control"
									value="${c.soLuong}" />
							</form>
						</td>
						<td style="padding-top: 38px;" class="text-center"><strong><f:formatNumber
									value="${c.soTien}" type="number" />₫</strong></td>

						<td style="padding-top: 32px;" class="actions" data-th=""><a
							href="cart/delete/${c.maCTHD}.htm" />
							<button class="btn btn-danger btn-sm">
								<i class="fa fa-trash-o"> Delete </i>
							</button></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td><a href="home/index/${user.username}.htm"><button
								type="button" class="btn btn-default">
								<span class="glyphicon glyphicon-shopping-cart"></span> Tiếp tục
								mua hàng
							</button></a></td>
					<td> </td>
					<td> </td>
					<td data-th="Subtotal" class="text-center"
						style="color: red; padding-top: 10px"><h4>
							<strong>Tổng tiền: <strong><f:formatNumber
										value="${tong}" type="number" />₫</strong>
						</h4> <c:choose>
							<c:when test="${tong!=0}">
								<td><a href="cart/confirm/${mahd}/${tong}.htm"><button
											type="button" class="btn btn-success">
											Đặt hàng <span class="glyphicon glyphicon-play"></span>
										</button></a></td>
							</c:when>

						</c:choose>
				</tr>
			</tbody>
		</table>
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