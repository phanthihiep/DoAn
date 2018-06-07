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
import model.bean.Food;
import model.bean.InformationRestaurant;
import model.bean.KhachHang;
import model.bean.Memb;
import model.bean.Member;
import model.bean.NhaHang;
import model.bo.FoodBO;
import model.bo.LoginBO;
import model.dao.Admin;
import model.dao.KhachHangDAO;
import model.dao.LoginDAO;
import model.dao.Restaurant;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String phone = request.getParameter("name");
		String pass = request.getParameter("pass");
		LoginBO loginBO = new LoginBO();
		LoginDAO loginDAO = new LoginDAO();
		Restaurant res = new Restaurant();
		KhachHangDAO kh = new KhachHangDAO();
		try {
			if (loginBO.checkLogin(phone, pass)) {
				Memb member = new Memb();
				member = loginDAO.getMemberByPhone(phone); // Phone
				HttpSession session = request.getSession();
				session.setAttribute("user", member);
				NhaHang nh= new NhaHang();
				nh= res.getNhaHangByIdMB(member.getId());
				session.setAttribute("nhahang", nh);
				if (member.getRoleId() == 1) {
					ArrayList<NhaHang> list = kh.getListNH();
					for(NhaHang n: list){
						System.out.println(n.getTenNH());
					}
					request.setAttribute("listNhaHang", list);
					KhachHang infoKH = kh.getInfoKH(phone);
					request.setAttribute("infoKH", infoKH);
					request.getRequestDispatcher("/customer.jsp").forward(request, response);
				}else {
					if (member.getRoleId() == 2) {
						NhaHang info = res.getNhaHangByIdMB(member.getId());
						request.setAttribute("info", info);
						System.out.println(info.getDiaChi());
						ArrayList<BaiDang>list = res.getListBaiDang(nh.getId());
						for(BaiDang n: list){
							System.out.println(n.getHinh());
						}
						request.setAttribute("ListBD", list);
						request.getRequestDispatcher("/customer.jsp").forward(request, response);
					}else if(member.getRoleId() == 3){
						Admin ad = new Admin();
						ArrayList<Memb> list = ad.getListMember();
						request.setAttribute("ListMember", list);
						request.getRequestDispatcher("/adminIndex.jsp").forward(request, response);
					}
				}
			} else {
				String error = "Dang nhap that bai";
				request.setAttribute("error", error);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
