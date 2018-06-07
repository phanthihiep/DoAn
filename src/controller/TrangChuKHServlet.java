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
 * Servlet implementation class TrangChuKHServlet
 */
@WebServlet("/TrangChuKHServlet")
public class TrangChuKHServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChuKHServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Memb member = new Memb();
		member = (Memb) session.getAttribute("user");
		String phone = member.getSdt();
		NhaHang info;
		Restaurant res = new Restaurant();
		KhachHangDAO kh = new KhachHangDAO();/*
		KhachHang infoKH = kh.getInfoKH(phone);
		request.setAttribute("infoKH", infoKH);
		ArrayList<NhaHang> list = kh.getListNH();
		request.setAttribute("listNhaHang", list);
		request.getRequestDispatcher("/customer.jsp").forward(request, response);*/
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
				try {
					info = res.getNhaHangById(member.getId());
					request.setAttribute("info", info);
					System.out.println(info.getDiaChi());
					ArrayList<BaiDang>list = res.getListBaiDang(info.getId());
					for(BaiDang n: list){
						System.out.println(n.getHinh());
					}
					request.setAttribute("ListBD", list);
					request.getRequestDispatcher("/customer.jsp").forward(request, response);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
