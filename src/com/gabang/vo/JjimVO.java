package com.gabang.vo;

import java.util.Date;

public class JjimVO {
	private Date regdate;	// 등록일
	private String email;	// 아이디
	private int num;		// 매물번호
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}	
}