
<%@page import="model.bean.Food"%>
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
<body>
<%
	NhaHang nhaHang = (NhaHang)request.getAttribute("nhahang");
	Food food =(Food) request.getAttribute("food");
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
							<li class="scroll hvr-underline-from-center"><a
								href="customer.jsp">Trang chủ</a></li>
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
	</div>	
		<div class="section w3ls-banner-btm-main" id="about">
		<div class="container">
			<div class="banner-btm">
				<!-- <div class="col-md-6 banner-btm-g1">
					<img src="images/about.jpg" class="img-responsive" alt="" />
				</div> -->
				<div class="col-md-6 banner-btm-g2">
					<center><h3 class="title-main">Sửa Thông Tin Món Ăn Trong Menu </h3></center>
					
					<form action="EditFoodServlet" method="post">
					<h4 class="sub-title">Mã Nhà Hàng:<%=food.getIdNH()%> </h4>
					<h4 class="sub-title">Mã Món Ăn: <input type="text" name="id" value="<%=food.getId()%>" readonly/> </h4> 
				        <div class="row form-group">
				            <label class="col-lg-3" style="color: white;">Tên Món Ăn :</label>
				            <div class="col-lg-4">
				                <input type="text" class="form-control" name="ten" value="<%=food.getNameFood()%>" required/>
				            </div>
				        </div>
				        <div class="row form-group">
				            <label class="col-lg-3" style="color: white;">Giá:</label>
				            <div class="col-lg-4">
				                <input type="text" class="form-control" name="gia" value="<%=food.getPrice()%>" required/>
				            </div>
				        </div>
				        <div class="row form-group">
				            <label class="col-lg-3" style="color: white;">Hình Ảnh:</label>
				            <div class="col-lg-4">
				                <input type="file" class="form-control" name="hinhanh" value="<%=food.getPicture()%>" required/>
				            </div>
				        </div>
				      
				        <div class="row form-group">
				            <div class="col-lg-4 col-lg-offset-3">
				                <button class="btn btn-primary" type="submit" value="submit" name="submit">Cập nhật</button>
				                <input class="btn btn-primary" type="button" value="Quay lại" onclick="history.go(-1);" />
				            </div>
				        </div>
				    </form>
				</div>
				<div class="clearfix"></div>
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