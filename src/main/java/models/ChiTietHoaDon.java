package models;

public class ChiTietHoaDon {
	private String maDH;
	private String maSP;
	private int soLuong;
	private float tongTien;
	public ChiTietHoaDon() {
		
	}
	public ChiTietHoaDon(String maDH, String maSP, int soLuong, float tongTien) {
		super();
		this.maDH = maDH;
		this.maSP = maSP;
		this.soLuong = soLuong;
		this.tongTien = tongTien;
	}
	public String getMaDH() {
		return maDH;
	}
	public void setMaDH(String maDH) {
		this.maDH = maDH;
	}
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public float getTongTien() {
		return tongTien;
	}
	public void setTongTien(float tongTien) {
		this.tongTien = tongTien;
	}
	
}
