package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.InformationRestaurant;
import model.bean.Memb;
import model.bean.Member;
import model.bean.NhaHang;
import model.bean.Role;
import model.dao.LoginDAO;
import model.dao.Restaurant;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roleId = request.getParameter("role");
		String name = request.getParameter("name1");
		String pass = request.getParameter("pass1");
		String phone = request.getParameter("sdt");
		System.out.println(roleId);
		LoginDAO loginDao = new LoginDAO();
		Role role;
			try {
				role = loginDao.getRole(roleId);
				Memb memberRegister= new Memb();
				memberRegister.setTen(name);
				memberRegister.setPass(pass);
				memberRegister.setSdt(phone);
				memberRegister.setRoleId(role.getId()); 
				loginDao.addMember(memberRegister);
				if (memberRegister.getRoleId() == 2) {
					Memb memberInData = loginDao.getMemberWithPhone(memberRegister);
					memberRegister.setId(memberInData.getId());
					Restaurant ress= new Restaurant();
					ress.themNH(memberRegister.getId());
				}
				
				if (memberRegister.getRoleId() == 1) {
					Memb memberInData = loginDao.getMemberWithPhone(memberRegister);
					memberRegister.setId(memberInData.getId());
					Restaurant ress= new Restaurant();
					ress.themKH(memberRegister.getId());
				}
				
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
				
	}

}
