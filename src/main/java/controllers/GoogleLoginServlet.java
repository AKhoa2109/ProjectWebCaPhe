package controllers;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.Normalizer.Form;

import models.*;

/**
 * Servlet implementation class GoogleLoginServlet
 */
public class GoogleLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GoogleLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String code = request.getParameter("code");
		
		if (code != null && !code.isEmpty()) {
			GoogleLogin gg = new GoogleLogin();
			String accessToken = gg.getToken(code);
			NguoiDung nguoiDung = gg.getUserInfo(accessToken);
			
			HttpSession session = request.getSession();
			session.setAttribute("nguoiDung", nguoiDung);
		}

		response.sendRedirect(request.getContextPath() + "/TrangChuServlet");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
