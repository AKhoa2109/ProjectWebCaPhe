package daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnection;
import models.DonHang;

public class DonHangDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public DonHangDao() {
	}

	public List<DonHang> getAll() {
		String sql = """
				 		SELECT dh.*, kv.TenKV
				FROM DonHang dh
				INNER JOIN KhuVuc kv ON dh.MaKV = kv.MaKV
				 		""";
		List<DonHang> data = new ArrayList<>();

		try {
			// public DonHang(String maDH, float giaTriDH, Date ngayMua, String trangThai,
			// String maKV, String maVC, String tenKV)
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				DonHang dh = new DonHang(rs.getString("MaDH"), rs.getFloat("GiaTriDH"), rs.getDate("NgayMua"),
						rs.getString("TrangThai"), rs.getString("MaKV"), rs.getString("MaVC"), rs.getString("TenKV"));
				data.add(dh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, ps, conn);
		}

		return data;
	}

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

	public List<DonHang> getByDateRange(Date fromDate, Date toDate) {
		String sql = """
				    SELECT dh.*, kv.TenKV
				    FROM DonHang dh
				    INNER JOIN KhuVuc kv ON dh.MaKV = kv.MaKV
				    WHERE dh.NgayMua BETWEEN ? AND ?
				""";

		List<DonHang> data = new ArrayList<>();

		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setDate(1, new java.sql.Date(fromDate.getTime())); // Convert Date to java.sql.Date
			ps.setDate(2, new java.sql.Date(toDate.getTime())); // Convert Date to java.sql.Date
			rs = ps.executeQuery();

			while (rs.next()) {
				DonHang dh = new DonHang(rs.getString("MaDH"), rs.getFloat("GiaTriDH"), rs.getDate("NgayMua"),
						rs.getString("TrangThai"), rs.getString("MaKV"), rs.getString("MaVC"), rs.getString("TenKV"));
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
				donHang = new DonHang(rs.getString("MaDH"), rs.getFloat("GiaTriDH"), rs.getDate("NgayMua"),
						rs.getString("TrangThai"), rs.getString("MaKV"), rs.getString("MaVC"), rs.getString("TenKV"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, ps, conn);
		}

		return donHang;
	}
}
