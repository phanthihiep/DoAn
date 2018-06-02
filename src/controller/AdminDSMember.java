package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Memb;
import model.bean.NhaHang;
import model.dao.Admin;

/**
 * Servlet implementation class AdminDSMember
 */
@WebServlet("/AdminDSMember")
public class AdminDSMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDSMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ADMIN DS MEMBER IS CALLED");
		Admin ad = new Admin();
		ArrayList<Memb> list = ad.getListMember();
		for(Memb n: list){
			System.out.println(n.getTen());
		}
		request.setAttribute("ListMember", list);
		request.getRequestDispatcher("/adminIndex.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
