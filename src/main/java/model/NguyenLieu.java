package model;

public class NguyenLieu {
	private String maNL;
	private String tenNL;
	private int soLuongTonKho;
	private String maDV;
	public NguyenLieu() {
		
	}
	public NguyenLieu(String maNL, String tenNL, int soLuongTonKho, String maDV) {
		super();
		this.maNL = maNL;
		this.tenNL = tenNL;
		this.soLuongTonKho = soLuongTonKho;
		this.maDV = maDV;
	}
	public String getMaNL() {
		return maNL;
	}
	public void setMaNL(String maNL) {
		this.maNL = maNL;
	}
	public String getTenNL() {
		return tenNL;
	}
	public void setTenNL(String tenNL) {
		this.tenNL = tenNL;
	}
	public int getSoLuongTonKho() {
		return soLuongTonKho;
	}
	public void setSoLuongTonKho(int soLuongTonKho) {
		this.soLuongTonKho = soLuongTonKho;
	}
	public String getMaDV() {
		return maDV;
	}
	public void setMaDV(String maDV) {
		this.maDV = maDV;
	}
	
}
