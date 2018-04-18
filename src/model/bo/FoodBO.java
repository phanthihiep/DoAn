package model.bo;

import java.util.ArrayList;

import model.bean.Food;
import model.dao.FoodDAO;

public class FoodBO {
	FoodDAO pFoodDAO = new FoodDAO();
	public ArrayList<Food> getListFood(){
		return pFoodDAO.getListFood();
	}
}
