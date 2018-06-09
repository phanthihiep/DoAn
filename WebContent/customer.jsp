<%@page import="model.bean.BaiDang"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-16">
<title>Restaurant</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-16" />
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
<%if(session.getAttribute("user") != null){  
	Memb member = (Memb) session.getAttribute("user");
	NhaHang nh = (NhaHang) session.getAttribute("nhahang");
	if(member.getRoleId()==2){ %>
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
							<!-- - customer -->
								<li class="hvr-underline-from-center">
									<a href="/TrangChuServLet">Trang chủ</a>
								</li>
								<li>
									<a class="hvr-underline-from-center" href="/IdNHServlet?IdNH=<%=nh.getId()%>">Thông tin</a>
								</li> 
								<li>
									<a class="hvr-underline-from-center" href="/DSDatBanServlet?IdNH=<%=nh.getId()%>">Đặt Bàn</a>
								</li>
								<li>
									<a class="hvr-underline-from-center" href="/MenuServlet?IdNH=<%=nh.getId()%>">Menu</a>
								</li>
							</ul>
							<ul class="list-right">
								<li>
									<a href="/LogoutServlet" class="fas fa-sign-out-alt" aria-hidden="true"></a>
								    <i style="color: white;">Xin chào ! <%=member.getTen()%></i>
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
							<a href="#">
								<img src="images/logo.png" class="img-responsive" alt="" />WebSite</a>
						</h1>
						<h2>Hệ thống các nhà hàng!</h2>
						<div class="about-p text-center">
							<span class="sub-title"></span>
							<span class="fa fa-cutlery" aria-hidden="true"></span>
							<span class="sub-title"></span>
						</div>
						<p>chia sẻ các món ăn<p>
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div> 	
	<div class="clearfix"> </div>
		<%}
	else if(member.getRoleId()==1){%>
	<div>
		<div><br><br>
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
								<li class="scroll hvr-underline-from-center">
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
						</div>


						<div class="clearfix"> </div>
					</nav>
					<div class="clearfix"> </div>
				</div>
			</div>
			<!-- //menu -->
			<div class="clearfix"> </div>
		</div>
	</div>
	<div class="clearfix"> </div>
	<%} }%>
	<!-- about -->
	<%if(session.getAttribute("user") != null){  
		 Memb member = (Memb) session.getAttribute("user");
		 if(member.getRoleId()==1){ %> 
		<br>
	<div class="section main-menu" id="menu">
		<div class="container">
			<div class="main-menu-bg">
				<h3 class="w3layouts-title text-center">List Restaurants</h3>
				<div class="menu-info">
					<ul class="nav nav-tabs" role="tablist">
						<div >
						    <form action="SerchNHServlet">
						      <input type="text" placeholder="Nhập thành phố.." name="search" id="search" style="width: 300px">
						      <button type="submit"><i class="fa fa-search"></i></button>
						    </form>
						  </div>
					</ul>
				</div>
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="testi">
						<div class="col-md-12 agileinfo-tab-content1">
							<div class="menu-text-right1">
							<% 
								ArrayList<NhaHang> list = (ArrayList<NhaHang>) request.getAttribute("listNhaHang");
								
							%> 
								<div class="menu-title">
									<div class="col-md-12 col-sm-12 col-xs-12 test" >
									<%for(NhaHang nh: list) { %> 
										<div class="col-lg-3 col-md-3" >
											<div class="linkNH" style="padding: 11px">
												<img src="uploads/<%=nh.getHinhanh() %>" alt="Image" style="max-width:100%; height: 150px">
												<div class="linkName" style="padding-bottom: 10px">
												<% String id = Integer.toString(nh.getId()); %>
												<h4><a href="/MenuServlet?IdNH=<%=id %>" ><%=nh.getTenNH()%></a> </h4> 
												</div>
											</div>
										</div>
										<%} %>
									</div>
								</div>
							</div>
						</div><div class="clearfix"></div>
					</div>
					</div>
				</div>
			</div>
		</div>
	  <% }
	else if(member.getRoleId()==2){
		NhaHang info =(NhaHang) request.getAttribute("info");
	%>
	<div class="section w3ls-banner-btm-main" id="about">
		<div class="container">
			<div class="banner-btm">
			 <%if(info.getHinhanh()==null){ %>
				<div class="col-md-6 banner-btm-g1">
					<img src="uploads/about.jpg"  class="img-responsive" alt="" />
				</div>
				<div class="col-md-6 banner-btm-g2">
					<h3 class="title-main">Nhà Hàng: </h3>
					<h4 class="sub-title">Địa Chỉ:</h4>
					<p></p>
					<h4 class="sub-title">Số Điện Thoại: </h4>
				</div>
				<%}else if(info.getHinhanh()!=null){ %> 
				<div class="col-md-6 banner-btm-g1">
					<img src="uploads/<%=info.getHinhanh() %>"  class="img-responsive" alt="" />
				</div>
				<div class="col-md-6 banner-btm-g2">
					<h3 class="title-main">Nhà Hàng: <%=info.getTenNH() %></h3>
					<h4 class="sub-title">Địa Chỉ:</h4>
					<p><%=info.getDiaChi() %></p>
					<h4 class="sub-title">Số Điện Thoại: <%=info.getSdt() %></h4>
				</div>
				<%} %> 
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
				<% 
					ArrayList<BaiDang> list = (ArrayList<BaiDang>) request.getAttribute("ListBD");
				%> 
					<li>
						<div class="l_g">
							<div class="l_g_r">
							<form action="DangBaiServlet" method="post" enctype="multipart/form-data">
								<div class="col-md-12 menu-grids">
									<div class="w3l-menu-text">
										<div>
											<div class="menu-text-left" style="width:auto">
												<img src="images/m1.jpg" alt="" class="img-responsive" />
												
											</div>
											<div class="menu-text-right">
												<h4>Nhà Hàng: <%=info.getTenNH() %></h4>
												<div class="menu-title">
													<textarea style="padding: 20px;" name="gioithieu" rows='1' placeholder='Bạn muốn nói gì?'></textarea>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div>
											<center><img id="blah" src="#" alt="" class="img-responsive" style="width: 50%; height: 50%;"></center>
										</div>
										<hr>
										<div>
											<input type="file" id="imgInp" name="hinh"/><i class="fa fa-picture-o" aria-hidden="true" >&nbsp Ảnh/Video</i>
											<button type="button" class="btn"><i class="fa fa-map-marker" aria-hidden="true">&nbsp Check in</i></button>
											<button type="button" class="btn"><i class="fa fa-video-camera" aria-hidden="true">&nbsp Video trực tiếp</i></button>
											
										</div>
										<hr>
										<div class="text-right">
											<button type="button" class="btn" ><a href="/TrangChuServLet"> Hủy </a></button>
											<button type="submit" class="btn btn-info" name="dangBai"  value="dangbai">Đăng</button>
										</div>
										
									</div>			
								</div>
								</form>
								<div class="clearfix"> </div>
							<%for(int i=0; i<list.size();i++){
								BaiDang bd = list.get(i);
								%>
								<div class="col-md-12 menu-grids">
									<div class="w3l-menu-text">
										<div>
										<div class="menu-text-left" style="width:auto">
											<img src="images/m1.jpg" alt="" class="img-responsive" />
										</div>
										<div class="menu-text-right">
											<h4>Nhà Hàng: <%=info.getTenNH() %></h4>
											<div class="menu-title">
												<%-- <textarea  style="overflow: hidden !important"  rows="1"  value="<%=bd.getThongtin() %>" ></textarea> --%>
												<p><%=bd.getThongtin() %></p>
											</div>
											<div class="clearfix"></div>
											
										</div>
											<div class="clearfix"> </div>
										</div><div class="clearfix"> </div><br>
										<div>
											<center><img alt="" src="uploads/<%=bd.getHinh() %>" class="img-responsive" style="width: 50%;height: 50%;"></center>
													
										</div>	
										<hr>
										<div class="text-right">
											<button type="button" class="btn" ><a href="/XoaBaiDang?id=<%=bd.getId()%>"> Xóa </a></button>
										</div>
									</div>
								</div><br><br>
								<div class="clearfix"> </div>
								<%} %>
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
				<p></p>
				<h5>Saturday – Sunday </h5>
				<p></p>
			</div>
		</div>
	</div>
			
	<%} }%>
	
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
	<% Memb member = (Memb) session.getAttribute("user");
	if(member.getRoleId() == 2) {
	NhaHang info =(NhaHang) request.getAttribute("info");
	%>
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
						<h4>Thành Viên: ></h4>
						<h4></h4>
						 <form action="UpdateInfoServlet" method="post">
						    <div class="form-group">
						      <label for="comment">Giới thiệu về nhà hàng:</label>
						      <%-- <%if(info.getDescribe() == null) { %> --%>
						      <textarea class="form-control" rows="5" id="comment" placeholder="Chưa có thông tin" name="introduction" value=""></textarea>
						     <%--  <% } else { %> --%>
						       <textarea class="form-control" rows="5" id="comment" name="introduction" value=""></textarea>
						     <%--  <% } %> --%>
						      <label for="fname">Thời gian đóng - mở cửa Thứ 2 - Thứ 6</label>
							    <input type="text" id="fname" name="time" placeholder="Thời gian.." value="">
							
							    <label for="lname">Thời gian đóng - mở cửa Thứ 7 - Chủ nhật</label>
							    <input type="text" id="lname" name="time1" placeholder="Thời gian.." value="">
						    </div>
						    <div class="text-center">
								<button type="submit" class="btn" > Cập nhật </button>
							</div><br>
						  </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% } %>
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
	<script >
	function readURL(input) {

		  if (input.files && input.files[0]) {
		    var reader = new FileReader();

		    reader.onload = function(e) {
		      $('#blah').attr('src', e.target.result);
		    }

		    reader.readAsDataURL(input.files[0]);
		  }
		}

		$("#imgInp").change(function() {
		  readURL(this);
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