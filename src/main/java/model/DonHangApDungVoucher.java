package model;

public class DonHangApDungVoucher {
	private String maDH;
	private String maVC;
	public DonHangApDungVoucher() {
		
	}
	public DonHangApDungVoucher(String maDH, String maVC) {
		super();
		this.maDH = maDH;
		this.maVC = maVC;
	}
	public String getMaDH() {
		return maDH;
	}
	public void setMaDH(String maDH) {
		this.maDH = maDH;
	}
	public String getMaVC() {
		return maVC;
	}
	public void setMaVC(String maVC) {
		this.maVC = maVC;
	}
	
}
