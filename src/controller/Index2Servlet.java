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

import model.bean.BaiDang;
import model.bean.KhachHang;
import model.bean.Memb;
import model.bean.NhaHang;
import model.dao.KhachHangDAO;
import model.dao.Restaurant;

/**
 * Servlet implementation class Index2Servlet
 */
@WebServlet("/Index2Servlet")
public class Index2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index2Servlet() {
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
		String phone = member.getSdt();
		KhachHangDAO kh = new KhachHangDAO();
		KhachHang infoKH = kh.getInfoKH(phone);
		request.setAttribute("infoKH", infoKH);
		String idNH= request.getParameter("IdNH");
		int id = Integer.parseInt(idNH);
		Restaurant re = new Restaurant();
		try {
			NhaHang infoNH= re.getNhaHangById(id);
			request.setAttribute("infoNH", infoNH);
			ArrayList<BaiDang>list = re.getListBaiDang(id);
			for(BaiDang b: list){
				System.out.println("1212: "+b.getThongtin());
			}
			request.setAttribute("ListBD", list);
			request.getRequestDispatcher("/index2.jsp").forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
