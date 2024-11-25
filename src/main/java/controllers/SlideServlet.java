package controllers;

import java.io.File;
import java.io.IOException;

import daos.SlideDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import models.Slide;

/**
 * Servlet implementation class SlideServlet
 */

@WebServlet("/SlideServlet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 50    // 50MB
	)
public class SlideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SlideServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */ 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
        SlideDao sDao = new SlideDao();
        String action = request.getParameter("action"); 
        
        if (action == null) {
            request.setAttribute("slideList", sDao.getAll());
            request.getRequestDispatcher("/views/template/admin.jsp?page=slideTable").forward(request, response);
        } else if (action.equals("filter")) { 
        	String option = request.getParameter("filterOption");
        	if(option.equals("default")) { 
                request.setAttribute("slideList", sDao.getAll());
                request.getRequestDispatcher("/views/template/admin.jsp?page=slideTable").forward(request, response);
        	} else {
        		request.setAttribute("slideList", sDao.getAllOrderByViTri());
                request.getRequestDispatcher("/views/template/admin.jsp?page=slideTable").forward(request, response);
        	} 
        } else if (action.equals("add")) {  
            request.getRequestDispatcher("/views/template/admin.jsp?page=slideAdd").forward(request, response);
        } else if (action.equals("edit")) {
            String maSlide = request.getParameter("maSlide");
            request.setAttribute("slide", sDao.getById(maSlide));
            request.getRequestDispatcher("/views/template/admin.jsp?page=slideEdit").forward(request, response);
        } else if (action.equals("insert") || action.equals("update")) { 
        	//public Slide(String maSlide, String tenSlide, String anhSlide, String viTri, String trangThai, String maND)
        	String maSlide = request.getParameter("maSlide");
        	String tenSlide = request.getParameter("tenSlide");
        	String anhSlide = request.getParameter("anhSlide");
        	String viTri = request.getParameter("viTri");
        	String trangThai = request.getParameter("trangThai");
        	String maND = "ND01";
        	
        	Slide newSlide = new Slide(maSlide, tenSlide, anhSlide, viTri, trangThai, maND);
        	luuAnh(request);
        	
        	if (action.equals("insert")) {
                if (sDao.insert(newSlide)) {
                    request.setAttribute("msg", "Thêm thành công");
                } else {
                    request.setAttribute("msg", "Thêm không thành công");
                }
            } else {
                if (sDao.update(newSlide)) {
                    request.setAttribute("msg", "Sửa thành công");
                } else {
                    request.setAttribute("msg", "Sửa không thành công");
                }
            }
        	
        	request.setAttribute("slideList", sDao.getAll());
            request.getRequestDispatcher("/views/template/admin.jsp?page=slideTable").forward(request, response);
        } else if (action.equals("delete")) {
            String maSlide = request.getParameter("maSlide");
            if (sDao.delete(maSlide)) {
                request.setAttribute("msg", "Xóa thành công");
            } else {
                request.setAttribute("msg", "Xóa không thành công");
            }
            request.setAttribute("slideList", sDao.getAll());
            request.getRequestDispatcher("/views/template/admin.jsp?page=slideTable").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String luuAnh(HttpServletRequest request) throws ServletException, IOException {
		// Đường dẫn thư mục trên server  
        String serverFilePath = getServletContext().getRealPath("") + File.separator + "views\\assets\\images\\Slide";
        System.out.println("Server Path: " + serverFilePath);

        // Đường dẫn thư mục trong gốc của dự án
        int viTriCat = getServletContext().getRealPath("").indexOf(".metadata");
        String localFilePath = getServletContext().getRealPath("").substring(0, viTriCat) + "ProjectWebCaPhe" + File.separator + "src\\main\\webapp\\views\\assets\\images\\Slide";
        System.out.println("Local Path: " + localFilePath);
          
        // Tạo thư mục nếu chưa tồn tại (cho cả server và local)
        File serverUploadDir = new File(serverFilePath);
        if (!serverUploadDir.exists()) {
            serverUploadDir.mkdirs();
        }

        File localUploadDir = new File(localFilePath);
        if (!localUploadDir.exists()) {
            localUploadDir.mkdirs();
        }
        
        String fileName = "";
        for (Part part : request.getParts()) {
        	fileName = extractFileName(part); 
            if (fileName != null && !fileName.isEmpty()) {
            	System.out.println(fileName);
            	
                // Lưu vào thư mục trên server
                String serverFile = serverFilePath + File.separator + fileName;
                part.write(serverFile);  

                // Lưu vào thư mục trong gốc dự án
                String localFile = localFilePath + File.separator + fileName;
                part.write(localFile);   
            }
        }
        
        return fileName;
	}
	
	private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition"); // có dạng là: form-data; name="fileSlide"; filename="example.jpg"
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }
	
	  
}
