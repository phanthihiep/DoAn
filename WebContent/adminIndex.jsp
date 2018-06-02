<%@page import="common.StringProcess"%>
<%@page import="model.dao.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Memb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Augment Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="admin/css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="admin/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<link href='admin//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" href="admin/css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->
<script src="admin/js/jquery-1.10.2.min.js"></script>
<script src="admin/js/amcharts.js"></script>	
<script src="admin/js/serial.js"></script>	
<script src="admin/js/light.js"></script>	
<script src="admin/js/radar.js"></script>	
<link href="admin/css/barChart.css" rel='stylesheet' type='text/css' />
<link href="admin/css/fabochart.css" rel='stylesheet' type='text/css' />
<!--clock init-->
<script src="admin/js/css3clock.js"></script>
<!--Easy Pie Chart-->
<!--skycons-icons-->
<script src="admin/js/skycons.js"></script>

<script src="admin/js/jquery.easydropdown.js"></script>

<!--//skycons-icons-->
</head>
<body>
<% Memb member = (Memb) session.getAttribute("user"); %>
	<div class="page-container">
		<div class="left-content">
	   		<div class="inner-content">
	   			<div class="header-section">
						<!--menu-right-->
						<div class="top_menu">
					        <div class="main-search">
								<form>
								   <input type="text" value="Search" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}" class="text"/>
									<input type="submit" value="">
								</form>
								<div class="close"><img src="images/cross.png" /></div>
							</div>
									<div class="srch"><button></button></div>
									<script type="text/javascript">
										 $('.main-search').hide();
										$('button').click(function (){
											$('.main-search').show();
											$('.main-search text').focus();
										}
										);
										$('.close').click(function(){
											$('.main-search').hide();
										});
									</script>
							<!--/profile_details-->
								<div class="profile_details_left">
									<ul class="nofitications-dropdown">
										<li class="dropdown note dra-down">
										   <div id="dd" class="wrapper-dropdown-3" tabindex="1">
												<span>Italy</span>
											</div>					
										 </li>
									     <li class="dropdown note">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-envelope-o"></i></a>

										 </li>
							<li class="dropdown note">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-bell-o"></i></a>
								<ul class="dropdown-menu two">	
								</ul>
							</li>
							</div>
							<div class="clearfix"></div>	
						</div>
					<div class="clearfix"></div>
				</div>
				<!-- --------------------------------- -->
				<div class="outter-wp">
					<center><h2>Danh sách các thành viên</h2></center>
					<div class="col-lg-2 pull-right">
		                <a class="btn btn-primary" href="/AdminAddMemberServlet" role="button">Thêm mới</a>
		            </div>
					<form >
						  <table class="table table-striped">
					            <thead>
					            <tr>
					                <th>Mã ID</th>
					                <th>Họ và tên</th>
					                <th>Mật khẩu</th>
					                <th>Số điện thoại</th>
					                <th>Đối tượng</th>
					                
					                <th></th>
					            </tr>
					            </thead>
					            <tbody>
					             <%
					            	ArrayList<Memb> list = (ArrayList<Memb>)request.getAttribute("ListMember");
					            	for(Memb mb:list){
					            %>
					            <tr>
					                <th scope="row" style="color: black;"><%=mb.getId() %></th>
					                <td style="color: black;"><%=mb.getTen() %></td>
					                <td style="color: black;"><%=mb.getPass() %></td>
					                <td style="color: black;"><%=mb.getSdt() %></td>
					                <td style="color: black;"><%=StringProcess.doiTuong(Integer.toString(mb.getRoleId())) %></td>
					                <td>
					                    <a href="#"><span class="glyphicon glyphicon-edit"></span></a>
					                    <a href="#" style="margin-left: 30px;"><span class="glyphicon glyphicon-trash"></span></a>
					                </td>
					            </tr>
					            <%} %>
					            </tbody> 
					        </table>
					</form>
				</div>
				<!-- --------------------------------------- -->
				
					<footer>
					   <p>&copy 2018 Restaurant . Website quản lý nhà hàng | Admin<a href="https://w3layouts.com/" target="_blank">Studients.</a></p>
					</footer>
	   		</div>
	   	</div>
	   	
	   	<!-- ---------------------------------------------------------------- -->
	   <div class="clearfix"></div>	
	</div>
<!-- 	------------------------------ -->
	<div class="sidebar-menu">
		<header class="logo">
			<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="index.html"> <span id="logo"> <h1>Restaurant</h1></span> 
			</a> 
		</header>
		<div style="border-top:1px solid rgba(69, 74, 84, 0.7)"></div>
		<div class="down">	
		    <a href="index.html"><img src="admin/images/admin.jpg"></a>
		    <a href="index.html"><span class=" name-caret">Admin</span></a>
		    <p>Hệ thống quản lý website</p>
			<ul>
				<li><a class="tooltips" href="#"><span>Profile</span><i class="lnr lnr-user"></i></a></li>
				<li><a class="tooltips" href="#"><span>Settings</span><i class="lnr lnr-cog"></i></a></li>
				<li><a class="tooltips" href="/LogoutServlet"><span>Log out</span><i class="lnr lnr-power-switch"></i></a></li>
			</ul>
		</div>
		<div class="menu">
			<ul id="menu" >
				<li><a href="index.html"><i class="fa fa-tachometer"></i> <span>Thành viên</span></a></li>
				<li id="menu-academico" ><a href="#"><i class="fa fa-table"></i> <span> Nhà hàng</span> <span class="fa fa-angle-right" style="float: right"></span></a>
				   <ul id="menu-academico-sub" >
						<li id="menu-academico-avaliacoes" ><a href="/AdminDSNhaHang"> Danh sách</a></li>
						<li id="menu-academico-boletim" ><a href="widget.html">Bài đăng</a></li>
						<li id="menu-academico-avaliacoes" ><a href="calender.html">Menu</a></li>
			 		</ul>
				</li>
				 <li id="menu-academico" ><a href="#"><i class="fa fa-file-text-o"></i> <span>Khách hàng</span> <span class="fa fa-angle-right" style="float: right"></span></a>
					 <ul id="menu-academico-sub" >
						<li id="menu-academico-avaliacoes" ><a href="/AdminDSKhachHang">Danh sách</a></li>
						<li id="menu-academico-boletim" ><a href="validation.html">Validation Forms</a></li>
					  </ul>
				 </li>
				<li><a href="/AdDSdatbanServlet"><i class="lnr lnr-pencil"></i> <span>Đặt bàn</span></a></li>
		        <li id="menu-academico" ><a href="#"><i class="lnr lnr-layers"></i> <span>Components</span> <span class="fa fa-angle-right" style="float: right"></span></a>
					 <ul id="menu-academico-sub" >
						<li id="menu-academico-avaliacoes" ><a href="grids.html">Grids</a></li>
						<li id="menu-academico-boletim" ><a href="media.html">Media Objects</a></li>
	
					  </ul>
				 </li>
			  </ul>
			</div>
		</div>
	<script>
		var toggle = true;
					
		$(".sidebar-icon").click(function() {                
		  if (toggle)
		  {
			$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
			$("#menu span").css({"position":"absolute"});
		  }
		  else
		  {
			$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
			setTimeout(function() {
			  $("#menu span").css({"position":"relative"});
			}, 400);
		  }
						
						toggle = !toggle;
					});
		</script>
<!--js -->
	<link rel="stylesheet" href="admin/css/vroom.css">
	<script type="text/javascript" src="admin/js/vroom.js"></script>
	<script type="text/javascript" src="admin/js/TweenLite.min.js"></script>
	<script type="text/javascript" src="admin/js/CSSPlugin.min.js"></script>
	<script src="admin/js/jquery.nicescroll.js"></script>
	<script src="admin/js/scripts.js"></script>
	   <script src="admin/js/bootstrap.min.js"></script>
	
</body>
</html>