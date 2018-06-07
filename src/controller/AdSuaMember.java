package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Memb;
import model.dao.Admin;

/**
 * Servlet implementation class AdSuaMember
 */
@WebServlet("/AdSuaMember")
public class AdSuaMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdSuaMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			String mk = request.getParameter("mk");
			String sdt = request.getParameter("sdt");
			ad.editMB(id, ten, mk, sdt);
			ArrayList<Memb> list = ad.getListMember();
			request.setAttribute("ListMember", list);
			request.getRequestDispatcher("/adminIndex.jsp").forward(request, response);
			
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("adSuaMember.jsp");
			rd.forward(request, response);
		}
	}

}
