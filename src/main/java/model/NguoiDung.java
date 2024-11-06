package model;

public class NguoiDung {
	private String maND;
	private String tenND;
	private int namSinh;
	private String gioiTinh;
	private String sdt;
	private String email;
	private String diaChi;
	private String vaiTro;
	public NguoiDung() {
		
	}
	public NguoiDung(String maND, String tenND, int namSinh, String gioiTinh, String sdt, String email, String diaChi,
			String vaiTro) {
		super();
		this.maND = maND;
		this.tenND = tenND;
		this.namSinh = namSinh;
		this.gioiTinh = gioiTinh;
		this.sdt = sdt;
		this.email = email;
		this.diaChi = diaChi;
		this.vaiTro = vaiTro;
	}
	public String getMaND() {
		return maND;
	}
	public void setMaND(String maND) {
		this.maND = maND;
	}
	public String getTenND() {
		return tenND;
	}
	public void setTenND(String tenND) {
		this.tenND = tenND;
	}
	public int getNamSinh() {
		return namSinh;
	}
	public void setNamSinh(int namSinh) {
		this.namSinh = namSinh;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getVaiTro() {
		return vaiTro;
	}
	public void setVaiTro(String vaiTro) {
		this.vaiTro = vaiTro;
	}
	
}
