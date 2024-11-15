package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.tags.shaded.org.apache.regexp.recompile;

import conn.DBConnection;
import models.SanPham;
import models.Slide;

public class SanPhamDao {
	private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
	public SanPhamDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<SanPham> getAllHot()
	{
		String sql = """
				SELECT SanPham.MaSP, 
				SanPham.TenSP, 
				SanPham.GiaSP, 
				SanPham.AnhSP,
				SanPham.MaLoaiSP, AVG(DanhGia.SoSao) as TB
				FROM SanPham INNER JOIN DanhGia ON SanPham.MaSP = DanhGia.MaSP 
				GROUP BY SanPham.MaSP,SanPham.TenSP, SanPham.GiaSP, SanPham.AnhSP, SanPham.MaLoaiSP
				"""; 
        List<SanPham> data = new ArrayList<>(); 

        try { 
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) { 
                // Khởi tạo đối tượng Slide từ dữ liệu trong ResultSet
            	SanPham s = new SanPham(
                    rs.getString("MaSP"), // Mã slide
                    rs.getString("TenSP"), // Tên slide
                    rs.getFloat("GiaSP"), // Ảnh slide
                    rs.getString("AnhSP"),
                    rs.getString("MaLoaiSP"),// Vị trí slide
                    rs.getDouble("TB")
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
	
	public List<SanPham> getAll()
	{
		String sql = "SELECT * FROM SanPham"; 
        List<SanPham> data = new ArrayList<>(); 

        try { 
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) { 
                // Khởi tạo đối tượng Slide từ dữ liệu trong ResultSet
            	SanPham s = new SanPham(
                    rs.getString("MaSP"), // Mã slide
                    rs.getString("TenSP"), // Tên slide
                    rs.getFloat("GiaSP"), // Ảnh slide
                    rs.getString("AnhSP"), // Vị trí slide
                    rs.getString("MaLoaiSP")
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
	
	public List<SanPham> getAllSP()
	{
		String sql = """
				SELECT SanPham.MaSP, SanPham.TenSP, SanPham.GiaSP, SanPham.AnhSP, SanPham.MaLoaiSP,LoaiSanPham.TenLoaiSP 
				FROM SanPham INNER JOIN LoaiSanPham ON SanPham.MaLoaiSP = LoaiSanPham.MaLoaiSP
				"""; 
        List<SanPham> data = new ArrayList<>(); 

        try { 
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) { 
                // Khởi tạo đối tượng Slide từ dữ liệu trong ResultSet
            	SanPham s = new SanPham(
                    rs.getString("MaSP"), // Mã slide
                    rs.getString("TenSP"), // Tên slide
                    rs.getFloat("GiaSP"), // Ảnh slide
                    rs.getString("AnhSP"), // Vị trí slide
                    rs.getString("MaLoaiSP"),
                    rs.getString("TenLoaiSP"),
                    rs.getString("MoTaSP")
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
	
	public List<SanPham> getSanPhamByLoaiSP(String idLoaiSP)
	{
		String sql = """
				SELECT * FROM SanPham INNER JOIN 
				LoaiSanPham ON SanPham.MaLoaiSP = LoaiSanPham.MaLoaiSP 
				WHERE SanPham.MaLoaiSP = ?
				"""; 
        List<SanPham> data = new ArrayList<>(); 

        try { 
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,idLoaiSP);
            rs = ps.executeQuery();
            
            while (rs.next()) { 
                
            	SanPham s = new SanPham(
                    rs.getString("MaSP"), 
                    rs.getString("TenSP"), 
                    rs.getFloat("GiaSP"), 
                    rs.getString("AnhSP"), 
                    rs.getString("MaLoaiSP"),
                    rs.getString("TenLoaiSP"),
                    rs.getString("MoTaSP")
                );
                data.add(s);  
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } finally {
            DBConnection.close(rs, ps, conn); 
        }  

        return data;  
	}
	
	public SanPham getSanPhamByLoaiId(String idSP)
	{
		String sql = """
				SELECT * FROM SanPham INNER JOIN 
				LoaiSanPham ON SanPham.MaLoaiSP = LoaiSanPham.MaLoaiSP 
				WHERE SanPham.MaSP = ?
				"""; 
		SanPham s = new SanPham();

        try { 
            conn = DBConnection.getConnection();	
            ps = conn.prepareStatement(sql);
            ps.setString(1,idSP);
            rs = ps.executeQuery();
            
            while (rs.next()) { 
                
            		s = new SanPham(
                    rs.getString("MaSP"), 
                    rs.getString("TenSP"), 
                    rs.getFloat("GiaSP"), 
                    rs.getString("AnhSP"), 
                    rs.getString("MaLoaiSP"),
                    rs.getString("TenLoaiSP"),
                    rs.getString("MoTaSP")
                );
               
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } finally {
            DBConnection.close(rs, ps, conn); 
        }  

        return s;  
	}
}
