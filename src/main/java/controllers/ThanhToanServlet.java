package controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SignatureException;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.JSONObject;

import daos.ChiTietHoaDonDao;
import daos.DonHangDao;
import daos.GioHangDao;
import daos.PhuongThucThanhToanDao;
import daos.ThanhToanDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.ChiTietHoaDon;
import models.DonHang;
import models.GioHang;
import models.PhuongThucThanhToan;
import models.ThanhToan;

/**
 * Servlet implementation class ThanhToanServlet
 */
@WebServlet("/ThanhToanServlet")
public class ThanhToanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */	
    
	// Các tham số MoMo API
    private static final String PARTNER_CODE = "MOMOBKUN20180529";
    private static final String ACCESS_KEY = "klm05TvNBzhg7h7j";
    private static final String SECRET_KEY = "at67qH6mk8w5Y1nAyMoYKMWACiEi2bsa";
    private static final String ENDPOINT = "https://test-payment.momo.vn/v2/gateway/api/create";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		// Lấy tham số từ request
		HttpSession session = request.getSession();
        String maND = (String) session.getAttribute("maND"); // Lấy mã người dùng từ session
        if (maND == null) {
            maND = "ND01";
        }
        
		GioHangDao ghDao = new GioHangDao();
	    String maKV = (String) session.getAttribute("maKV"); 
	    String maPTTT = (String) session.getAttribute("maPTTT");
		
	    // Kiểm tra nếu không có giá trị trong session (để tránh NullPointerException)
	    if (maKV == null || maPTTT == null) {
	        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	        response.getWriter().write("{\"error\":\"Thiếu mã khu vực và mã PTTT\"}");
	        return;
	    }
	    
	    // Lấy phương thức thanh toán từ cơ sở dữ liệu (PhuongThucThanhToanDao)
	    PhuongThucThanhToanDao ptttDao = new PhuongThucThanhToanDao();
	    PhuongThucThanhToan pttt = ptttDao.getById(maPTTT);
	    
	    if (pttt != null && "MoMo".equals(pttt.getTenPTTT())) 
	    {	    
			// Lấy ngày hiện tại từ java.sql.Date
			Date ngayHT = new Date(System.currentTimeMillis());
	
			// Định dạng mặc định yyyy-MM-dd
			String ngayDD = ngayHT.toString(); 
			String orderInfo = "Ngày tạo: " + ngayDD;
	        
			DecimalFormat df = new DecimalFormat("#");
	        String amount = df.format(Float.parseFloat(request.getParameter("thanhTien")));
	        String ipnUrl = "http://localhost:8080/Project/DanhMucSanPham";
	        String redirectUrl = "http://localhost:8080/Project/DanhMucSanPham";
	        String extraData = "Thanh Toán Bằng MoMo";
	
	        // Tạo requestId và orderId
	        String requestId = String.valueOf(System.currentTimeMillis());
	        String orderId = requestId;
	
	        // Tạo chuỗi raw signature
	        String rawSignature = "accessKey=" + ACCESS_KEY +
	                "&amount=" + amount +
	                "&extraData=" + extraData +
	                "&ipnUrl=" + ipnUrl +
	                "&orderId=" + orderId +
	                "&orderInfo=" + orderInfo +
	                "&partnerCode=" + PARTNER_CODE +
	                "&redirectUrl=" + redirectUrl +
	                "&requestId=" + requestId +
	                "&requestType=captureWallet";
	
	        // Tạo signature
	        String signature = "";
	        try {
	            signature = generateSignature(SECRET_KEY, rawSignature);
	        } catch (SignatureException e) {
	            e.printStackTrace();
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            response.getWriter().write("{\"error\":\"Error while generating signature\"}");
	            return;
	        }
	
	        // Chuẩn bị JSON request body
	        JSONObject requestBody = new JSONObject();
	        requestBody.put("partnerCode", PARTNER_CODE);
	        requestBody.put("accessKey", ACCESS_KEY);
	        requestBody.put("requestId", requestId);
	        requestBody.put("amount", amount);
	        requestBody.put("orderId", orderId);
	        requestBody.put("orderInfo", orderInfo);
	        requestBody.put("redirectUrl", redirectUrl);
	        requestBody.put("ipnUrl", ipnUrl);
	        requestBody.put("extraData", extraData);
	        requestBody.put("requestType", "captureWallet");
	        requestBody.put("signature", signature);
	
	        // Gửi HTTP POST request tới MoMo API
	        try {
	            String responseBody = sendPostRequest(ENDPOINT, requestBody.toString());
	
	            // Lấy payment URL
	            JSONObject jsonResponse = new JSONObject(responseBody);
	            String payUrl = jsonResponse.optString("payUrl", null);
	            response.sendRedirect(payUrl);
	            // Thêm đơn hàng vào db
	            DonHangDao dhDao = new DonHangDao();
	            ThanhToanDao ttDao = new ThanhToanDao();
	            String maDH = dhDao.generateMaDH();
	            List<GioHang> cart = ghDao.getById(maND); 
	            ChiTietHoaDonDao ctDao = new ChiTietHoaDonDao();
	            
	            DonHang dh = new DonHang(maDH, Float.parseFloat(amount), ngayHT , "Đang giao", maKV);
	            dhDao.insert(dh);
	            
	            ThanhToan tt = new ThanhToan(maND, maDH, maPTTT);                       
	            ttDao.insert(tt);
	            
	            for (GioHang gh : cart) {
	            	System.out.println(gh.getSoLuong()*gh.getGiaSP());
	    	    	ctDao.insert(new ChiTietHoaDon(maDH, gh.getMaSP(), gh.getSoLuong(), gh.getSoLuong()*gh.getGiaSP()));
	    	    	ghDao.removeItem(maND, gh.getMaSP());	    	   	
	    	    }  
	            cart = ghDao.getById(maND);
    	    	session.setAttribute("soSPDat", cart.size());
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            response.getWriter().write("{\"error\":\"An error occurred while processing your request.\"}");
	        }
	    } else {
	        // Nếu không phải MoMo, xử lý các phương thức thanh toán khác (nếu có)
	        response.getWriter().write("{\"error\":\"Invalid payment method\"}");
	    }
    }

    // Tạo HMAC-SHA256 signature
    private String generateSignature(String secretKey, String rawSignature) throws SignatureException {
        try {
            SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes(), "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(secretKeySpec);
            byte[] rawHmac = mac.doFinal(rawSignature.getBytes());
            return bytesToHex(rawHmac);
        } catch (Exception e) {
            throw new SignatureException("Error while generating signature", e);
        }
    }

    // Chuyển byte array thành hex string
    private String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xFF & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    // Gửi HTTP POST request và nhận response
    private String sendPostRequest(String apiUrl, String requestBody) throws IOException {
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);

        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = requestBody.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int status = connection.getResponseCode();

        try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                response.append(line.trim());
            }
            return response.toString();
        }
    }
}
