package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Memb;
import model.bean.NhaHang;
import model.dao.Restaurant;

/**
 * Servlet implementation class XoaBaiDang
 */
@WebServlet("/XoaBaiDang")
public class XoaBaiDang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaBaiDang() {
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
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Memb member = new Memb();
		member = (Memb) session.getAttribute("user");
		Restaurant re = new Restaurant();
		NhaHang nh;
		try {
			nh = re.getNhaHangByIdMB(member.getId());
			int id = Integer.parseInt(request.getParameter("id"));
			re.deleteBaiDang(id);
			response.sendRedirect("/TrangChuServLet");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
