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
 * Servlet implementation class ThongTinNHServlet
 */
@WebServlet("/ThongTinNHServlet")
public class ThongTinNHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThongTinNHServlet() {
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
		int idnh = Integer.parseInt(request.getParameter("id"));
		Admin ad = new Admin();
			String ten = request.getParameter("name");
			String sdt = request.getParameter("sdt");
			String diachi = request.getParameter("diachi");
			String email = request.getParameter("email");
			String hinh = request.getParameter("hinh");
			String tgmo = request.getParameter("tgmo");
			String tgdong = request.getParameter("tgdong");
			String gioithieu = request.getParameter("gioithieu");
			ad.editNH(idnh, ten, sdt, diachi, email, gioithieu, tgmo, tgdong, hinh);
			response.sendRedirect("IdNHServlet?IdNH="+idnh);
		
	}

}
