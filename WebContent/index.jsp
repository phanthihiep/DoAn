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
	<link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" />
	<!--about-bottom -->
	<link type="text/css" rel="stylesheet" href="css/cm-overlay.css" />
	<!--about-bottom -->
	<link href="//fonts.googleapis.com/css?family=Yesteryear" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Rancho" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<div style="background-image: url('../images/logoo1.jpg');">
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
								
							</ul>
							<ul class="list-right">
								<li>
									<div class="text-right">
											<button data-toggle="modal" data-target="#myModal1" > Đăng nhập </button>
											<button data-toggle="modal" data-target="#myModal2" >Đăng ký</button>
									</div>
								</li>
							</ul>
						</div>
						<div class="clearfix"> </div>
					</nav>
					<div class="clearfix"> </div>
				</div>
			</div>
			<!-- banner -->
			<div class="container">
				<div class="banner-top">
					<div class="banner-info">
						<h1>
							<a href="index.html">
								<img src="images/logo.png" class="img-responsive" alt="" />Welcome Website</a>
						</h1>
						<h2>Share the food for the restaurant !</h2>

						<div class="about-p text-center">
							<span class="sub-title"></span>
							<span class="fa fa-cutlery" aria-hidden="true"></span>
							<span class="sub-title"></span>
						</div>
						<p>make your kinda meal<p>
					</div>
				</div>
			</div><div class="clearfix"> </div>
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
	<!-- Tooltip 2 -->
	<div class="tooltip-content">
		<div class="modal fade features-modal" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">
							<img src="images/logo.png" class="img-responsive img1" alt="" />Đăng Nhập</h3>
					</div>
					<div class="modal-body"> 
							<center><img src="images/m1.jpg" alt="" class="img-responsive" /></center>
						<form action="LoginServlet" method="post">
						    <label for="fname">Số điện thoại</label>
						    <input type="text" id="fname" name="name" placeholder="Số điện thoại.." required>
						
						    <label for="lname">Mật khẩu</label>
						    <input type="password" id="lname" name="pass" placeholder="Mật khẩu.." required>
						    <% if(request.getAttribute("error") != null){ %>
							<b style="color:red"><%=request.getAttribute("error")%></b>
							<%} %>
						    <div class="text-center">
								<button type="submit" class="btn" name="submit" > OK </button>
							</div><br>
						 </form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- //Tooltip 2 -->
	
	<!-- Tooltip 3 -->
	<div class="tooltip-content">
		<div class="modal fade features-modal" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">
							<img src="images/logo.png" class="img-responsive img1" alt="" />Đăng Ký</h3>
					</div>
					<div class="modal-body"> 
						<form action="RegisterServlet" method="post">
						    <label for="lname">Họ Tên:</label>
						    <input type="text" id="lname" name="name1" placeholder="Họ tên.." required>
						    <label for="lname">Mật khẩu</label>
						    <input type="text" id="lname" name="pass1" placeholder="Mật khẩu đăng nhập.." required>
						    <label for="sel1">Bạn là :</label>
						    <select class="form-control" name="role" id="role">
						        <option value="1">Khách hàng</option>
						        <option value="2">Nhà hàng</option>
						      </select>
						    <label for="lname">Số điện thoại</label>
						    <input type="text" id="lname" name="sdt" placeholder="Số điện thoại.." required>
						    <div class="text-center">
								<button type="submit" class="btn"> Đăng ký </button>
							</div><br>
						 </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Tooltip 3 -->
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