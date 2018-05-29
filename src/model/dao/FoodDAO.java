package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Food;
import model.bean.NhaHang;

public class FoodDAO {
		String url = "jdbc:sqlserver://localhost:1433;databaseName=DA";
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
		
		public ArrayList<Food> getListFood(int IdNH) {
			connect();
			String sql=	"SELECT * FROM MonAn where IdNH='"+IdNH+"' ";
			ResultSet rs = null;
			try {
				Statement stmt = connection.createStatement();
				rs = stmt.executeQuery(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			ArrayList<Food> list = new ArrayList<Food>();
			Food sanPham;
			try {
				while(rs.next()){
					sanPham = new Food();
					sanPham.setId(rs.getShort(1));
					sanPham.setIdNH(rs.getInt(2));
					sanPham.setNameFood(rs.getString(3));
					sanPham.setPrice(rs.getString(4));
					sanPham.setPicture(rs.getString(5));
					list.add(sanPham);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public Food getFoodById(int Id) throws ClassNotFoundException, SQLException {
			Food f = new Food();
			connect();
			String sql = "Select * from MonAn where id = '" + Id + "'";
			Statement stt = connection.createStatement();
			ResultSet rs = stt.executeQuery(sql);
			while (rs.next()) {
				f.setId(rs.getInt(1));
				f.setIdNH(rs.getInt(2));
				f.setNameFood(rs.getString(3));
				f.setPrice(rs.getString(4));
				f.setPicture(rs.getString(5));
			}
			return f;
		}
		
		public void deleteFood(int id){
			connect();
			String sql = "delete from MonAn where id='"+id+"'";
			try {
				Statement stm = connection.createStatement();
				stm.executeQuery(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		public void editFood( int id, String nameFood, String price, String picture){
			connect();
			String sql="update MonAn set TenMonAn=N'"+nameFood+"', Gia='"+price+"', Hinh='"+picture+"' where id='"+id+"'";
			try {
				Statement stm = connection.createStatement();
				stm.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		public void addFood(Food food){
			connect();
			String sql ="insert into MonAn values('"+food.getIdNH()+"', '"+food.getNameFood()+"',"
					+ " '"+food.getPrice()+"', '"+food.getPicture()+"') ";
			try {
				Statement stm = connection.createStatement();
				stm.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
}
