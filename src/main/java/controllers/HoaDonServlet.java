package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnection;
import daos.GioHangDao;
import daos.KhuVucDao;
import daos.PhuongThucThanhToanDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.GioHang;
import models.KhuVuc;
import models.PhuongThucThanhToan;

/**
 * Servlet implementation class HoaDonServlet
 */
@WebServlet("/HoaDonServlet")
public class HoaDonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HoaDonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    KhuVucDao kvDAO = new KhuVucDao();
    PhuongThucThanhToanDao ptttDAO = new PhuongThucThanhToanDao();
    GioHangDao ghDao = new GioHangDao();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		HttpSession session = request.getSession();
        String maND = (String) session.getAttribute("maND"); // Lấy mã người dùng từ session
        if (maND == null) {
            maND = "ND01";
        }
		
	    
	    List<KhuVuc> dSKhuVuc = kvDAO.getAll();
        List<PhuongThucThanhToan> dSPTTT = ptttDAO.getAll();
		
        // Xử lý khu vực
        String maKV = request.getParameter("khuVuc");
        if (maKV != null) {
            session.setAttribute("maKV", maKV); // Lưu mã khu vực vào session
        } else {
            maKV = (String) session.getAttribute("maKV");
            if (maKV == null && !dSKhuVuc.isEmpty()) {
                maKV = dSKhuVuc.get(0).getMaKV(); // Lấy khu vực đầu tiên làm mặc định
                session.setAttribute("maKV", maKV);
            }
        }
        KhuVuc kv = kvDAO.getById(maKV);
        if (kv != null) {
            session.setAttribute("kvPhi", kv.getPhiVanChuyen()); // Lưu phí vận chuyển vào session
        }     
        
        // Xử lý phương thức thanh toán
        String maPTTT = request.getParameter("maPTTT");
        if (maPTTT != null) {
            session.setAttribute("maPTTT", maPTTT); // Lưu phương thức thanh toán vào session
        } else {
            maPTTT = (String) session.getAttribute("maPTTT");
            if (maPTTT == null && !dSPTTT.isEmpty()) {
            	maPTTT = dSPTTT.get(0).getMaPTTT(); // Lấy phương thức thanh toán đầu tiên làm mặc định
                session.setAttribute("maPTTT", maPTTT);
            }
        }
        
        List<GioHang> cart = ghDao.getById(maND);   
	    String action = request.getParameter("action");
	    String maSP = request.getParameter("maSP");
	    
	    if (action == null) action = "";

	    // Nếu action == delete thì thực hiện xóa
	    if (action.equals("delete") && maSP != null) {
	    	ghDao.removeItem(maND, maSP);
	    	cart = ghDao.getById(maND);
	        session.setAttribute("soSPDat", cart.size());
	    }
	    
	    // Tính tổng tiền
	    int thanhTien = 0;
	    for (GioHang gh : cart) {
	    	thanhTien += gh.getSoLuong() * gh.getGiaSP();
	    }

        request.setAttribute("dSKhuVuc", dSKhuVuc);        
        request.setAttribute("dSPTTT", dSPTTT);
	    request.setAttribute("thanhTien", thanhTien);
	    request.setAttribute("cart", cart);

	    // Chuyển tiếp sang JSP (chỉ gọi 1 lần)
	    getServletContext().getRequestDispatcher("/views/template/chitietHD.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
