package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnection;
import models.Voucher;

public class VoucherDao {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public VoucherDao() { 
    }

    // Phương thức lấy tất cả các voucher từ cơ sở dữ liệu
    public List<Voucher> getAll()  { 
        String sql = "SELECT * FROM Voucher"; // Thay đổi bảng thành Voucher
        List<Voucher> data = new ArrayList<>(); 

        try { 
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) { 
                // Khởi tạo đối tượng Voucher từ dữ liệu trong ResultSet
                Voucher v = new Voucher(
                    rs.getString("maVC"), // Mã voucher
                    rs.getString("tenVC"), // Tên voucher
                    rs.getFloat("giaTriVC"), // Giá trị voucher
                    rs.getInt("soLuotSuDungToiDa"), // Số lượt sử dụng tối đa
                    rs.getInt("soLuotDaSuDung"), // Số lượt đã sử dụng
                    rs.getDate("ngayBatDau"), // Ngày bắt đầu
                    rs.getDate("ngayKetThuc"), // Ngày kết thúc
                    rs.getString("trangThai") // Tình trạng
                );
                data.add(v);  // Thêm voucher vào danh sách
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        } finally {
            DBConnection.close(rs, ps, conn); // Đảm bảo đóng kết nối
        }  

        return data;  // Trả về danh sách các voucher
    }
    
    public Voucher getById(String maVC) {
        String sql = """
            SELECT * 
            FROM Voucher
            WHERE maVC=?
            """;
        Voucher voucher = null;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maVC);
            rs = ps.executeQuery();

            if (rs.next()) {
                voucher = new Voucher(
                    rs.getString("maVC"),
                    rs.getString("tenVC"),
                    rs.getFloat("giaTriVC"),
                    rs.getInt("soLuotSuDungToiDa"),
                    rs.getInt("soLuotDaSuDung"),
                    rs.getDate("ngayBatDau"),
                    rs.getDate("ngayKetThuc"),
                    rs.getString("trangThai")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);
        }
        return voucher;
    }

    public boolean insert(Voucher v) {
        String sql = """
            INSERT INTO Voucher
            (maVC, tenVC, giaTriVC, soLuotSuDungToiDa, soLuotDaSuDung, ngayBatDau, ngayKetThuc, trangThai)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            """;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, v.getMaVC());
            ps.setString(2, v.getTenVC());
            ps.setFloat(3, v.getGiaTriVC());
            ps.setInt(4, v.getSoLuotSuDungToiDa());
            ps.setInt(5, v.getSoLuotDaSuDung());
            ps.setDate(6, v.getNgayBatDau());
            ps.setDate(7, v.getNgayKetThuc());
            ps.setString(8, v.getTrangThai());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);
        }
        return false;
    }

    public boolean update(Voucher v) {
        String sql = """
            UPDATE Voucher
            SET tenVC=?, giaTriVC=?, soLuotSuDungToiDa=?, soLuotDaSuDung=?, ngayBatDau=?, ngayKetThuc=?, trangThai=?
            WHERE maVC=?
            """;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(8, v.getMaVC());
            ps.setString(1, v.getTenVC());
            ps.setFloat(2, v.getGiaTriVC());
            ps.setInt(3, v.getSoLuotSuDungToiDa());
            ps.setInt(4, v.getSoLuotDaSuDung());
            ps.setDate(5, v.getNgayBatDau());
            ps.setDate(6, v.getNgayKetThuc());
            ps.setString(7, v.getTrangThai());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);
        }
        return false;
    }

    public boolean delete(String maVC) {
        String sql = """
            DELETE FROM Voucher
            WHERE maVC=?
            """;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maVC);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);
        }
        return false;
    }
    
    public List<Voucher> searchByName(String tenVC) {
        String sql = """
            SELECT * FROM Voucher
            WHERE tenVC COLLATE Latin1_General_CI_AS LIKE ?
        """;
        List<Voucher> data = new ArrayList<>();
        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + tenVC + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Voucher v = new Voucher(
                    rs.getString("maVC"),
                    rs.getString("tenVC"),
                    rs.getFloat("giaTriVC"),
                    rs.getInt("soLuotSuDungToiDa"),
                    rs.getInt("soLuotDaSuDung"),
                    rs.getDate("ngayBatDau"),
                    rs.getDate("ngayKetThuc"),
                    rs.getString("trangThai")
                );
                data.add(v);
                System.out.println("Mã: "+rs.getString("maVC"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);
        }
        return data;
    }

}
