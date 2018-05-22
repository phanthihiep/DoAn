package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.InformationRestaurant;
import model.bean.Memb;
import model.bean.Member;
import model.bean.Role;

public class LoginDAO {
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

	public boolean checkLogin(String phone, String password) throws SQLException {
		connect();
		String sql = "select * from Members where SDT ='" + phone + "' and Pass='" + password + "' ";
		Statement stm = connection.createStatement();
		ResultSet sr = stm.executeQuery(sql);
		if (sr.next()) {
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
		String sql = "Select * from Members where Phone = '" + name + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			member.setMaTV(rs.getInt("MaTV"));
			member.setPhone(rs.getString("Phone"));
			member.setNameMember(rs.getString("NameRestaurant"));
			member.setPassword(rs.getString("Password"));
			member.setRoleId(rs.getInt("roleId"));
		}
		return member;
	}
	
	public Memb getMemberByPhone(String phone) throws ClassNotFoundException, SQLException {
		Memb member = new Memb();
		// Lay connection
		connect();
		// Cau lenh sql kiem tra ten dang nhap va mat khau
		String sql = "Select * from Members where SDT = '" + phone + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			member.setId(rs.getInt(1));
			member.setTen(rs.getString(2));
			member.setPass(rs.getString(3));
			member.setSdt(rs.getString(4));
			member.setRoleId(rs.getInt(5));
		}

		return member;
	}

	public static void main(String args[]) throws ClassNotFoundException, SQLException {
		LoginDAO s = new LoginDAO();
		s.checkLogin("01294000118", "123");
		
	}

	public Role getRole(String roleId) throws ClassNotFoundException, SQLException {
		Role role = new Role();
		// Lay connection
		connect();
		// Cau lenh sql kiem tra ten dang nhap va mat khau
		String sql = "Select * from Role where id = '" + roleId + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			role.setId(rs.getInt("id"));
			role.setRoleName(rs.getString("NameRole"));
		}
		return role;
	}

	public void updateInfo(String describe, String timeWeek, String timeWeeken) {
		connect();
		String sql = "update InfoRestaurant set Describe=N'" + describe + "', TimeOpenInWeek='" + timeWeek
				+ "', TimeOpenWeekend='" + timeWeeken + "'";
		try {
			Statement stm = connection.createStatement();
			stm.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Memb getMemberWithPhone(Memb member) throws SQLException {
		connect();
		Memb memb = new Memb();
		String sql =  "select * from members where sdt = '"+ member.getSdt()+"'";
		Statement stm;
		stm = connection.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {
			memb.setId(rs.getInt("id"));
		}
		return memb;
	}
	
	public void addMember(Memb memberRegister) {
		connect();
		String sql = "insert into Members (Ten,Pass,SDT,roleId) values('" + memberRegister.getTen()
				+ "'" + ",'"
				+ memberRegister.getPass() + "','" + memberRegister.getSdt() + "','" + memberRegister.getRoleId()
				+ "')";
		Statement stm;
		try {
			stm = connection.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Member> getArrayListMember() {
		connect();
		String sql = "Select * from Members";
		ResultSet rs = null;
		try {
			Statement stt = connection.createStatement();
			rs = stt.executeQuery(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Member> members = new ArrayList<>();
		Member mb = new Member();
		try {
			while (rs.next()) {
				mb.setMaTV(rs.getInt(1));
				mb.setNameMember(rs.getString(2));
				mb.setPassword(rs.getString(3));
				mb.setAddress(rs.getString(4));
				mb.setPhone(rs.getString(5));
				mb.setEmail(rs.getString(6));
				mb.setRoleId(rs.getInt(7));
				mb.setNameLogin(rs.getString(8));
				members.add(mb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return members;
	}

	public Member getRoleID(int roleID) throws ClassNotFoundException, SQLException {
		Member member = new Member();
		// Lay connection
		connect();
		// Cau lenh sql kiem tra ten dang nhap va mat khau
		String sql = "Select * from Members where roleId = '" + roleID + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			member.setMaTV(rs.getInt("MaTV"));
			member.setPassword(rs.getString("Password"));
		}
		return member;
	}

}
