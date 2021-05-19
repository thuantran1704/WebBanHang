<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Trang chủ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="vendor/bootstrap.js"></script>
<script type="text/javascript" src="js/1.js"></script>
<script type="text/javascript" src="js/jquery.scrollUp.min.js"></script>
<link rel="stylesheet" href="vendor/bootstrap.css">
<link rel="stylesheet" href="vendor/font-awesome.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/login.css">

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
						<li><a href="home/error/${user.username}.htm">DỊCH VỤ</a></li>
						<li><a href="home/error/${user.username}.htm">LIÊN HỆ</a></li>
						<li style="padding-left: 40px">
							<div class="search-box">
								<c:set var="timkiem" scope="session" value="" />
								<form class="search-form" role="search"
									action="home/search/${user.username}.htm">
									<input type="text" name="timkiem" value="${timkiem}"
										class="form-control" placeholder="Search"
										style="width: 300px;">
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
	<!---------------------------------------------------------------------------------------------->
	<!-- SLIDE DISCOUNT -->
	<div class="container slidediscount">
		<div id="carousel-id" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel-id" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-id" data-slide-to="1" class=""></li>
				<li data-target="#carousel-id" data-slide-to="2" class=""></li>
				<li data-target="#carousel-id" data-slide-to="3" class=""></li>
				<li data-target="#carousel-id" data-slide-to="4" class=""></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img data-src="" alt="First slide" src="images/banner2.jpg">
					<div class="container"></div>
				</div>
				<div class="item">
					<img data-src="" alt="Second slide" src="images/banner1.png">
					<div class="container"></div>
				</div>
				<div class="item">
					<img data-src="" alt="Third slide" src="images/banner3.jpg">
					<div class="container"></div>
				</div>

				<div class="item">
					<img data-src="" alt="Fourth slide" src="images/banner_holiday.jpg">

					<div class="container"></div>
				</div>

			</div>
			<a class="left carousel-control" href="#carousel-id"
				data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
			<a class="right carousel-control" href="#carousel-id"
				data-slide="next"><span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>
	<!---------------------------------------------------------------------------------------------->

	<!-- TOP 10 SẢN PHẨM NỔI BẬT -->
	<br>
	<div class="small-container">
		<h3 class="title">Các sản phẩm nổi bật</h3>
	</div>
	<div class="container">
		<c:forEach var="p" begin="1" end="4" items="${randomproduct}">
			<div class="col-md-3 col-lg-3">
				<div class="item product text-center">
					<a href="home/one-product/${p.maSP}/${user.username}.htm"> <img
						width="180px" height="180px" data-original="${p.anhSP}"
						class=" lazyloaded img-responsive imgproduct" src="${p.anhSP}">
						<h4 class="nameproduct"
							style="margin-left: 5px; margin-right: 5px;">${p.tenSP}</h4>
						<div class="priceproduct">
							<strong style="font-size: 16px;"><f:formatNumber
									value="${p.giaSP}" type="number" />₫</strong>
						</div>
					</a>
					<c:set var="soluong" scope="session" value="1" />
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
		</c:forEach>
	</div>

	<!---------------------------------------------------------------------------------------------->
	<div>
		<br>
	</div>
	<!-- GUCCI -->
	<div class="small-container text-center">
		<h2 class="title2">GUCCI</h2>
		<h5>
			<a href="home/gucci/${user.username}.htm">Xem thêm</a>
		</h5>
	</div>
	<div class="container">

		<c:forEach var="p" begin="1" end="4" items="${SPGucci}">
			<div class="col-md-3 col-lg-3">

				<div class="item product text-center">
					<a href="home/one-product/${p.maSP}/${user.username}.htm"> <img
						width="180px" height="180px" data-original="${p.anhSP}"
						class=" lazyloaded img-responsive imgproduct" src="${p.anhSP}">
						<h4 class="nameproduct"
							style="margin-left: 5px; margin-right: 5px;">${p.tenSP}</h4>
						<div class="priceproduct">
							<strong style="font-size: 16px;"><f:formatNumber
									value="${p.giaSP}" type="number" />₫</strong>
						</div>
					</a>
					<c:set var="soluong" scope="session" value="1" />
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
		</c:forEach>
	</div>
	<!---------------------------------------------------------------------------------------------->
	<div>
		<hr>
	</div>

	<!-- DIOR -->
	<div class="small-container text-center">
		<h2 class="title2">DIOR</h2>
		<h5>
			<a href="home/dior/${user.username}.htm">Xem thêm</a>
		</h5>
	</div>
	<div class="container">

		<c:forEach var="p" begin="1" end="4" items="${SPDior}">
			<div class="col-md-3 col-lg-3">

				<div class="item product text-center">
					<a href="home/one-product/${p.maSP}/${user.username}.htm"> <img
						width="180px" height="180px" data-original="${p.anhSP}"
						class=" lazyloaded img-responsive imgproduct" src="${p.anhSP}">
						<h4 class="nameproduct"
							style="margin-left: 5px; margin-right: 5px;">${p.tenSP}</h4>
						<div class="priceproduct">
							<strong style="font-size: 16px;"><f:formatNumber
									value="${p.giaSP}" type="number" />₫</strong>
						</div>
					</a>
					<c:set var="soluong" scope="session" value="1" />
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
		</c:forEach>
	</div>
	<!---------------------------------------------------------------------------------------------->
	<div>
		<hr>
	</div>

	<!-- Rayban -->
	<div class="small-container text-center">
		<h2 class="title2">Rayban</h2>
		<h5>
			<a href="home/rayban/${user.username}.htm">Xem thêm</a>
		</h5>
	</div>
	<div class="container">

		<c:forEach var="p" begin="1" end="4" items="${SPRayban}">
			<div class="col-md-3 col-lg-3">

				<div class="item product text-center">
					<a href="home/one-product/${p.maSP}/${user.username}.htm"> <img
						width="180px" height="180px" data-original="${p.anhSP}"
						class=" lazyloaded img-responsive imgproduct" src="${p.anhSP}">
						<h4 class="nameproduct"
							style="margin-left: 5px; margin-right: 5px;">${p.tenSP}</h4>

						<div class="priceproduct">
							<strong style="font-size: 16px;"><f:formatNumber
									value="${p.giaSP}" type="number" />₫</strong>
						</div>
					</a>
					<c:set var="soluong" scope="session" value="1" />
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
		</c:forEach>
	</div>

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
	<br>
	<!---------------------------------------------------------------------------------------------->
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
	<div class="button_scroll2top" onclick="page_scroll2top()">
		<div class="fa fa-chevron-up"/>
	</div>
</body>

</html>
