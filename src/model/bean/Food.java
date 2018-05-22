package model.bean;

public class Food {
	private int id;
	private String nameFood;
	private String price;
	private String picture;
	private int idNH;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdNH() {
		return idNH;
	}
	public void setIdNH(int idNH) {
		this.idNH = idNH;
	}
	public String getNameFood() {
		return nameFood;
	}
	public void setNameFood(String nameFood) {
		this.nameFood = nameFood;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	

}
