package model.dao;

import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.BaiDang;
import model.bean.DatBan;
import model.bean.KhachHang;
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
		String sql=	"SELECT * FROM Members  ";
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
	
	public Memb getMembById(int id) {
		Memb info = new Memb();
		connect();
		String sql = "select * from Members where id='" + id + "'";
		Statement stm;
		try {
			stm = connection.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				info.setId(rs.getInt(1));
				info.setTen(rs.getString(2));
				info.setPass(rs.getString(3));
				info.setSdt(rs.getString(4));
				info.setRoleId(rs.getInt(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return info;
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
	
	public void editNH( int id, String ten, String sdt, String diachi, String email, String gioithieu, String giomo, String giodong, String hinh){
		connect();
		String sql="update NhaHang set TenNH=N'"+ten+"', SDT='"+sdt+"', Diachi='"+diachi+"', Email='"+email+"', Gioithieu='"+gioithieu+"'"
				+ ", TGmo='"+giomo+"', TGdong='"+giodong+"', HinhAnh='"+hinh+"' where id='"+id+"'";
		try {
			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void editKH( int id, int idMB, String sdt, String diachi){
		connect();
		String sql="update KhachHang set IdMB='"+idMB+"', SDT='"+sdt+"', Diachi='"+diachi+"' where id='"+id+"'";
		try {
			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void editMB( int id, String ten,String mk, String sdt){
		connect();
		String sql="update Members set Ten='"+ten+"', Pass='"+mk+"', SDT='"+sdt+"' where id='"+id+"'";
		try {
			Statement stm = connection.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteMember(int id){
		connect();
		String sql = "delete from Members where id='"+id+"'";
		try {
			Statement stm = connection.createStatement();
			stm.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteKH(int id){
		connect();
		String sql = "delete from KhachHang where id='"+id+"'";
		try {
			Statement stm = connection.createStatement();
			stm.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteDatBan(int id){
		connect();
		String sql = "delete from DatBan where id='"+id+"'";
		try {
			Statement stm = connection.createStatement();
			stm.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteBaiDang(int id){
		connect();
		String sql = "delete from BaiDang where id='"+id+"'";
		try {
			Statement stm = connection.createStatement();
			stm.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteNH(int id){
		connect();
		String sql = "delete from NhaHang nh join  where id='"+id+"'";
		try {
			Statement stm = connection.createStatement();
			stm.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<BaiDang> getListBaiDang() {
		connect();
		String sql=	"Select bd.id, bd.IdNH, ThongTin, Hinh from NhaHang nh join BaiDang bd on nh.id=bd.IdNH ";
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
				bd.setThongtin(rs.getString(3));
				list.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<DatBan> getListDatBan() {
		connect();
		String sql=	"SELECT * FROM DatBan ";
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
				sanPham.setSonguoi(rs.getInt(5));
				sanPham.setTgian(rs.getString(6));
				sanPham.setSdt(rs.getString(7));
				list.add(sanPham);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public DatBan getInfoDB(int id) throws ClassNotFoundException, SQLException {
		DatBan role = new DatBan();
		connect();
		String sql = "Select * from DatBan where id = '" + id + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			role.setId(rs.getInt("id"));
			role.setIdNH(rs.getInt("IdNH"));
			role.setTen(rs.getString("Ten"));
			role.setSdt(rs.getString("SDT"));
			role.setEmail(rs.getString("Email"));
			
		}
		return role;
	}
	
	public BaiDang getBD(int id) throws ClassNotFoundException, SQLException {
		BaiDang role = new BaiDang();
		connect();
		String sql = "Select * from BaiDang where id = '" + id + "'";
		Statement stt = connection.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		while (rs.next()) {
			role.setId(rs.getInt("id"));
			role.setIdNH(rs.getInt("IdNH"));
			role.setHinh(rs.getString("Hinh"));
			role.setThongtin(rs.getString("Thongtin"));
			
		}
		return role;
	}
	
	public static void main(String args[]) throws SQLException{
		Admin re = new Admin();
	/*	re.deleteMember(20);*/
	}
	
}
