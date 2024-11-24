package controllers;

import java.io.File;
import java.io.IOException;

import daos.NguoiDungDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import models.NguoiDung;

/**
 * Servlet implementation class NguoiDungServlet
 */

@WebServlet("/NguoiDungServlet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 50    // 50MB
	)
public class NguoiDungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        NguoiDungDao ndDao = new NguoiDungDao();
        String action = request.getParameter("action"); 
        
        if (action == null) {
            request.setAttribute("nguoiDungList", ndDao.getAll());
            request.getRequestDispatcher("/views/template/admin.jsp?page=nguoiDungTable").forward(request, response);
        } else if (action.equals("edit")) {
            String maND = request.getParameter("maND");
            request.setAttribute("nguoiDung", ndDao.getById(maND));   
            request.getRequestDispatcher("/views/template/admin.jsp?page=nguoiDungEdit").forward(request, response);
        } else if (action.equals("update")) {
            // Đường dẫn thư mục trên server  
            String serverFilePath = getServletContext().getRealPath("") + File.separator + "views\\assets\\images\\HinhNguoiDung";
            System.out.println("Server Path: " + serverFilePath);

            // Đường dẫn thư mục trong gốc của dự án
            int viTriCat = getServletContext().getRealPath("").indexOf(".metadata");
            String localFilePath = getServletContext().getRealPath("").substring(0, viTriCat) + "ProjectWebCaPhe" + File.separator + "src\\main\\webapp\\views\\assets\\images\\HinhNguoiDung";
            System.out.println("Local Path: " + localFilePath);
              
            // Tạo thư mục nếu chưa tồn tại (cho cả server và local)
            File serverUploadDir = new File(serverFilePath);
            if (!serverUploadDir.exists()) {
                serverUploadDir.mkdirs();
            }

            File localUploadDir = new File(localFilePath);
            if (!localUploadDir.exists()) {
                localUploadDir.mkdirs();
            } else if (action.equals("insert") || action.equals("update")) { 
        	/*public NguoiDung(String maND, String tenND, int namSinh, String gioiTinh, String sdt, String email, String diaChi,
			String anhND, String vaiTro, String tenDangNhap, String matKhau) */
        	String maND = request.getParameter("maND");
        	String tenND = request.getParameter("tenND");
        	int namSinh = Integer.parseInt(request.getParameter("namSinh"));
        	String gioiTinh = request.getParameter("gioiTinh");
        	String sdt = request.getParameter("sdt");
        	String email = request.getParameter("email");
        	String diaChi = request.getParameter("diaChi");
        	String anhND = request.getParameter("anhND");
        	String vaiTro = request.getParameter("vaiTro");
        	String tenDangNhap = request.getParameter("tenDangNhap");
        	String matKhau = request.getParameter("matKhau");
        	
        	NguoiDung newNguoiDUng = new NguoiDung(maND, tenND, namSinh, gioiTinh, sdt, email, diaChi, anhND, vaiTro, tenDangNhap, matKhau);
        	luuAnh(request);
        	
        	if (action.equals("insert")) {
                if (ndDao.insert(newNguoiDUng)) {
                    request.setAttribute("msg", "Thêm thành công");
                } else {
                    request.setAttribute("msg", "Thêm không thành công");
                }
            } else {
                if (ndDao.update(newNguoiDUng)) {
                    request.setAttribute("msg", "Sửa thành công");
                } else {
                    request.setAttribute("msg", "Sửa không thành công");
                }
            }
        	
        	 request.setAttribute("nguoiDungList", ndDao.getAll());
             request.getRequestDispatcher("/views/template/admin.jsp?page=nguoiDungTable").forward(request, response);
            }
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
        String serverFilePath = getServletContext().getRealPath("") + File.separator + "views\\assets\\images\\HinhNguoiDung";
        System.out.println("Server Path: " + serverFilePath);

        // Đường dẫn thư mục trong gốc của dự án
        int viTriCat = getServletContext().getRealPath("").indexOf(".metadata");
        String localFilePath = getServletContext().getRealPath("").substring(0, viTriCat) + "ProjectWebCaPhe" + File.separator + "src\\main\\webapp\\views\\assets\\images\\HinhNguoiDung";
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
