package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Member;
import model.bo.LoginBO;
import model.dao.LoginDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		LoginBO loginBO = new LoginBO();
		//LoginDAO loginDAO = new LoginDAO();
		try {
			if (loginBO.checkLogin(name, pass)) {
				Member member = new Member();
				member = loginBO.getNameRestaurant(name);
				
				HttpSession session = request.getSession();
				session.setAttribute("user", member);
				/*member = loginDAO.getRoleID(roleID);*/
				request.getRequestDispatcher("/customer.jsp").forward(request, response);
			} else {
				String error = "Dang nhap that bai";
				request.setAttribute("error", error);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
