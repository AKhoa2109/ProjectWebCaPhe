package controllers;

import java.io.File;
import java.io.IOException;

import daos.LoaiSanPhamDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import models.LoaiSanPham;

/**
 * Servlet implementation class LoaiSanPhamServlet
 */

@WebServlet("/LoaiSanPhamServlet")
public class LoaiSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoaiSanPhamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        LoaiSanPhamDao lspDao = new LoaiSanPhamDao();
        String action = request.getParameter("action");  
        
        if (action == null) {
            request.setAttribute("loaiSanPhamList", lspDao.getAll());
            request.getRequestDispatcher("/views/template/admin.jsp?page=loaiSanPhamTable").forward(request, response);
        } else if (action.equals("edit")) {
            String maLoaiSP = request.getParameter("maLoaiSP");
            request.setAttribute("loaiSanPham", lspDao.getById(maLoaiSP));   
            request.getRequestDispatcher("/views/template/admin.jsp?page=loaiSanPhamEdit").forward(request, response);
        } else if (action.equals("insert") || action.equals("update")) { 
        	System.out.println("213213");
        	//public LoaiSanPham(String maLoaiSP, String tenLoaiSP, String hinhLoaiSP)
        	
        	String maLoaiSP = request.getParameter("maLoaiSP");
        	String tenLoaiSP = request.getParameter("tenLoaiSP");
        	String hinhLoaiSP = request.getParameter("hinhLoaiSP");  
        	//String hinhLoaiSP = "";  
        	
        	System.out.println("Mã loại sản phẩm: " + maLoaiSP);
            System.out.println("Tên loại sản phẩm: " + tenLoaiSP);
            System.out.println("Hình loại sản phẩm: " + hinhLoaiSP);
        	
        	LoaiSanPham newLoaiSP = new LoaiSanPham(maLoaiSP, tenLoaiSP, hinhLoaiSP);
        	//luuAnh(request); 
        	
        	if (action.equals("insert")) {
                if (lspDao.insert(newLoaiSP)) {
                    request.setAttribute("msg", "Thêm thành công");
                } else {
                    request.setAttribute("msg", "Thêm không thành công");
                }
            } else {
                if (lspDao.update(newLoaiSP)) {
                    request.setAttribute("msg", "Sửa thành công");
                } else {
                    request.setAttribute("msg", "Sửa không thành công");
                }
            }
        	
        	request.setAttribute("loaiSanPhamList", lspDao.getAll());
            request.getRequestDispatcher("/views/template/admin.jsp?page=loaiSanPhamTable").forward(request, response);
        } else if (action.equals("delete")) {
        	String maLoaiSP = request.getParameter("maLoaiSP");
            if (lspDao.delete(maLoaiSP)) {
                request.setAttribute("msg", "Xóa thành công");
            } else {
                request.setAttribute("msg", "Xóa không thành công");
            }
            request.setAttribute("loaiSanPhamList", lspDao.getAll());
            request.getRequestDispatcher("/views/template/admin.jsp?page=loaiSanPhamTable").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String maLoaiSP = request.getParameter("maLoaiSP");
		String tenLoaiSP = request.getParameter("tenLoaiSP");
		String hinhLoaiSP = request.getParameter("hinhLoaiSP");

		System.out.println("Mã loại sản phẩm: " + maLoaiSP);
		System.out.println("Tên loại sản phẩm: " + tenLoaiSP);
		System.out.println("Hình loại sản phẩm: " + hinhLoaiSP);
		doGet(request, response);
	}
	
	private String luuAnh(HttpServletRequest request) throws ServletException, IOException {
		// Đường dẫn thư mục trên server  
        String serverFilePath = getServletContext().getRealPath("") + File.separator + "views\\assets\\images\\HinhSanPham";
        System.out.println("Server Path: " + serverFilePath);

        // Đường dẫn thư mục trong gốc của dự án
        int viTriCat = getServletContext().getRealPath("").indexOf(".metadata");
        String localFilePath = getServletContext().getRealPath("").substring(0, viTriCat) + "ProjectWebCaPhe" + File.separator + "src\\main\\webapp\\views\\assets\\images\\HinhSanPham";
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
