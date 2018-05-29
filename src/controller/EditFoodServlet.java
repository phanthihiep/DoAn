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
import model.dao.FoodDAO;

/**
 * Servlet implementation class EditFoodServlet
 */
@WebServlet("/EditFoodServlet")
public class EditFoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditFoodServlet() {
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
		FoodDAO foodDAO = new FoodDAO();
		String idNH = request.getParameter("idNH");
		int idnh = Integer.parseInt(idNH);
		String idMonAn = request.getParameter("id");
		int id = Integer.parseInt(idMonAn);
		if("submit".equals(request.getParameter("submit"))){
			String ten = request.getParameter("ten");
			String gia = request.getParameter("gia");
			String hinh = request.getParameter("hinhanh");
			foodDAO.editFood(id, ten, gia, hinh);
			response.sendRedirect("/MenuServlet?IdNH="+idnh);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("editFood.jsp");
			rd.forward(request, response);
		}
	}

}
