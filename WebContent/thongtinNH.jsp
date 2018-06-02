
<%@page import="model.bean.NhaHang"%>
<%@page import="model.bean.Memb"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
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
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$('#txttendangnhap').blur(function(e) {
			if (validatePhone('txttendangnhap')) {
				$('#spnPhoneStatus').html(' ');
				$('#spnPhoneStatus').css('color', 'white');
			} else {
				$('#spnPhoneStatus').html('nhập sai định dạng');
				$('#spnPhoneStatus').css('color', 'red');
			}
		});
	});
	function validatePhone(txttendangnhap) {
		var a = document.getElementById(txttendangnhap).value;
		var filter = /^\+84[0-9]{7}$/;
		var filter1=/^091[0-9]{7}$/;
		var filter2=/^090[0-9]{7}$/;
		var filter3=/^012[0-9]{8}$/;
		var filter4=/^016[0-9]{8}$/;
		if (filter.test(a) || filter1.test(a) || filter2.test(a)|| filter3.test(a) || filter4.test(a) ) { 
			return true;
		} else {
			return false;
		}
	}
</script>
<body>
<%
	NhaHang nhaHang = (NhaHang)request.getAttribute("nhahang");
%> 
	<div>
		<div><br><br>
			<div class="header-main">
				<div class="container">
					<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>

					</div>
					<!-- navbar-header -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<!-- - customer -->
								<li class="hvr-underline-from-center">
									<a href="/TrangChuServlet">Trang chủ</a>
								</li>
								<li>
									<a class="hvr-underline-from-center" href="/IdNHServlet?IdNH=<%=nhaHang.getId()%>">Thông tin</a>
								</li> 
								<li>
									<a class="hvr-underline-from-center" href="/DSDatBanServlet?IdNH=<%=nhaHang.getId()%>">Đặt Bàn</a>
								</li>
								<li>
									<a class="hvr-underline-from-center" href="/MenuServlet?IdNH=<%=nhaHang.getId()%>">Menu</a>
								</li>
							</ul>
						<ul class="list-right">
							<li>
							<%
									if (session.getAttribute("user") != null) {
								%> <a
								href="/LogoutServlet" class="fas fa-sign-out-alt"
																aria-hidden="true"></a> <%
								 	Memb member = (Memb) session.getAttribute("user");
								 %> <i style="color: white;">Xin chào ! <%=member.getTen()%></i> <%
								 	}
							 %>  
							</li>
						</ul>
					</div>
					<div class="clearfix"></div>
					</nav>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- //menu -->
			<!-- banner -->
			<div class="clearfix"></div>
		</div>
	</div><br>
	<div class="section w3ls-banner-btm-main" id="about">
		<div class="container">
			<div class="col-md-12 contact-right">
			<h3 class="title-contact">Cập nhật thông tin nhà hàng</h3>
			<form action="ThongTinNHServlet" method="post">
				<label>Mã nhà nhà - Tên nhà hàng:</label>
				<div class="contact-input">
					<input type="text" class="name" name="id" value="<%=nhaHang.getId() %>" readonly>
				</div>	
				<div class="contact-input">
					<input type="text" class="name" name="name" placeholder="Tên nhà hàng" required="">
				</div>	
				<label>Số điện thoại - Địa chỉ:</label>
				<div class="contact-input">
					<input type="text" class="name" name="sdt" id="txttendangnhap" placeholder="Số điện thoại" required="">
					<span id="spnPhoneStatus"></span>
				</div>
				<div class="contact-input">
					<input type="text" class="name" name="diachi" placeholder="địa chỉ" required="">
				</div>	
				<label>Email :</label>
				<div class="contact-input">
					<input type="email" class="name" name="email" placeholder="Email" required="">
				</div>
				<label> Hình đại diện:</label>
				<div class="contact-input">
					<input type="file" class="name" name="hinh"  required="">
				</div><br><br>
				<label>Thời gian mở cửa - Thời gian đóng cửa :</label>
				<div class="contact-input">
					<input type="time" class="name" name="tgmo" required="">
					<input type="time" class="name" name="tgdong" required="">
				</div>	
				<label>Giới thiệu nhà hàng:</label>
				<div class="contact-input">
					<textarea placeholder="Giới thiệu" name="gioithieu" required=""></textarea>
				</div>
					<center><input type="submit" onclick="alert('Bạn đã cập nhật thành công!')" value="Cập nhật"></center>
			</form>
		</div>
		</div>
	</div>
	<div class="footer-cpy text-center">
		<div class="social_banner">
			<ul class="social_list">
				<li><a href="#" class="facebook"> <span
						class="fa fa-facebook" aria-hidden="true"></span>
				</a></li>
				<li><a href="#" class="twitter"> <span
						class="fa fa-twitter" aria-hidden="true"></span>
				</a></li>
				<li><a href="#" class="dribble"> <span
						class="fa fa-dribbble" aria-hidden="true"></span>
				</a></li>
				<li><a href="#" class="vimeo"> <span class="fa fa-vimeo"
						aria-hidden="true"></span>
				</a></li>
			</ul>
		</div>
		<div class="footer-copy">
			<p>
				© 2018 Website Restaurant. Please come with us | Design by <a
					href="#">Students</a>
			</p>
		</div>
	</div>
</body>
</html>