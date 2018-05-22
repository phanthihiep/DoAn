package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.InformationRestaurant;
import model.bean.Member;
import model.dao.LoginDAO;

/**
 * Servlet implementation class UpdateInfoServlet
 */
@WebServlet("/UpdateInfoServlet")
public class UpdateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String intro = request.getParameter("introduction");
		String timeWeek = request.getParameter("time");
		String timeWeeken = request.getParameter("time1");
		HttpSession session = request.getSession();
		Member memberOld = (Member) session.getAttribute("user");
		LoginDAO loginDAO = new LoginDAO();
		
		loginDAO.updateInfo(intro, timeWeek, timeWeeken);
		
		
		
		request.getRequestDispatcher("/customer.jsp").forward(request, response);
	}

}
