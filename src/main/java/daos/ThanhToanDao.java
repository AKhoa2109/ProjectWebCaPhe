package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnection;
import models.ThanhToan;

public class ThanhToanDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ThanhToanDao () {}
	
	public boolean insert(ThanhToan tt) {
		String sql = """
				INSERT INTO ThanhToan(MaND, MaDH, MaPTTT)
				VALUES(?,?,?)
				""";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, tt.getMaND());
			ps.setString(2, tt.getMaDH());
			ps.setString(3, tt.getMaPTTT());
			
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
		return false;
	}
}
