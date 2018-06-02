package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.CreateEmail;
import model.bean.DatBan;
import model.dao.Restaurant;

/**
 * Servlet implementation class DatBanServlet
 */
@WebServlet("/DatBanServlet")
public class DatBanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatBanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("idNH");
		int idNH = Integer.parseInt(id);
		String ten = request.getParameter("ten");
		String nguoi = request.getParameter("nguoi");
		int sluong = Integer.parseInt(nguoi);
		String tgian = request.getParameter("tgian");
		String sdt = request.getParameter("sdt");
		String email = request.getParameter("mail");
		String ngay = request.getParameter("ngay");
		Restaurant r = new Restaurant();
		CreateEmail.sendEmail(email);
		System.out.println(email);
		
		DatBan da = new DatBan();
		da.setIdNH(idNH);
		da.setTen(ten);
		da.setNgaydat(ngay);
		da.setSonguoi(sluong);
		da.setTgian(tgian);
		da.setSdt(sdt);
		da.setEmail(email);
		r.datBan(da);
		
		response.sendRedirect("/Index2Servlet?IdNH="+idNH);
	}

}
