package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import daos.SanPhamDao;

/**
 * Servlet implementation class ChiTietSanPhamServlet
 */
public class ChiTietSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChiTietSanPhamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String idLoaiSp = request.getParameter("type");
		System.out.println(idLoaiSp);
		SanPhamDao sanPhamDao = new SanPhamDao();
		
		request.setAttribute("product", sanPhamDao.getSanPhamByLoaiId(id));
		request.setAttribute("listProduct", sanPhamDao.getSanPhamByLoaiSP(idLoaiSp));
		request.getRequestDispatcher("/views/template/chitietSP.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
