package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import conn.DBConnection;
import models.DonHang;
import models.Voucher;

public class DonHangDao {
	private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public DonHangDao() {
    	
    }
    
    public List<DonHang> getAll()  { 
        String sql = """
        		SELECT dh.*, kv.TenKV
				FROM DonHang dh 
				INNER JOIN KhuVuc kv ON dh.MaKV = kv.MaKV
        		"""; 
        List<DonHang> data = new ArrayList<>(); 

        try { 
        	// public DonHang(String maDH, float giaTriDH, Date ngayMua, String trangThai, String maKV, String maVC, String tenKV) 
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {  
            	DonHang dh = new DonHang(
                    rs.getString("MaKV"),  
                    rs.getFloat("GiaTriDH"),
                    rs.getDate("NgayMua"), 
                    rs.getString("TrangThai"),
                    rs.getString("MaKV"),
                    rs.getString("MaVC"),
                    rs.getString("TenKV")
                ); 
                data.add(dh);  
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } finally {
            DBConnection.close(rs, ps, conn); 
        }  

        return data;  
    }
    
    public DonHang getById(String maDH) {
        String sql = """
    		SELECT dh.*, kv.TenKV
			FROM DonHang dh 
			INNER JOIN KhuVuc kv ON dh.MaKV = kv.MaKV
			WHERE MaDH = ? 
            """;
        DonHang donHang = null;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maDH);
            rs = ps.executeQuery(); 
            if (rs.next()) {
                donHang = new DonHang(
            		rs.getString("MaKV"),  
                    rs.getFloat("GiaTriDH"),
                    rs.getDate("NgayMua"), 
                    rs.getString("TrangThai"),
                    rs.getString("MaKV"),
                    rs.getString("MaVC"),
                    rs.getString("TenKV")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);
        }
        return donHang;
    }

    
}
