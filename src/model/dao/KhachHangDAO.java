package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Food;
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
	
}
