package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Food;
import model.bean.NhaHang;
import model.dao.FoodDAO;
import model.dao.Restaurant;

/**
 * Servlet implementation class AddMenuServlet
 */
@WebServlet("/AddMenuServlet")
public class AddMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id1= request.getParameter("Id");
		int idnh= Integer.parseInt(id1);
		String tenMonAn= request.getParameter("ten");
		String gia = request.getParameter("gia");
		String hinh = request.getParameter("hinhanh");
		FoodDAO foodDAO = new FoodDAO();
			if("submit".equals(request.getParameter("submit"))){
				Food food = new Food();
				food.setIdNH(idnh);
				food.setNameFood(tenMonAn);
				food.setPrice(gia);
				food.setPicture(hinh);
				foodDAO.addFood(food);
				response.sendRedirect("/MenuServlet?IdNH="+id1);
//				request.getRequestDispatcher("/MenuServlet?IdNH="+id1).forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("addMenu.jsp");
				rd.forward(request, response);
			}
		
	}

}
