package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnection;
import models.KhuVuc;
import models.SanPham;

public class KhuVucDao {
	private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
	public List<KhuVuc> getAll()
	{
		String sql = "SELECT * FROM KhuVuc"; 
        List<KhuVuc> data = new ArrayList<>(); 

        try { 
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) { 
                // Khởi tạo đối tượng Slide từ dữ liệu trong ResultSet
            	KhuVuc kv = new KhuVuc(
                    rs.getString("MaKV"),
                    rs.getString("TenKV"),
                    rs.getFloat("PhiVanChuyen")
                );
                data.add(kv);  // Thêm slide vào danh sách
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } finally {
            DBConnection.close(rs, ps, conn); // Đảm bảo đóng kết nối
        }  

        return data;  // Trả về danh sách các slide
	}
	
	public KhuVuc getById(String maKV)
	{
		String sql = "SELECT * FROM KhuVuc WHERE maKV = ?"; 
		
		KhuVuc kv = null;
        try { 
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maKV);
            rs = ps.executeQuery();
            
            while (rs.next()) { 
                // Khởi tạo đối tượng Slide từ dữ liệu trong ResultSet
            	kv = new KhuVuc(
                    rs.getString("MaKV"),
                    rs.getString("TenKV"),
                    rs.getFloat("PhiVanChuyen")
                );           
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } finally {
            DBConnection.close(rs, ps, conn); // Đảm bảo đóng kết nối
        }  

        return kv;  
	}
}
