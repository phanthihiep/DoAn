package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Food;

public class FoodDAO {
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
		
		public ArrayList<Food> getListFood() {
			connect();
			String sql=	"SELECT * FROM Food ";
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
		
		public static void main(String args[]){
			FoodDAO f = new FoodDAO();
			ArrayList<Food> l = f.getListFood();
			for(Food s : l){
				System.out.println(s.getMaTV());
			}
		}
		
}
