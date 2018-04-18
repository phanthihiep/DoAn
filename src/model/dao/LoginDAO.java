package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.bean.Member;

public class LoginDAO {
	String url = "jdbc:sqlserver://localhost:1433;databaseName=restaurant";
	String userName = "chien";
	String password = "123456";
	Connection connection;
	
	void connect(){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public boolean checkLogin(String nameLogin, String password) throws SQLException {
		connect();
		String sql = "select * from Members where MaTV ='"+nameLogin+"' and Password='"+password+"' ";
		Statement stm = connection.createStatement();
		ResultSet sr = stm.executeQuery(sql);
		if(sr.next()){
			System.out.println("ok");
			return true;
		} else {
			System.out.println("no");
			return false;
		}
	}
	
	public Member getNameRestaurant(String name) throws ClassNotFoundException, SQLException {
		Member member = new Member();
		// Lay connection
		connect();
		// Cau lenh sql kiem tra ten dang nhap va mat khau
		String sql = "Select * from Members where MaTV = '" + name +"'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while(rs.next()){
			member.setMaTV(rs.getString("MaTV"));
			member.setPassword(rs.getString("Password"));
		}
		return member;
	}
	
}
