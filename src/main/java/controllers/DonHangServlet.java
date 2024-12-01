package controllers;

import java.io.IOException;
import java.sql.Date;  // Đảm bảo import đúng lớp java.sql.Date
import java.text.SimpleDateFormat;

import daos.DonHangDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DonHangServlet
 */

@WebServlet("/DonHangServlet")
public class DonHangServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public DonHangServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        DonHangDao dhDao = new DonHangDao();
        String action = request.getParameter("action");
        String role = request.getParameter("role");
        String maDH = request.getParameter("maDH");
        String suaTT = request.getParameter("suaTT");
        String huyTT = request.getParameter("huyTT");       
        String trangThai = request.getParameter("trangThai");        

        if (action == null) {   
        	if (suaTT != null)
        	{
            	if (suaTT.equals("edit")) {
                	dhDao.updateTrangThai("Đã giao", maDH);
                }    	
        	}
        	if  (huyTT != null)
        	{
        		if (huyTT.equals("edit")) {
                	dhDao.updateTrangThai("Đã hủy", maDH);
                }
        	}
        	
            String fromDateStr = request.getParameter("fromDate");
            String toDateStr = request.getParameter("toDate");

            if (fromDateStr != null && toDateStr != null && !fromDateStr.isEmpty() && !toDateStr.isEmpty()) {
                try {
                    // Chuyển trực tiếp từ String sang java.sql.Date
                    Date sqlFromDate = Date.valueOf(fromDateStr);  // java.sql.Date từ chuỗi "yyyy-MM-dd"
                    Date sqlToDate = Date.valueOf(toDateStr);

                    // Fetch filtered data based on date range
                    if (role != null) {
                    	request.setAttribute("donHangList", dhDao.getByRange(sqlFromDate, sqlToDate, "ND02", trangThai));
                    }
                    else {
                    	request.setAttribute("donHangList", dhDao.getByRange(sqlFromDate, sqlToDate, null, trangThai));
                    }                  
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                    // Thêm thông báo lỗi nếu cần
                    request.setAttribute("errorMessage", "Định dạng ngày không hợp lệ.");
                }
            } else if (trangThai != null && !trangThai.isEmpty()) {
            	if (role != null) {
                	request.setAttribute("donHangList", dhDao.getByRange(null, null, "ND02", trangThai));
                }
                else {
                	request.setAttribute("donHangList", dhDao.getByRange(null, null, null, trangThai));
                }  
            }
            else {
                // Fetch all data if no date filter
            	if (role != null) {
                    request.setAttribute("donHangList", dhDao.getByNDId("ND02"));
            	}
            	else {
                    request.setAttribute("donHangList", dhDao.getAll());
            	}
            }
            if (role != null) {
            	request.getRequestDispatcher("/views/template/quanlyhoadon.jsp").forward(request, response);
            }
            else {
            	request.getRequestDispatcher("/views/template/admin.jsp?page=donHangTable").forward(request, response);
            }    
        }
    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
