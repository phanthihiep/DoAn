package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.Admin;

/**
 * Servlet implementation class AdminSuaKH
 */
@WebServlet("/AdminSuaKH")
public class AdminSuaKH extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSuaKH() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		int idMB = Integer.parseInt(request.getParameter("idmb"));
		Admin ad = new Admin();
		if("submit".equals(request.getParameter("submit"))){
			String diachi = request.getParameter("diachi");
			String sdt = request.getParameter("sdt");
			ad.editKH(id, idMB, sdt, diachi);
			response.sendRedirect("/AdminDSKhachHang");
			
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("adminSuaKH.jsp");
			rd.forward(request, response);
		}
	}

}
