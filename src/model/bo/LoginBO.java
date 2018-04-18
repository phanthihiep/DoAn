package model.bo;

import java.sql.SQLException;

import model.bean.Member;
import model.dao.LoginDAO;

public class LoginBO {
	LoginDAO loginDAO = new LoginDAO();
	public boolean checkLogin(String nameLogin, String pass) throws SQLException{
		return loginDAO.checkLogin(nameLogin, pass);
	}
	
	public Member getNameRestaurant(String name) throws ClassNotFoundException, SQLException{
		return loginDAO.getNameRestaurant(name);
	}
}
