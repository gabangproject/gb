package com.gabang.vo;

public class SellerVO {
	private String license;		// �����߰��� �ڰ��� ��ȣ
	private String comp_tel;	// ��ȭ��ȣ
	private String comp_name;	// ��ȣ
	private int eval_score;		// ��������
	private String email;			// �����	
	private String addr;			// �ּ�
	private String intro;
	private String pic;
	private int pic_size;
	
	public int getPic_size() {
		return pic_size;
	}
	public void setPic_size(int pic_size) {
		this.pic_size = pic_size;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getComp_tel() {
		return comp_tel;
	}
	public void setComp_tel(String comp_tel) {
		this.comp_tel = comp_tel;
	}
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
	public int getEval_score() {
		return eval_score;
	}
	public void setEval_score(int eval_score) {
		this.eval_score = eval_score;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
}
