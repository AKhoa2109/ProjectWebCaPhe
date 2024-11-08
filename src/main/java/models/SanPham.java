package models;

public class SanPham {
	private String maSP;
	private String tenSP;
	private float giaSP;
	private String anhSP;
	private String maLoaiSP;
	public SanPham() {
		
	}
	public SanPham(String maSP, String tenSP, float giaSP, String anhSP, String maLoaiSP) {
		super();
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.giaSP = giaSP;
		this.anhSP = anhSP;
		this.maLoaiSP = maLoaiSP;
	}
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public String getTenSP() {
		return tenSP;
	}
	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}
	public float getGiaSP() {
		return giaSP;
	}
	public void setGiaSP(float giaSP) {
		this.giaSP = giaSP;
	}
	public String getAnhSP() {
		return anhSP;
	}
	public void setAnhSP(String anhSP) {
		this.anhSP = anhSP;
	}
	public String getMaLoaiSP() {
		return maLoaiSP;
	}
	public void setMaLoaiSP(String maLoaiSP) {
		this.maLoaiSP = maLoaiSP;
	}
	
	

}
