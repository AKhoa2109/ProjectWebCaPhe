package model;

public class PhaChe {
	private String maSP;
	private String maNL;
	private int soLuong;
	public PhaChe() {
		
	}
	public PhaChe(String maSP, String maNL, int soLuong) {
		super();
		this.maSP = maSP;
		this.maNL = maNL;
		this.soLuong = soLuong;
	}
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public String getMaNL() {
		return maNL;
	}
	public void setMaNL(String maNL) {
		this.maNL = maNL;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
}
