package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import daos.LoaiSanPhamDao;
import daos.SanPhamDao;
import daos.SlideDao;


/**
 * Servlet implementation class TrangChuServlet
 */
@WebServlet("/TrangChuServlet")
public class TrangChuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        SlideDao slDao = new SlideDao();
        SanPhamDao sanPhamDao = new SanPhamDao();
        LoaiSanPhamDao loaiSanPhamDao = new LoaiSanPhamDao();
		String action = request.getParameter("action");
		HttpSession session = request.getSession(false);
		if (session != null) {
		    String msg = (String) session.getAttribute("msg");
		    String typeMess = (String) session.getAttribute("typeMess");

		    // Xử lý thông báo nếu có
		    if (msg != null && typeMess != null) {
		        request.setAttribute("msg", msg);
		        request.setAttribute("typeMess", typeMess);
		        // Sau khi xử lý, xóa thông báo khỏi session
		        session.removeAttribute("msg");
		        session.removeAttribute("typeMess");
		    }
		}
		if(action==null)
		{
			request.setAttribute("listSlide", slDao.getByTrangThai("Hiển thị"));
			request.setAttribute("listProduct", sanPhamDao.getAllHot());
			request.setAttribute("listSP", sanPhamDao.getAll());
			request.setAttribute("listLoaiSP", loaiSanPhamDao.getAll());
            request.getRequestDispatcher("/views/template/home.jsp").forward(request, response);
		}
		else if(action.equals("login"))
		{
			request.getRequestDispatcher("/views/template/login.jsp").forward(request, response);
		}
		else if(action.equals("signup"))
		{
			request.getRequestDispatcher("/views/template/signup.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}