
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Add Menu</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
			<div class="container">
				<br><br>
    			<h3>Thêm món mới vào menu</h3>
			    <br>
			    <form action="AddMenuServlet" method="post">
			       
			        <div class="row form-group">
			            <label class="col-lg-2">Tên Món Ăn:</label>
			            <div class="col-lg-4">
			                <input type="text" class="form-control" name="ten" required/>
			            </div>
			        </div>
			        <div class="row form-group">
			            <label class="col-lg-2">Giá:</label>
			            <div class="col-lg-4">
			                <input type="text" class="form-control" name="gia" required/>
			            </div>
			        </div>
			        <div class="row form-group">
			            <label class="col-lg-2">Hình Ảnh:</label>
			            <div class="col-lg-4">
			                <input type="file" class="form-control" name="hinhanh" required/>
			            </div>
			        </div>
			      
			        <div class="row form-group">
			            <div class="col-lg-4 col-lg-offset-3">
			                <button class="btn btn-primary" type="submit" value="submit" name="submit">Thêm mới</button>
			                <input class="btn btn-primary" type="button" value="Quay lại" onclick="history.go(-1);" />
			            </div>
			        </div>
			    </form>
			    <br>
			</div>
</body>
</html>