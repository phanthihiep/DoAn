package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.DatBan;
import model.bean.NhaHang;
import model.dao.FoodDAO;
import model.dao.Restaurant;

/**
 * Servlet implementation class DSDatBanServlet
 */
@WebServlet("/DSDatBanServlet")
public class DSDatBanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DSDatBanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String idNH= request.getParameter("IdNH");
		int id = Integer.parseInt(idNH);
		Restaurant res = new Restaurant();
		NhaHang nh = new NhaHang();
		try {
			nh= res.getNhaHangById(id);
			request.setAttribute("nhahang", nh);
			ArrayList<DatBan> list = res.getListDatBan(id);
			request.setAttribute("List", list);
			request.getRequestDispatcher("/datban.jsp").forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
