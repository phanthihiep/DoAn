package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.KhachHang;
import model.bean.NhaHang;
import model.dao.KhachHangDAO;

/**
 * Servlet implementation class AdminDSNhaHang
 */
@WebServlet("/AdminDSNhaHang")
public class AdminDSNhaHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDSNhaHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KhachHangDAO kh = new KhachHangDAO();
		ArrayList<NhaHang> list = kh.getListNH();
		for(NhaHang n: list){
			System.out.println(n.getTenNH());
		}
		request.setAttribute("ListNH", list);
		request.getRequestDispatcher("/adminNhaHang.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
