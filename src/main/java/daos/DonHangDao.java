package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import conn.DBConnection;
import models.DonHang;

public class DonHangDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public DonHangDao () {}
	
    public String generateMaDH() {
        String sql = "SELECT dbo.FUNC_TaoMaDH() AS MaDH";
        String maDH = null;
        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                maDH = rs.getString("MaDH");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);
        }
        return maDH;
    }
	
	public boolean insert(DonHang dh) {
		String sql = """
				INSERT INTO DonHang(MaDH, GiaTriDH, NgayMua, TrangThai, MaKV)
				VALUES(?,?,?,?,?)
				""";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dh.getMaDH());
			ps.setFloat(2, dh.getGiaTriDH());
			ps.setDate(3, dh.getNgayMua());
			ps.setString(4, dh.getTrangThai());
			ps.setString(5, dh.getMaKV());
			
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
		return false;
	}
}
