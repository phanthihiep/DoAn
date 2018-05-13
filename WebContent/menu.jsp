<%@page import="model.bean.Food"%>
<%@page import="java.util.ArrayList"%>
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
<meta name="keywords"
	content="Spicy Bite Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
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
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.12/css/all.css"
	integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9"
	crossorigin="anonymous">
<!--about-bottom -->
<link type="text/css" rel="stylesheet" href="css/cm-overlay.css" />
<!--about-bottom -->
<link href="//fonts.googleapis.com/css?family=Yesteryear"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Rancho" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i"
	rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
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
							<li class="scroll hvr-underline-from-center"><a
								href="index.html">Trang chủ</a></li>
							<li><a class="scroll hvr-underline-from-center"
								href="#about">Thông tin</a></li>
							<li><a class="scroll hvr-underline-from-center" href="#menu">Menu</a>
							</li>
							<li><a class="scroll hvr-underline-from-center" href="#team">Hình
									ảnh</a></li>
						</ul>
						<ul class="list-right">
							<li>
								<%
									if (session.getAttribute("user") != null) {
								%> <a
								href="/LogoutServlet" class="fas fa-sign-out-alt"
																aria-hidden="true"></a> <%
								 	Member member = (Member) session.getAttribute("user");
								 %> <i style="color: white;">Xin chào ! <%=member.getMaTV()%></i> <%
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
	</div>

	<!--menu-->
	<div class="menu-agileits_w3layouts section">
		<div class="container">

			<div class="load_more">
				<h3 class="w3layouts-title">
					<img src="images/menu1.png" class="img-responsive" alt="" />Menu
					Restaurant
				</h3>
				<div class="text-center">
					<button type="button" class="btn">
						<i class="fa fa-plus" aria-hidden="true"> &nbsp Thêm Món Ăn</i>
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
											<img src="images/<%=food.getPicture()%>" alt=""
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
												<button type="button" class="btn">
													<i class="fa fa-trash" aria-hidden="true"> &nbsp Xóa</i>
												</button>
												<button type="button" class="btn">
													<i class="fa fa-pencil-square-o" aria-hidden="true"> &nbsp Sửa</i>
												</button>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>

								</div>
								<%
									}
								%>
								<div class="clearfix"></div>
							</div>
						</div>

					</li>
				</ul>
			</div>
		</div>

	</div>
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