package com.gabang.vo;

public class PropertyAddrVO {
	private String addr;		//	매물주소
	private String x_position;	//	매물 x좌표
	private String y_position;	//	매물 y좌표
	private int num;			//	매물 번호
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getX_position() {
		return x_position;
	}
	public void setX_position(String x_position) {
		this.x_position = x_position;
	}
	public String getY_position() {
		return y_position;
	}
	public void setY_position(String y_position) {
		this.y_position = y_position;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}	
}