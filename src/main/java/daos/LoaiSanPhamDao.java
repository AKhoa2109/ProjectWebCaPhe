package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnection;
import models.LoaiSanPham;

public class LoaiSanPhamDao {
	private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
	public LoaiSanPhamDao() {
		// TODO Auto-generated constructor stub
	}
	public List<LoaiSanPham> getAll()
	{
		String sql = "SELECT * FROM LoaiSanPham"; 
        List<LoaiSanPham> data = new ArrayList<>(); 

        try { 
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) { 
                // Khởi tạo đối tượng Slide từ dữ liệu trong ResultSet
            	LoaiSanPham lsp = new LoaiSanPham(
                    rs.getString("MaLoaiSP"), 
                    rs.getString("TenLoaiSP"), 
                    rs.getString("HinhLoaiSP") );
                data.add(lsp);  // Thêm slide vào danh sách
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } finally {
            DBConnection.close(rs, ps, conn); // Đảm bảo đóng kết nối
        }  

        return data;  
	}
	
}
