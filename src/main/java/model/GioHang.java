package model;

public class GioHang {
	private String maND;
	private String maSP;
	private int soLuong;
	public GioHang() {
		
	}
	public GioHang(String maND, String maSP, int soLuong) {
		super();
		this.maND = maND;
		this.maSP = maSP;
		this.soLuong = soLuong;
	}
	public String getMaND() {
		return maND;
	}
	public void setMaND(String maND) {
		this.maND = maND;
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
	
}
