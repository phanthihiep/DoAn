package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Food;
import model.bean.KhachHang;
import model.bean.NhaHang;

public class KhachHangDAO {
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
	
	public ArrayList<NhaHang> getListNH() {
		connect();
		String sql=	"SELECT * FROM NhaHang ";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<NhaHang> list = new ArrayList<NhaHang>();
		NhaHang nh;
		try {
			while(rs.next()){
				nh = new NhaHang();
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
				list.add(nh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<NhaHang> getListNHSerch(String serchText) {
		connect();
		String sql=	"SELECT * FROM NhaHang ";
		if (serchText.length() > 0) {
			sql += " WHERE Diachi like '%" + serchText + "%'";
		}
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<NhaHang> list = new ArrayList<NhaHang>();
		NhaHang nh;
		try {
			while(rs.next()){
				nh = new NhaHang();
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
				list.add(nh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<KhachHang> getListKH() {
		connect();
		String sql=	"SELECT * FROM KhachHang ";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<KhachHang> list = new ArrayList<KhachHang>();
		KhachHang nh;
		try {
			while(rs.next()){
				nh = new KhachHang();
				nh.setId(rs.getInt(1));
				nh.setIdMB(rs.getInt(2));
				nh.setSdt(rs.getString(3));
				nh.setDiachi(rs.getString(4));
				list.add(nh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public KhachHang getInfoKH(String sdt) {
		KhachHang info = new KhachHang();
		connect();
		String sql = "select * from KhachHang where SDT='" + sdt + "'";
		Statement stm;
		try {
			stm = connection.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				info.setId(rs.getInt(1));
				info.setIdMB(rs.getInt(2));
				info.setSdt(rs.getString(3));
				info.setDiachi(rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return info;
	}
	
	public KhachHang getKHById(int id) {
		KhachHang info = new KhachHang();
		connect();
		String sql = "select * from KhachHang where id='" + id + "'";
		Statement stm;
		try {
			stm = connection.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				info.setId(rs.getInt(1));
				info.setIdMB(rs.getInt(2));
				info.setSdt(rs.getString(3));
				info.setDiachi(rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return info;
	}
	
	public static void main(String args[]){
		KhachHangDAO k = new KhachHangDAO();
		ArrayList<NhaHang> list = k.getListNH();
		for( NhaHang h : list){
			System.out.println(h.getTenNH());
		}
	}
	
}
