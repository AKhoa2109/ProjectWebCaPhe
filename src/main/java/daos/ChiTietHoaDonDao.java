package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnection;
import models.ChiTietHoaDon;

public class ChiTietHoaDonDao {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ChiTietHoaDonDao() {
    }
    
    public List<ChiTietHoaDon> getChiTietHoaDonByMaDH(String maDH) {
        String sql = """
            SELECT cthd.MaDH, cthd.MaSP, sp.TenSP, sp.GiaSP, cthd.SoLuong, cthd.TongTien
            FROM ChiTietHoaDon cthd
            JOIN SanPham sp ON cthd.MaSP = sp.MaSP
            WHERE cthd.MaDH = ?
        """;

        List<ChiTietHoaDon> chiTietHoaDonList = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maDH); // Gán giá trị mã đơn hàng vào tham số
            rs = ps.executeQuery();

            while (rs.next()) {
                // Tạo đối tượng ChiTietHoaDon với constructor của bạn
                ChiTietHoaDon cthd = new ChiTietHoaDon(
                    rs.getString("MaDH"),
                    rs.getString("MaSP"),
                    rs.getInt("SoLuong"),
                    rs.getFloat("TongTien"),
                    rs.getString("TenSP"),
                    rs.getFloat("GiaSP")
                );

                // Thêm vào danh sách kết quả
                chiTietHoaDonList.add(cthd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);  // Đảm bảo đóng kết nối
        }

        return chiTietHoaDonList;  // Trả về danh sách chi tiết hóa đơn
    }
    
    public float getTongTienSanPham(String maDH) {
        String sql = """
            SELECT COALESCE(SUM(cthd.TongTien), 0) AS TongTienSP
            FROM DonHang dh
            JOIN ChiTietHoaDon cthd ON dh.MaDH = cthd.MaDH
            JOIN SanPham sp ON cthd.MaSP = sp.MaSP
            WHERE dh.MaDH = ?
        """;
        float tongTienSP = 0;

        try {
            conn = DBConnection.getConnection(); // Kết nối cơ sở dữ liệu
            ps = conn.prepareStatement(sql);
            ps.setString(1, maDH); // Gán tham số MaDH
            rs = ps.executeQuery();

            if (rs.next()) {
                tongTienSP = rs.getFloat("TongTienSP"); // Lấy giá trị tổng tiền
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn); // Đóng kết nối, PreparedStatement và ResultSet
        }
        return tongTienSP;
    }
    
    public float layPhiVanChuyenTheoMaDH(String maDH) {
        String sql = """
            SELECT kv.PhiVanChuyen
            FROM DonHang dh
            JOIN KhuVuc kv ON dh.MaKV = kv.MaKV
            WHERE dh.MaDH = ?
        """;
        
        float phiVanChuyen = 0;
        
        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maDH);  // Gán giá trị cho MaDH trong câu truy vấn
            rs = ps.executeQuery();

            // Kiểm tra nếu có kết quả trả về và lấy giá trị phí vận chuyển
            if (rs.next()) {
                phiVanChuyen = rs.getFloat("PhiVanChuyen");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);  // Đóng kết nối
        }
        
        return phiVanChuyen;  // Trả về phí vận chuyển
    }


    public float layGiaTriVoucherTheoMaDH(String maDH) {
        String sql = """ 
            SELECT COALESCE(vc.GiaTriVC, 0) AS GiaTriVC
            FROM Voucher vc
            JOIN DonHang dh ON vc.MaVC = dh.MaVC
            WHERE dh.MaDH = ?
        """;
        float giaTriVoucher = 0;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maDH);
            rs = ps.executeQuery();

            if (rs.next()) {
                giaTriVoucher = rs.getFloat("GiaTriVC");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);
        }

        return giaTriVoucher;
    }

    
    public float getThanhTienByMaDH(String maDH) { 
        String sql = "SELECT dbo.func_TongTien_ChiTietHoaDon(?)";
        float tongTien = -1;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maDH);
            rs = ps.executeQuery();

            if (rs.next()) {
                tongTien = rs.getFloat(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);
        }

        return tongTien;
    }
}
