package controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.bean.BaiDang;
import model.bean.KhachHang;
import model.bean.Memb;
import model.bean.NhaHang;
import model.dao.KhachHangDAO;
import model.dao.Restaurant;

/**
 * Servlet implementation class DangBaiServlet
 */
@WebServlet("/DangBaiServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 50, // 50MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class DangBaiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "F:/D/app/baitapEclip/Restaurant/WebContent/uploads";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangBaiServlet() {
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
		if("dangbai".equals(request.getParameter("dangBai"))){
			HttpSession session = request.getSession();
			Memb member = new Memb();
			member = (Memb) session.getAttribute("user");
			NhaHang info;
			NhaHang nhahang = new NhaHang();
			Restaurant re = new Restaurant();
			try {
				info = re.getNhaHangByIdMB(member.getId());
				request.setAttribute("info", info);
				nhahang = (NhaHang) session.getAttribute("nhahang");
				int idNH = nhahang.getId();
				String hinh = request.getParameter("hinh");
				String thongtin = request.getParameter("gioithieu");
				BaiDang bd = new BaiDang();
				bd.setIdNH(idNH);
				bd.setThongtin(thongtin);
				String fileName_ = "";
				Part filePart = request.getPart("hinh");
				fileName_ = extractFileName(filePart);
				filePart.write(UPLOAD_DIRECTORY + File.separator + fileName_);
				bd.setHinh(fileName_);
				re.dangbai(bd);
				KhachHangDAO kh = new KhachHangDAO();
				if (member.getRoleId() == 1) {
				ArrayList<NhaHang> list = kh.getListNH();
					for(NhaHang n: list){
						System.out.println(n.getTenNH());
					}
				request.setAttribute("listNhaHang", list);
				KhachHang infoKH = kh.getInfoKH(member.getSdt());
				request.setAttribute("infoKH", infoKH);
				request.getRequestDispatcher("/customer.jsp").forward(request, response);
				}else {
					if (member.getRoleId() == 2) {
						info = re.getNhaHangByIdMB(member.getId());
						request.setAttribute("info", info);
						System.out.println(info.getDiaChi());
						ArrayList<BaiDang>list = re.getListBaiDang(info.getId());
						for(BaiDang n: list){
							System.out.println(n.getHinh());
						}
						request.setAttribute("ListBD", list);
						request.getRequestDispatcher("/customer.jsp").forward(request, response);
					}
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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