package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import daos.NguoiDungDao;

/**
 * Servlet implementation class DangNhapServlet
 */
@WebServlet("/DangNhapServlet")
public class DangNhapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		NguoiDungDao ndDao = new NguoiDungDao(); 
		if(action==null)
		{
			request.getRequestDispatcher("/views/template/login.jsp").forward(request, response);
		}
		else if(action.equals("login"))
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			HttpSession session = request.getSession();
			if(ndDao.checkLogin(username, password))
			{
				
				session.setAttribute("nguoiDung", ndDao.getByAccount(username, password));
				session.setAttribute("msg", "Đăng nhập thành công");
				session.setAttribute("typeMess", "success");
				response.sendRedirect(request.getContextPath() + "/TrangChuServlet");
			}
			else 
			{
				session.setAttribute("msg", "Đăng nhập thất bại");
				session.setAttribute("typeMess", "error");
				request.getRequestDispatcher("/views/template/login.jsp").forward(request, response);
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

}
