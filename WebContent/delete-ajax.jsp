<%@page import="model.dao.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.dao.FoodDAO"%>
<%
String id=request.getParameter("id");
int id1 = Integer.parseInt(id);
FoodDAO foodDAO = new FoodDAO();
foodDAO.deleteFood(id1);

%>