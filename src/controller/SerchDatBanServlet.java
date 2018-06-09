package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DatBan;
import model.bean.KhachHang;
import model.bean.Memb;
import model.bean.NhaHang;
import model.dao.KhachHangDAO;
import model.dao.Restaurant;

/**
 * Servlet implementation class SerchDatBanServlet
 */
@WebServlet("/SerchDatBanServlet")
public class SerchDatBanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SerchDatBanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Memb member = new Memb();
		member = (Memb) session.getAttribute("user");
		Restaurant re = new Restaurant();
		ArrayList<DatBan> list = re.listDatBanSerch(request.getParameter("search"));
		NhaHang nh;
		try {
			nh= re.getNhaHangByIdMB(member.getId());
			request.setAttribute("nhahang", nh);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
