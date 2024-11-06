package model;

public class Slide {
	private String maSilde;
	private String tenSlide;
	private String anhSlide;
	public Slide() {
		
	}
	public Slide(String maSilde, String tenSlide, String anhSlide) {
		super();
		this.maSilde = maSilde;
		this.tenSlide = tenSlide;
		this.anhSlide = anhSlide;
	}
	public String getMaSilde() {
		return maSilde;
	}
	public void setMaSilde(String maSilde) {
		this.maSilde = maSilde;
	}
	public String getTenSlide() {
		return tenSlide;
	}
	public void setTenSlide(String tenSlide) {
		this.tenSlide = tenSlide;
	}
	public String getAnhSlide() {
		return anhSlide;
	}
	public void setAnhSlide(String anhSlide) {
		this.anhSlide = anhSlide;
	}
	
}
