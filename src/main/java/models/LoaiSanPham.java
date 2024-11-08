package models;

public class LoaiSanPham {
	private String maLoaiSP;
	private String tenLoaiSP;
	public LoaiSanPham() {
		
	}
	public LoaiSanPham(String maLoaiSP, String tenLoaiSP) {
		super();
		this.maLoaiSP = maLoaiSP;
		this.tenLoaiSP = tenLoaiSP;
	}
	public String getMaLoaiSP() {
		return maLoaiSP;
	}
	public void setMaLoaiSP(String maLoaiSP) {
		this.maLoaiSP = maLoaiSP;
	}
	public String getTenLoaiSP() {
		return tenLoaiSP;
	}
	public void setTenLoaiSP(String tenLoaiSP) {
		this.tenLoaiSP = tenLoaiSP;
	}
	
}
