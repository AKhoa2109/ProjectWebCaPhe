package controllers;

import java.io.IOException;
import java.util.List;

import daos.ChiTietHoaDonDao;
import daos.GioHangDao;
import daos.KhuVucDao;
import daos.PhuongThucThanhToanDao;
import daos.VoucherDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.ChiTietHoaDon;
import models.GioHang;
import models.KhuVuc;
import models.PhuongThucThanhToan;
import models.Voucher;

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
		            
	    // Xử lí mã giảm giá
        String maGG = request.getParameter("maGiamGia");  
        // Xử lí hủy voucher
        String themVoucher = request.getParameter("themVoucher");
        if ("true".equals(themVoucher)) {
        	try {
                // Kiểm tra nếu mã giảm giá không phải là null hoặc chuỗi rỗng
                if (maGG != null && !maGG.isEmpty()) {
                    VoucherDao vcDao = new VoucherDao();
                    Voucher vc = vcDao.getById(maGG); // Lấy mã giảm giá từ database
                    if (vc != null) {
                        // Nếu tìm thấy voucher hợp lệ, đưa giá trị giảm giá vào request
                    	session.setAttribute("maGiamGia", maGG);
                        session.setAttribute("giamGia", vc.getGiaTriVC());
                        request.setAttribute("msg", "Đã áp dụng mã giảm giá");
                    } else {
                        // Nếu không tìm thấy voucher tương ứng, thông báo lỗi
                        request.setAttribute("msg", "Mã giảm giá không hợp lệ");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msg", "Lỗi khi xử lý mã giảm giá");
            }
        }     
        
        // Xử lí hủy voucher
        String xoaVoucher = request.getParameter("xoaVoucher");
        if ("true".equals(xoaVoucher)) {
        	session.removeAttribute("maGiamGia");
            session.setAttribute("giamGia", 0);
            request.setAttribute("msg", "Mã giảm giá đã bị hủy");
        }
        
        // Xử lí khu vực
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

	    String maDH = request.getParameter("maDH");
	    // Nếu action == delete thì thực hiện xóa
	    if (action.equals("delete") && maSP != null) {
	    	ghDao.removeItem(maND, maSP);
	    	cart = ghDao.getById(maND);
	        session.setAttribute("soSPDat", cart.size());
	    }
	    else if (action.equals("xoaDH") && maDH != null) {
	    	// Thêm từng sản phẩm trong giỏ hàng vào chi tiết hóa đơn
	        for (GioHang gh : cart) {	        
	            ghDao.removeItem(maND, gh.getMaSP()); // Xóa sản phẩm đã đặt khỏi giỏ hàng
	        }
	        
	        cart = ghDao.getById(maND); // Lấy lại giỏ hàng sau khi xóa
	        session.setAttribute("soSPDat", cart.size()); // Cập nhật số sản phẩm đã đặt
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

	    // Lấy tham số để hiện thông báo
	    String msg = (String) request.getAttribute("msg");
	    request.setAttribute("msg", msg);
	    	
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
