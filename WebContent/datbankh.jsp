<%@page import="model.bean.BaiDang"%>
<%@page import="model.bean.KhachHang"%>
<%@page import="model.bean.NhaHang"%>
<%@page import="model.bean.Memb"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.InformationRestaurant"%>
<%@page import="model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restaurant</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Spicy Bite Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- //for-mobile-apps -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9" crossorigin="anonymous">

	
	<!--about-bottom -->
	<link type="text/css" rel="stylesheet" href="css/cm-overlay.css" />
	<!--about-bottom -->
	<link href="//fonts.googleapis.com/css?family=Yesteryear" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Rancho" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<style>
	.checked {
	    color: orange;
	}
</style>
</head>
<body>
<% 
	Memb member = (Memb) session.getAttribute("user");
	NhaHang nh = (NhaHang) request.getAttribute("nhahang");
	KhachHang kh= (KhachHang) request.getAttribute("infoKH");
	%>
	<div >
		<div>
			<div class="header-main">
				<div class="container">
					<nav class="navbar navbar-default">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>

						</div>
						<!-- navbar-header -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right">
							<!-- - customer -->
								<li class="hvr-underline-from-center">
									<a href="/TrangChuKHServlet">Trang chủ</a>
								</li>
								<li>
									<a class="scroll hvr-underline-from-center" href="#about">Thông tin</a>
								</li> 
							</ul>
							<ul class="list-right">
								<li>
									<a href="/LogoutServlet" class="fas fa-sign-out-alt" aria-hidden="true"></a>
								    <i style="color: white;">Xin chào ! <%=member.getTen()%></i>
								</li>
							</ul>
						<div class="clearfix"> </div>
					</nav>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div><div class="clearfix"> </div>
	</div><br><br><br><br>
	<div class="agile-footer w3ls-section">
		<div class="container" >
			<center>
			 <h4><ul class="nav nav-tabs" >
			   <li style="font-size: 22px; padding-right: 20px;" ><a class=" hvr-underline-from-center" href="/Index2Servlet?IdNH=<%=nh.getId() %>"><i class="fa fa-home" aria-hidden="true">Chi tiết nhà hàng</i></a></li>
			   <li style="font-size: 22px; padding-right: 20px;"><a class=" hvr-underline-from-center" href="/HinhAnhServlet?IdNH=<%=nh.getId()%>"><i class="fa fa-file-image-o" aria-hidden="true">Hình ảnh</i></a></li>
			   <li style="font-size: 22px; padding-right: 20px;"><a class=" hvr-underline-from-center" href="/HinhAnhServlet?IdNH=<%=nh.getId()%>"><i class="fa fa-file-image-o" aria-hidden="true">Đặt bàn</i></a></li>
			   <li style="font-size: 22px; padding-right: 20px;"><a class="hvr-underline-from-center" href="/MenuServlet?IdNH=<%=nh.getId()%>"><i class="fa fa-file-image-o" aria-hidden="true">Menu</i> </a></li>
			 </ul></h4>
			</center>
		</div>
	</div>
	<!--//menu-->
	<div class="section">
		<div class="w3_agileits-subscribe timings text-center">
			<h4>opening times</h4>
			<div class="about-p  text-center">
				<span class="sub-title p1"></span>
				<span class="fa fa-cutlery" aria-hidden="true"></span>
				<span class="sub-title p1"></span>

			</div>
			<div class="time">
				<h5>Monday – Friday </h5>
				<p><%=nh.getTgmo() %></p>
				<h5>Saturday – Sunday </h5>
				<p><%=nh.getRgdong() %></p>
			</div>
		</div>
	</div>
	<div class="reservation book-right">
		<div class="container">
			<h3 class="w3layouts-title title-reserve">Đặt Bàn Tại Nhà Hàng</h3>
			<div class="book-left1"></div>
			<div class="book-right1">
				<form action="/DatBanServlet" method="post" class="book-right2">
					
					<div class="date-field">
						<label>Họ Tên :</label>
						<input type="text" name="ten" required="">
					</div>	
					<div class="date-field">
						<label>Ngày Đặt :</label>
						<input type="text" id="datepicker" name="ngay" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"
						required="">
					</div>	
					<div class="form-left">
						<label>Số Người :</label>
						<input type="number" placeholder="số người.." name="nguoi" required="">
					</div>
					<div class="form-right">
						<label>Mã Nhà Hàng:</label>
						<input type="text"  name="idNH" value="<%=nh.getId()%>" readonly>
					</div>
					<div class="form-right">
						<label>Thời Gian :</label>
						<input type="time" placeholder="thời gian.." name="tgian" required="">
					</div>
					<div class="clearfix"> </div>
					<div class="phone-info">
						<label>Số Điện Thoại :</label>
						<input type="text" placeholder="Số điện thoại.." name="sdt" required="">
					</div>	
					<div class="phone-info">
						<label>Email :</label>
						<input type="text" placeholder="Email.." name="mail" required="">
					</div>
					<input type="submit" onclick="alert('Bạn đã đặt bàn thành công, vui lòng kiểm tra email!')" value="Đặt">
				</form>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div><br><br><br>
	<div class="contact-bottom" id="contact">
		<div class="col-md-6  map">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d245367.85397730832!2d107.93803751302134!3d16.072093425875124!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219c792252a13%3A0x1df0cb4b86727e06!2zxJDDoCBO4bq1bmcsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1527428398918" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>
		<div class="col-md-6 contact-right">
			<h3 class="title-contact">Đánh giá</h3>
			<div class="stars">
			  <form action="">
			    <span class="fa fa-star checked" ></span>
				<span class="fa fa-star checked" ></span>
				<span class="fa fa-star checked" ></span>
				<span class="fa fa-star" onclick="checked()"></span>
				<span class="fa fa-star"></span>
			  </form>
			</div>
			<!-- <script>
			function checked() {
			    color: orange;
			}
			</script> -->
			<form action="#" method="post">
				<label>Mã khách hàng - Mã nhà hàng:</label>
				<div class="contact-input">
					
					<input type="text" class="name" name="name" value="<%=kh.getId() %>" readonly>
				</div>	
				<div class="contact-input">
					<input type="text" class="name" name="name" value="<%=nh.getId() %>" readonly>
				</div>
					<label>khách hàng:</label>
				<div class="contact-input">
					
					<input type="text" class="name" name="name" value="<%=member.getTen() %>" readonly>
				</div>
				<div class="contact-input">
					<textarea placeholder="Your Message" required=""></textarea>
				</div>
					<input type="submit" value="SEND MESSAGE">
			</form>
		</div>
		<div class="clearfix"></div>
	</div>
	
	<div class="footer-cpy text-center">
		<div class="social_banner">
			<ul class="social_list">
				<li>
					<a href="#" class="facebook">
						<span class="fa fa-facebook" aria-hidden="true"></span>
					</a>
				</li>
				<li>
					<a href="#" class="twitter">
						<span class="fa fa-twitter" aria-hidden="true"></span>
					</a>
				</li>
				<li>
					<a href="#" class="dribble">
						<span class="fa fa-dribbble" aria-hidden="true"></span>
					</a>
				</li>
				<li>
					<a href="#" class="vimeo">
						<span class="fa fa-vimeo" aria-hidden="true"></span>
					</a>
				</li>
			</ul>
		</div>
		<div class="footer-copy">
			<p>© 2018 Website Restaurant. Please come with us | Design by
				<a href="#">Students</a>
			</p>
		</div>
	</div>
	<script src="js/jquery-2.2.3.min.js"></script>
	<script src="js/jquery.tools.min.js"></script>
	<script src="js/jquery.mobile.custom.min.js"></script>
	<script src="js/jquery.cm-overlay.js"></script>

	<script>
		$(document).ready(function () {
			$('.cm-overlay').cmOverlay();
		});
	</script>
	<link rel="stylesheet" href="css/jquery-ui.css" />
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function () {
			$("#datepicker,#datepicker1").datepicker();
		});
	</script>
	<!-- /End-date-piker -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function () {
			$().UItoTop({
				easingType: 'easeOutQuart'
			});
		});
	</script>
	<script src="js/SmoothScroll.min.js"></script>
	<script>
		$(document).ready(function () {
			size_li = $("#myList li").size();
			x = 1;
			$('#myList li:lt(' + x + ')').show();
			$('#loadMore').click(function () {
				x = (x + 1 <= size_li) ? x + 1 : size_li;
				$('#myList li:lt(' + x + ')').show();
			});
			$('#showLess').click(function () {
				x = (x - 1 < 0) ? 1 : x - 1;
				$('#myList li').not(':lt(' + x + ')').hide();
			});
		});
	</script>
	<script src="js/bootstrap.js"></script>
	
	<script >
	var textarea = document.querySelector('textarea');

	textarea.addEventListener('keydown', autosize);
	             
	function autosize(){
	  var el = this;
	  setTimeout(function(){
	    el.style.cssText = 'height:auto; padding:0';
	    // for box-sizing other than "content-box" use:
	    // el.style.cssText = '-moz-box-sizing:content-box';
	    el.style.cssText = 'height:' + el.scrollHeight + 'px;' + 'overflow:hidden; border:none; width: 100%;';
	  },0);
	}
	</script>
</body>
</html>