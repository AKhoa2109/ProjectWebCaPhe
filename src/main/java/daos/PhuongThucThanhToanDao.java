package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DBConnection;

public class PhuongThucThanhToanDao {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public PhuongThucThanhToanDao() {
        // Constructor mặc định
    }

    public String getTenPhuongThucThanhToanByMaDH(String maDH) {
        String sql = """
            SELECT pttt.TenPTTT
            FROM ThanhToan tt
            JOIN PhuongThucThanhToan pttt ON tt.MaPTTT = pttt.MaPTTT
            WHERE tt.MaDH = ?
        """;
        String phuongThucThanhToan = null;
        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maDH);  // Gán giá trị MaDH vào câu lệnh SQL
            rs = ps.executeQuery();

            if (rs.next()) {
                // Lấy tên phương thức thanh toán và trả về
                phuongThucThanhToan = rs.getString("TenPTTT");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.close(rs, ps, conn);  // Đảm bảo đóng kết nối
        }
        return phuongThucThanhToan;
    }

}
