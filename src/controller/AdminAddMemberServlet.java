package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Memb;
import model.bean.Role;
import model.dao.LoginDAO;
import model.dao.Restaurant;

/**
 * Servlet implementation class AdminAddMemberServlet
 */
@WebServlet("/AdminAddMemberServlet")
public class AdminAddMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddMemberServlet() {
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
		HttpSession session = request.getSession();
		Memb member = new Memb();
		member = (Memb) session.getAttribute("user");
		String roleId = request.getParameter("role");
		String name = request.getParameter("ten");
		String pass = request.getParameter("matkhau");
		String phone = request.getParameter("sdt");
		LoginDAO loginDao = new LoginDAO();
		Role role;
		try {
			if("submit".equals(request.getParameter("submit"))){
				role = loginDao.getRole(roleId);
				Memb memberRegister= new Memb();
				memberRegister.setTen(name);
				memberRegister.setPass(pass);
				memberRegister.setSdt(phone);
				memberRegister.setRoleId(role.getId()); 
				loginDao.addMember(memberRegister);
				if(role.getId()==1){
					Memb memberInData = loginDao.getMemberWithPhone(memberRegister);
					memberRegister.setId(memberInData.getId());
					Restaurant ress= new Restaurant();
					ress.themKH(memberRegister.getId());
				}
				if(role.getId()==1){
					Memb memberInData = loginDao.getMemberWithPhone(memberRegister);
					memberRegister.setId(memberInData.getId());
					Restaurant ress= new Restaurant();
					ress.themNH(memberRegister.getId());
				}
				request.getRequestDispatcher("/adminIndext.jsp").forward(request, response);;
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("adminAddMember.jsp");
				rd.forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
