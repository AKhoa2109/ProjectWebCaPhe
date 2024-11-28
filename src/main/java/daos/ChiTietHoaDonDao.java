package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnection;
import models.ChiTietHoaDon;

public class ChiTietHoaDonDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ChiTietHoaDonDao () {}
	
	public boolean insert(ChiTietHoaDon ctHD) {
		String sql = """
				INSERT INTO ChiTietHoaDon(MaDH, MaSP, SoLuong, TongTien)
				VALUES(?,?,?,?)
				""";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, ctHD.getMaDH());
			ps.setString(2, ctHD.getMaSP());
			ps.setInt(3, ctHD.getSoLuong());
			ps.setFloat(4, ctHD.getTongTien());
			
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
		return false;
	}
}
