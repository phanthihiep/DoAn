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
 * Servlet implementation class AdminSuaNHServlet
 */
@WebServlet("/AdminSuaNHServlet")
public class AdminSuaNHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSuaNHServlet() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		Admin ad = new Admin();
		if("submit".equals(request.getParameter("submit"))){
			String ten = request.getParameter("ten");
			String diachi = request.getParameter("diachi");
			String email = request.getParameter("email");
			String sdt = request.getParameter("sdt");
			String gioithieu = request.getParameter("gioithieu");
			String gmo = request.getParameter("gmo");
			String gdong = request.getParameter("gdong");
			String hinh = request.getParameter("hinh");
			ad.editNH(id, ten, sdt, diachi, email, gioithieu, gmo, gdong, hinh);
			response.sendRedirect("/AdminDSNhaHang");
			
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("adminSuaNH.jsp");
			rd.forward(request, response);
		}
	}

}
