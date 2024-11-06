package model;

import java.util.Date;

public class DonHang {
	private String maDH;
	private float giaTriDH;
	private Date ngayMua;
	private String trangThai;
	private String maKV;
	public DonHang() {
		
	}
	public DonHang(String maDH, float giaTriDH, Date ngayMua, String trangThai, String maKV) {
		super();
		this.maDH = maDH;
		this.giaTriDH = giaTriDH;
		this.ngayMua = ngayMua;
		this.trangThai = trangThai;
		this.maKV = maKV;
	}
	public String getMaDH() {
		return maDH;
	}
	public void setMaDH(String maDH) {
		this.maDH = maDH;
	}
	public float getGiaTriDH() {
		return giaTriDH;
	}
	public void setGiaTriDH(float giaTriDH) {
		this.giaTriDH = giaTriDH;
	}
	public Date getNgayMua() {
		return ngayMua;
	}
	public void setNgayMua(Date ngayMua) {
		this.ngayMua = ngayMua;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	public String getMaKV() {
		return maKV;
	}
	public void setMaKV(String maKV) {
		this.maKV = maKV;
	}
	
	

}
