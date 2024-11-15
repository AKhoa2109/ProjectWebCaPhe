package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnection;
import models.Slide;


public class SlideDao {
	private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
	public SlideDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Slide> getAll()  { 
        String sql = "SELECT * FROM Slide"; // Thay đổi bảng thành Voucher
        List<Slide> data = new ArrayList<>(); 

        try { 
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) { 
                // Khởi tạo đối tượng Slide từ dữ liệu trong ResultSet
            	Slide s = new Slide(
                    rs.getString("MaSlide"), // Mã slide
                    rs.getString("TenSlide"), // Tên slide
                    rs.getString("AnhSlide"), // Ảnh slide
                    rs.getString("ViTri"), // Vị trí slide
                    rs.getString("TrangThai"), // Trạng thái slide
                    rs.getString("MaND") // Mã người dùng slide
                );
                data.add(s);  // Thêm slide vào danh sách
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } finally {
            DBConnection.close(rs, ps, conn); // Đảm bảo đóng kết nối
        }  

        return data;  // Trả về danh sách các slide
    }
	
	public List<Slide> getByTrangThai(String tt)
	{
		String sql = "SELECT MaSlide, TenSlide, AnhSlide FROM Slide WHERE TrangThai = ?";
		List<Slide> data = new ArrayList<>();
		
		
		try {
			conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, tt);
            rs = ps.executeQuery();
            
            
            while (rs.next()) { 
                // Khởi tạo đối tượng Slide từ dữ liệu trong ResultSet
            	Slide s = new Slide(
                    rs.getString("MaSlide"), // Mã slide
                    rs.getString("TenSlide"), // Tên slide
                    rs.getString("AnhSlide") // Ảnh slide
                );
                data.add(s);  // Thêm slide vào danh sách
            }
		} catch (SQLException e) {
			// TODO: handle exception
			 e.printStackTrace(); 
		}
		finally {
            DBConnection.close(rs, ps, conn); // Đảm bảo đóng kết nối
        }
		return data;
	}

}
