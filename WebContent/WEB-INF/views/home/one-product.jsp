<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>${sanpham.tenSP}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="vendor/bootstrap.js"></script>
<script type="text/javascript" src="js/1.js"></script>
<link rel="stylesheet" href="vendor/bootstrap.css">
<link rel="stylesheet" href="vendor/font-awesome.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/single.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
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
						<li style="padding-left: 40px">
							<div class="search-box">
								<c:set var="timkiem" scope="session" value="" />
								<form class="search-form" role="search" 
									action="home/search/${user.username}.htm">
									<input type="text" name="timkiem" value="${timkiem}"
										class="form-control" placeholder="Search" style="width: 300px;">
									<button type="submit" class="btn btn-link search-btn">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</form>
							</div> 
						</li>
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
	<!------------------------------------------------------------------------------------->
	<div class="container" style="background-color: white">
		<div class="row">
			<div class="col-lg-12">
				<div class="card mb-10">
					<div class="card-header">
						<nav class="header-navigation">

							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a
									href="home/index/${user.username}.htm">Trang chủ</a></li>
								<li class="breadcrumb-item active" aria-current="page">${sanpham.tenSP}</li>
							</ol>
						</nav>
					</div>
					<div class="card-body store-body">
						<div class="product-info">
							<div class="product-gallery">
								<div class="product-gallery-featured">
									<img src="${sanpham.anhSP}" alt="">
								</div>
							</div>
							<div class="product-seller-recommended">
								<div class="product-comments">
									<h3 class="mb-2">Bình luận</h3>
									<form action="" class="form-inline mb-5">
										<textarea name="" id="" cols="70" rows="2"
											class="form-control mr-4" placeholder="Viết bình luận..."></textarea>
										<button class="btn btn-lg btn-primary"
											style="margin-left: 20px">Gửi</button>
									</form>

								</div>
							</div>
						</div>
						<div class="product-payment-details">
							<p class="last-sold text-muted" style="color: red;">
								<small>Còn ${sanpham.soLuongSP} sản phẩm</small>
							</p>
							<h4 class="product-title mb-2" style="color: darkblue;">${sanpham.tenSP}</h4>
							<h2 class="product-price display-4 text-center"
								style="color: darkred"><f:formatNumber value="${sanpham.giaSP}" type="number" />₫</h2>
							<br>
							<h3 class="mb-5" style="color: gray;">Chi tiết sản phẩm</h3>
							<table class="table table-hover table-bordered">
								<tr>
									<th style="width: 18%; text-align: center;">Mô tả</th>
									<td>${sanpham.moTaSP}</td>
								</tr>
							</table>

							<label for="quant">Số lượng</label>
							<c:set var="soluong" scope="session" value="1" />
							<input  style="width: 18%;" type="number" name="soluong" min="1" id="soluong"
								class="form-control mb-5 input-lg" value="1">

							<c:choose>
								<c:when test="${user.username==null}">
									<form:form action="user/login.htm">
										<button type="submit" class="btn btn-default addcart">
											+<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
										</button>
									</form:form>
								</c:when>
								<c:otherwise>
									<form:form
										action="home/addtocart/${p.maSP}/${user.username}/${soluong}.htm"
										method="post">
										<button type="submit" class="btn btn-default addcart">
											+<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
										</button>
									</form:form>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>
	<!-- Footer -->
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
	<!-- Footer -->
</body>
</html>