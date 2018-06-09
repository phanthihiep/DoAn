<%@page import="model.bean.NhaHang"%>
<%@page import="model.bean.Memb"%>
<%@page import="model.bean.Food"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Member"%>
<%@page import="model.dao.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<body>
<%
	NhaHang nhaHang = (NhaHang)request.getAttribute("nhahang");
	Memb member = (Memb) session.getAttribute("user");
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
							<% if(member.getRoleId()==1){ %>
								<li class="hvr-underline-from-center">
									<a href="/TrangChuKHServlet">Trang chủ</a>
								</li>
								<li>
									<a class="scroll hvr-underline-from-center" href="#about">Thông tin</a>
								</li> 
								<%} else if(member.getRoleId()==2){ %>
								<li class="hvr-underline-from-center">
									<a href="/TrangChuServLet">Trang chủ</a>
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
								<%} %>
						</ul>
						<ul class="list-right">
							<li>
								<%
									if (session.getAttribute("user") != null) {
								%> <a
								href="/LogoutServlet" class="fas fa-sign-out-alt"aria-hidden="true"></a> 
									 <i style="color: white;">Xin chào ! <%=member.getTen()%></i> <%
								 	}
								 %>
							</li>
						</ul>
					</div>
					<div class="clearfix"></div>
					</nav>
					<div class="clearfix"></div>
				</div>
			</div><div class="clearfix"></div>
		</div>
	</div><br><br>
	
	<%if(member.getRoleId()==1){%>
	<div class="agile-footer w3ls-section">
		<div class="container" >
			<center>
			 <h4><ul class="nav nav-tabs" >
			   <li class=" hvr-underline-from-center" style="font-size: 20px; padding-right: 20px;" ><a href="/Index2Servlet?IdNH=<%=nhaHang.getId() %>"><i class="fa fa-home" aria-hidden="true">Chi tiết nhà hàng</i></a></li>
			   <li class=" hvr-underline-from-center" style="font-size: 20px; padding-right: 20px;"><a href="/HinhAnhServlet?IdNH=<%=nhaHang.getId()%>"><i class="fa fa-file-image-o" aria-hidden="true">Hình ảnh</i></a></li>
			   <li style="font-size: 22px; padding-right: 20px;"><a class=" hvr-underline-from-center" href="/DatBanIDServlet?IdNH=<%=nhaHang.getId()%>"><i class="fa fa-file-image-o" aria-hidden="true">Đặt bàn</i></a></li>
			   <li class=" hvr-underline-from-center" style="font-size: 20px; padding-right: 20px;"><a href="/MenuServlet?IdNH=<%=nhaHang.getId()%>"><i class="fa fa-file-image-o" aria-hidden="true">Menu</i> </a></li>
			 </ul></h4>
			</center>
		</div>
	</div>
	<%} %>
	<!--menu-->
	<% if(member.getRoleId()==2){ %>
	<div class="menu-agileits_w3layouts section">
		<div class="container">
			<div class="load_more">
				<h3 class="w3layouts-title">
					<img src="images/menu1.png" class="img-responsive" alt="" />Menu
					Restaurant
					<h4>Mã Nhà Hàng: <%=nhaHang.getId()%></h4><br>
				 </h3>
				<div class="text-center">
						<button type="button" class="btn">	
							<a href="/GetIdNHServlet?IdNH=<%=nhaHang.getId()%>"><i class="fa fa-plus" aria-hidden="true"> &nbsp Thêm Món Ăn</i></a>
						</button>
				</div>
				<ul id="myList">
					<li>
						<%
							ArrayList<Food> list = (ArrayList<Food>) request.getAttribute("listfood");
						%>
						<div class="l_g">
							<div class="l_g_r">
								<%
									for (int i = 0; i < list.size(); i++) {
										Food food = list.get(i);
								%>
								<div class="col-md-6 menu-grids">

									<div class="w3l-menu-text">
										<div class="menu-text-left">
											<img src="uploads/<%=food.getPicture()%>" alt=""
												style="width: 100px; height: 100px" class="img-responsive" />
										</div>
										<div class="menu-text-right">
											<div class="menu-title">
												<h4><%=food.getNameFood()%>
												</h4>
											</div>
											<div class="menu-price">
												<h4 class="price-clr"><%=food.getPrice()%>.đ
												</h4>
											</div>
											<div class="clearfix"></div>
											<div class="text-center">
												 <button type="button" class="delete" >
													<a href="/IdDeleteFoodServlet?id=<%=food.getId() %>"  ><i class="fa fa-trash" aria-hidden="true" > &nbsp Xóa</i></a>
												</button> 
												<button type="button" >
													<a href="/GetIdFoodServlet?id=<%=food.getId() %>"><i class="fa fa-pencil-square" aria-hidden="true"> &nbsp Sửa</i></a>
												</button> 
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<%}%>
								<div class="clearfix"></div>
							</div>
						</div>
					</li>
				</ul>
				<div class="nav-menu text-center">
					<div id="loadMore">Load more</div>
					<div id="showLess">Show less</div>
				</div>
			</div>
		</div>
	</div>
	<%} else if(member.getRoleId()==1){ %>
	<div class="menu-agileits_w3layouts section">
		<div class="container">
			<div class="load_more">
				<h3 class="w3layouts-title">
					<img src="images/menu1.png" class="img-responsive" alt="" />Menu Restaurant
					<h4>Mã Nhà Hàng: <%=nhaHang.getId()%></h4><br>
				 </h3>
				<ul id="myList">
					<li>
						<%
							ArrayList<Food> list = (ArrayList<Food>) request.getAttribute("listfood");
						%>
						<div class="l_g">
							<div class="l_g_r">
								<%
									for (int i = 0; i < list.size(); i++) {
										Food food = list.get(i);
								%>
								<div class="col-md-6 menu-grids">
									<div class="w3l-menu-text">
										<div class="menu-text-left">
											<img src="uploads/<%=food.getPicture()%>" alt=""
												style="width: 100px; height: 100px" class="img-responsive" />
										</div>
										<div class="menu-text-right">
											<div class="menu-title">
												<h4><%=food.getNameFood()%></h4>
											</div>
											<div class="menu-price">
												<h4 class="price-clr"><%=food.getPrice()%>.đ</h4>
											</div>
											<div class="clearfix"></div>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<%}%>
								<div class="clearfix"></div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<%} %>
	<!--//menu-->
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
	<!--//footer-->

	<!-- js -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!--/js-->
	<!-- //gallery -->
	<script src="js/jquery.tools.min.js"></script>
	<script src="js/jquery.mobile.custom.min.js"></script>
	<script src="js/jquery.cm-overlay.js"></script>

	<script>
		$(document).ready(function() {
			$('.cm-overlay').cmOverlay();
		});
	</script>
	<!-- //gallery -->
	<!--start-date-piker-->

	<script src="js/jquery-ui.js"></script>

	<!-- /End-date-piker -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!--//end-smooth-scrolling-->
	<!-- smooth-scrolling-of-move-up  -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>


	<script src="js/SmoothScroll.min.js"></script>

	<script>
		$(document).ready(function() {
			size_li = $("#myList li").size();
			x = 1;
			$('#myList li:lt(' + x + ')').show();
			$('#loadMore').click(function() {
				x = (x + 1 <= size_li) ? x + 1 : size_li;
				$('#myList li:lt(' + x + ')').show();
			});
			$('#showLess').click(function() {
				x = (x - 1 < 0) ? 1 : x - 1;
				$('#myList li').not(':lt(' + x + ')').hide();
			});
		});
	</script>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/bootstrap.js"></script>

</body>
</html>