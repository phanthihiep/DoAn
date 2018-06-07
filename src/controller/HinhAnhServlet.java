package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.BaiDang;
import model.bean.NhaHang;
import model.dao.Restaurant;

/**
 * Servlet implementation class HinhAnhServlet
 */
@WebServlet("/HinhAnhServlet")
public class HinhAnhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HinhAnhServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idNH = Integer.parseInt(request.getParameter("IdNH"));
		Restaurant re = new Restaurant();
		NhaHang infoNH;
		try {
			infoNH = re.getNhaHangById(idNH);
			request.setAttribute("infoNH", infoNH);
			ArrayList<BaiDang>list = re.getListBaiDang(idNH);
			request.setAttribute("ListBD", list);
			request.getRequestDispatcher("/hinhAnh.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
