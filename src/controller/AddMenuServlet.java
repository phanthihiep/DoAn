package controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.bean.Food;
import model.bean.NhaHang;
import model.dao.FoodDAO;
import model.dao.Restaurant;

/**
 * Servlet implementation class AddMenuServlet
 */
@WebServlet("/AddMenuServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 50, // 50MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "F:/D/app/baitapEclip/Restaurant/WebContent/uploads";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id1= request.getParameter("Id");
		int idnh= Integer.parseInt(id1);
		String tenMonAn= request.getParameter("ten");
		String gia = request.getParameter("gia");
		FoodDAO foodDAO = new FoodDAO();
			if("submit".equals(request.getParameter("submit"))){
				Food food = new Food();
				food.setIdNH(idnh);
				food.setNameFood(tenMonAn);
				food.setPrice(gia);
				String fileName_ = "";
				Part filePart = request.getPart("hinhanh");
				fileName_ = extractFileName(filePart);
				filePart.write(UPLOAD_DIRECTORY + File.separator + fileName_);
				food.setPicture(fileName_);
				foodDAO.addFood(food);
				response.sendRedirect("/MenuServlet?IdNH="+id1);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("addMenu.jsp");
				rd.forward(request, response);
			}
		
	}
	
	 private String extractFileName(Part part) {
		    String contentDisp = part.getHeader("content-disposition");
		    String[] items = contentDisp.split(";");
		    for (String s : items) {
		      if (s.trim().startsWith("filename")) {
		        return s.substring(s.indexOf("=") + 2, s.length() - 1);
		      }
		    }
		    return "";
		  }
	  public File getFolderUpload() {
	    File folderUpload = new File("Uploads/");
	    if (!folderUpload.exists()) {
	      folderUpload.mkdirs();
	    }
	    return folderUpload;
	  }

}
