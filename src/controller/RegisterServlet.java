package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Member;
import model.bean.Role;
import model.dao.LoginDAO;

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
		String address = request.getParameter("address");
		String phone = request.getParameter("sdt");
		String email = request.getParameter("email");		
		String matv = request.getParameter("matv");
		System.out.println(roleId);
		LoginDAO loginDao = new LoginDAO();
		try {
			Role role =  loginDao.getRole(roleId);
			Member memberRegister = new Member();
			memberRegister.setMaTV(matv);
			memberRegister.setNameMember(name);
			memberRegister.setAddress(address);
			memberRegister.setPassword(pass);
			memberRegister.setPhone(phone);
			memberRegister.setEmail(email);
			memberRegister.setRoleId(role.getId()); 
			loginDao.addMembers(memberRegister);
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
