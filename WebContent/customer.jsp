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
</head>
<body>
	<div class="agile-banner-main" id="home">
		<div class="banner-layer">
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
							<!-- Restaurant -->
								 <%if(session.getAttribute("user") != null){  
								 Member member = (Member) session.getAttribute("user");
								 if(member.getRoleId()==2){
								  %> 
								<li class="scroll hvr-underline-from-center">
									<a href="index.html">Trang chủ</a>
								</li>
								<li>
									<a class="scroll hvr-underline-from-center" href="#about">Thông tin</a>
								</li>
								<li>
									<a class="hvr-underline-from-center" href="/MenuServlet">Menu</a>
								</li>
								<li>
									<a class="scroll hvr-underline-from-center" href="#team">Hình ảnh</a>
								</li>
								 <% }
								else if(member.getRoleId()==1){%>
							<!-- - customer -->
								<li class="scroll hvr-underline-from-center">
									<a href="index.html">Trang chủ</a>
								</li>
								<li>
									<a class="scroll hvr-underline-from-center" href="#about">Thông tin</a>
								</li> 
								<%} }%>
							</ul>
							
							
							<ul class="list-right">
								<li>
									<%if(session.getAttribute("user") != null){ %> 
									<a href="/LogoutServlet" class="fas fa-sign-out-alt" aria-hidden="true"></a>
								    	<% Member member = (Member) session.getAttribute("user");
								    %>
								    <i style="color: white;">Xin chào ! <%=member.getMaTV()%></i>
								    <% } %>
								</li>
							</ul>
						</div>


						<div class="clearfix"> </div>
					</nav>
					<div class="clearfix"> </div>
				</div>
			</div>
			<!-- //menu -->
			<!-- banner -->
			<div class="container">
				<div class="banner-top">
					<div class="banner-info">
						<h1>
							<a href="index.html">
								<img src="images/logo.png" class="img-responsive" alt="" />Spicy Bite</a>
						</h1>
						<h2>Tasty experience in every bite!</h2>

						<div class="about-p text-center">
							<span class="sub-title"></span>
							<span class="fa fa-cutlery" aria-hidden="true"></span>
							<span class="sub-title"></span>
						</div>
						<p>make your kinda meal
							<p>

					</div>
				</div>

			</div>

			<div class="clearfix"> </div>
		</div>
	</div>
	
	<!-- about -->
	<div class="section w3ls-banner-btm-main" id="about">
		<div class="container">
			<div class="banner-btm">
				<div class="col-md-6 banner-btm-g1">
					<img src="images/about.jpg" class="img-responsive" alt="" />
				</div>
				<div class="col-md-6 banner-btm-g2">
					<h3 class="title-main">Tên Nhà Hàng </h3>
					<h4 class="sub-title">Giới thiệu về nhà hàng.</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae nunc auctor, malesuada est eu, pellentesque nisi.
						Nam in enim lacinia, hendrerit neque non, placerat quam.Mauris eu tortor congue purus congue iaculis sit amet tincidunt
						neque. Aliquam suscipit nisi erat, non ultricies ex aliquet a.

					</p>
					<div class="find-about">
						<a href="#" data-toggle="modal" data-target="#myModal">Chỉnh sửa thông tin</a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	<!-- //testimonials -->
	
	<div class="menu-agileits_w3layouts section">
		<div class="container">

			<div class="load_more">
				<h3 class="w3layouts-title">
					<img src="images/menu1.png" class="img-responsive" alt="" />Bài Đăng</h3>
				<ul id="myList">
					<li>
						<div class="l_g">
							<div class="l_g_r">
								<div class="col-md-12 menu-grids">
									<div class="w3l-menu-text">
										<div>
											<div class="menu-text-left" style="width:auto">
												<img src="images/m1.jpg" alt="" class="img-responsive" />
											</div>
											<div class="menu-text-right">
												<div class="menu-title">
													<textarea  style="overflow: hidden !important"  rows="1" placeholder='Bạn muốn viết gì về món ăn'></textarea>
	
												</div>
												<div class="clearfix"></div>
												
											</div>
											<div class="clearfix"> </div>
										</div><div class="clearfix"> </div><br>
										<div>
											<center><img alt="" src="images/about2.jpg" class="img-responsive"></center>
													
										</div>
										<hr>
										<div>
											<button type="button" class="btn"><i class="fa fa-picture-o" aria-hidden="true" >&nbsp Ảnh/Video</i></button>
											<button type="button" class="btn"><i class="fa fa-map-marker" aria-hidden="true">&nbsp Check in</i></button>
											<button type="button" class="btn"><i class="fa fa-video-camera" aria-hidden="true">&nbsp Video trực tiếp</i></button>
										</div>
										<hr>
										<div class="text-right">
											<button type="button" class="btn" > Hủy </button>
											<button type="button" class="btn btn-info" >Đăng</button>
										</div>
									</div>			
								</div>
								<div class="clearfix"> </div>
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
				<p>9:00 AM – 11:00 PM</p>
				<h5>Saturday – Sunday </h5>
				<p>8:00 AM – 00:00 AM</p>
			</div>
		</div>
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
	<!--//footer-->



	<!-- Tooltip -->
	<div class="tooltip-content">
		<div class="modal fade features-modal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">
							<img src="images/logo.png" class="img-responsive img1" alt="" />Cập Nhật Thông Tin</h3>
					</div>
					<div class="modal-body">
						<img src="images/modal.jpg" class="img-responsive" alt="image"><br>
						<div class="text-right">
								<button type="button" class="btn" > Chọn ảnh </button>
						</div>
						<h4>Tên Nhà Hàng</h4>
						 <form>
						    <div class="form-group">
						      <label for="comment">Giới thiệu về nhà hàng:</label>
						      <textarea class="form-control" rows="5" id="comment"></textarea>
						      <label for="fname">Thời gian đóng - mở cửa Thứ 2 - Thứ 6</label>
							    <input type="text" id="fname" name="name" placeholder="Thời gian..">
							
							    <label for="lname">Thời gian đóng - mở cửa Thứ 7 - Chủ nhật</label>
							    <input type="text" id="lname" name="pass" placeholder="Thời gian..">
						    </div>
						    <div class="text-center">
								<button type="button" class="btn" > Cập nhật </button>
							</div><br>
						  </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Tooltip -->

	<!-- js -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!--/js-->
	<!-- //gallery -->
	<script src="js/jquery.tools.min.js"></script>
	<script src="js/jquery.mobile.custom.min.js"></script>
	<script src="js/jquery.cm-overlay.js"></script>

	<script>
		$(document).ready(function () {
			$('.cm-overlay').cmOverlay();
		});
	</script>
	<!-- //gallery -->
	<!--start-date-piker-->
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
	<!--//end-smooth-scrolling-->
	<!-- smooth-scrolling-of-move-up  -->
	<script type="text/javascript">
		$(document).ready(function () {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			*/

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
	
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
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