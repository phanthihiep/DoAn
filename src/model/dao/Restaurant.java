package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.bean.InformationRestaurant;
import model.bean.KhachHang;
import model.bean.Memb;
import model.bean.NhaHang;

public class Restaurant {
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
	
	public void themNH(int idMB) {
		connect();
		String sql = "insert into NhaHang (IdMB) "
				+ "values( '" + idMB
				+ "')";
		try {
			
			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void themKH(int idMB) {
		connect();
		String sql = "insert into KhachHang (IdMB) "
				+ "values( '" + idMB
				+ "')";
		try {
			
			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public NhaHang getInfo(String sdt) {
		NhaHang info = new NhaHang();
		connect();
		String sql = "select * from NhaHang where SDT='" + sdt + "'";
		Statement stm;
		try {
			stm = connection.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				info.setId(rs.getInt(1));
				info.setIdMB(rs.getInt(2));
				info.setTenNH(rs.getString(3));
				info.setSdt(rs.getString(4));
				info.setDiaChi(rs.getString(5));
				info.setEmail(rs.getString(6));
				info.setGioiThieu(rs.getString(7));
				info.setTgmo(rs.getString(8));
				info.setRgdong(rs.getString(9));
				info.setHinhanh(rs.getString(10));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return info;
	}
	
	public NhaHang getNhaHangByIdMB(int IdMB) throws ClassNotFoundException, SQLException {
		NhaHang nh = new NhaHang();
		// Lay connection
		connect();
		// Cau lenh sql kiem tra ten dang nhap va mat khau
		String sql = "Select * from NhaHang where IdMB = '" + IdMB + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			nh.setId(rs.getInt(1));
			nh.setIdMB(rs.getInt(2));
			nh.setTenNH(rs.getString(3));
			nh.setSdt(rs.getString(4));
			nh.setDiaChi(rs.getString(5));
			nh.setEmail(rs.getString(6));
			nh.setGioiThieu(rs.getString(7));
			nh.setTgmo(rs.getString(8));
			nh.setRgdong(rs.getString(9));
			nh.setHinhanh(rs.getString(10));
		}

		return nh;
	}
	
	public NhaHang getNhaHangById(int Id) throws ClassNotFoundException, SQLException {
		NhaHang nh = new NhaHang();
		// Lay connection
		connect();
		// Cau lenh sql kiem tra ten dang nhap va mat khau
		String sql = "Select * from NhaHang where id = '" + Id + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			nh.setId(rs.getInt(1));
			nh.setIdMB(rs.getInt(2));
			nh.setTenNH(rs.getString(3));
			nh.setSdt(rs.getString(4));
			nh.setDiaChi(rs.getString(5));
			nh.setEmail(rs.getString(6));
			nh.setGioiThieu(rs.getString(7));
			nh.setTgmo(rs.getString(8));
			nh.setRgdong(rs.getString(9));
			nh.setHinhanh(rs.getString(10));
		}

		return nh;
	}
}
