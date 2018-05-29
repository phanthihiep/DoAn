package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.DatBan;
import model.bean.Memb;
import model.bean.Role;

public class Admin {
	String url = "jdbc:sqlserver://localhost:1433;databaseName=DA";
	String userName = "chien";
	String password = "123456";
	Connection connection;

	void connect() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Memb> getListMember() {
		connect();
		String sql=	"SELECT * FROM Member  ";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<Memb> list = new ArrayList<Memb>();
		Memb sanPham;
		try {
			while(rs.next()){
				sanPham = new Memb();
				sanPham.setId(rs.getInt(1));
				sanPham.setTen(rs.getString(2));
				sanPham.setPass(rs.getString(3));
				sanPham.setSdt(rs.getString(4));
				sanPham.setRoleId(rs.getInt(5));
				list.add(sanPham);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Role getNameRole(int roleId) throws ClassNotFoundException, SQLException {
		Role role = new Role();
		connect();
		String sql = "Select * from Role where NameRole = '" + roleId + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			role.setId(rs.getInt("id"));
			role.setRoleName(rs.getString("NameRole"));
		}
		return role;
	}
}
