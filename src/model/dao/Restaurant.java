package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.BaiDang;
import model.bean.DatBan;
import model.bean.Food;
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
	
	public ArrayList<BaiDang> getListBaiDang(int IdNH) {
		connect();
		String sql = "Select * from BaiDang where IdNH= '" + IdNH + "' order by id desc";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<BaiDang> list = new ArrayList<BaiDang>();
		BaiDang bd;
		try {
			while(rs.next()){
				bd = new BaiDang();
				bd.setId(rs.getInt(1));
				bd.setIdNH(rs.getInt(2));
				bd.setHinh(rs.getString(3));
				bd.setThongtin(rs.getString(4));
				list.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public BaiDang getBaiDangByIdNH(int IdNH) throws ClassNotFoundException, SQLException {
		BaiDang bd = new BaiDang();
		// Lay connection
		connect();
		// Cau lenh sql kiem tra ten dang nhap va mat khau
		String sql = "Select * from BaiDang join NhaHang on BaiDang.IdNH=NhaHang.id join Members"
				+ "on NhaHang.IdMB=Members.id  where NhaHang.IdMB = '" + IdNH + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			bd.setId(rs.getInt(1));
			bd.setIdNH(rs.getInt(2));
			bd.setHinh(rs.getString(3));
			bd.setThongtin(rs.getString(4));
		}

		return bd;
	}
	
	public void dangbai(BaiDang baidang){
		connect();
		String sql ="insert into BaiDang values('"+baidang.getIdNH()+"', '"+baidang.getHinh()+"',"
				+ " '"+baidang.getThongtin()+"') "; 
		System.out.println(sql);
		try {
			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void datBan(DatBan datBan){
		connect();
		String sql ="insert into DatBan values('"+datBan.getIdNH()+"', '"+datBan.getTen()+"',"
				+ " '"+datBan.getNgaydat()+"', '"+datBan.getSonguoi()+"', "
				+ "'"+datBan.getTgian()+"', '"+datBan.getSdt()+"', '"+datBan.getEmail()+"') ";
		try {
			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public DatBan getDatBanByIdNH(int Id) throws ClassNotFoundException, SQLException {
		DatBan nh = new DatBan();
		// Lay connection
		connect();
		// Cau lenh sql kiem tra ten dang nhap va mat khau
		String sql = "Select * from DatBan where IdNH = '" + Id + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			nh.setId(rs.getInt(1));
			nh.setIdNH(rs.getInt(2));
			nh.setTen(rs.getString(3));
			nh.setNgaydat(rs.getString(4));
			nh.setSonguoi(rs.getInt(5));
			nh.setTgian(rs.getString(6));
			nh.setSdt(rs.getString(7));
		}

		return nh;
	}
	
	public ArrayList<DatBan> getListDatBan(int IdNH) {
		connect();
		String sql=	"SELECT * FROM DatBan where IdNH='"+IdNH+"' ";
		System.out.println(sql);
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<DatBan> list = new ArrayList<DatBan>();
		DatBan sanPham;
		try {
			while(rs.next()){
				sanPham = new DatBan();
				sanPham.setId(rs.getInt(1));
				sanPham.setIdNH(rs.getInt(2));
				sanPham.setTen(rs.getString(3));
				sanPham.setNgaydat(rs.getString(4));
				sanPham.setSonguoi(rs.getInt(5));
				sanPham.setTgian(rs.getString(6));
				sanPham.setSdt(rs.getString(7));
				sanPham.setEmail(rs.getString(8));
				list.add(sanPham);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public NhaHang getEmailNH(int id) throws SQLException{
		NhaHang nh = new NhaHang();
		connect();
		String sql = "select * from NhaHang where id='"+id+"'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			nh.setId(rs.getInt(1));
			nh.setEmail(rs.getString(6));
		}
		return nh;
	}
	
	public DatBan getEmaiDatBan(int idNH) throws SQLException{
		DatBan nh = new DatBan();
		connect();
		String sql = "select * from DatBan where IdNH='"+idNH+"'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			nh.setId(rs.getInt(2));
			nh.setEmail(rs.getString(8));
		}
		return nh;
	}
	
	public ArrayList<DatBan> listDatBanSerch(String serchText) {
		connect();
		String sql=	"SELECT * FROM DatBan ";
		if (serchText.length() > 0) {
			sql += " WHERE Ngaydat like '%" + serchText + "%'";
		}
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<DatBan> list = new ArrayList<DatBan>();
		DatBan nh;
		try {
			while(rs.next()){
				nh = new DatBan();
				nh.setId(rs.getInt(1));
				nh.setIdNH(rs.getInt(2));
				nh.setTen(rs.getString(3));
				nh.setNgaydat(rs.getString(4));
				nh.setSonguoi(rs.getInt(5));
				nh.setTgian(rs.getString(6));
				nh.setSdt(rs.getString(7));
				nh.setEmail(rs.getString(8));;
				list.add(nh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void deleteDatBan(int id){
		connect();
		String sql = "delete from DatBan where id='"+id+"'";
		System.out.println(sql);
		try {
			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteBaiDang(int id){
		connect();
		String sql = "delete from BaiDang where id='"+id+"'";
		System.out.println(sql);
		try {
			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void main(String args[]) throws SQLException, ClassNotFoundException{
		Restaurant re = new Restaurant();
		ArrayList<BaiDang> list = re.getListBaiDang(3);
		for( BaiDang h : list){
			System.out.println(h.getHinh());
		}
	}
}
