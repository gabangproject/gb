package com.gabang.vo;

import java.util.Date;

public class MaemoolVO {
	private int num;				//�Ź���ȣ
	private String id_email; 		//�Ź� �����
	private String deposit; 		//������
	private String monthly_rent;	//����	
	private String floor;			//��/�ǹ�����
	private String manage_fee;		//������
	private String maintenance;		//������ �����׸�
	private int	elev;				//����������
	private int	parking_lot;		//����
	private String gross_area;		//ũ��
	private String opt;				//�ɼ�
	private String moving_date;		//���� ������
	private String description;		//�󼼼���
	private String near_subway;		//�α� ��ö��
	private Date regdate; 			//�Ź� �����
	private int	avg_score;			//��� ����	
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getNear_subway() {
		return near_subway;
	}

	public void setNear_subway(String near_subway) {
		this.near_subway = near_subway;
	}

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getMonthly_rent() {
		return monthly_rent;
	}

	public void setMonthly_rent(String monthly_rent) {
		this.monthly_rent = monthly_rent;
	}

	public String getMaintenance() {
		return maintenance;
	}

	public void setMaintenance(String maintenance) {
		this.maintenance = maintenance;
	}

	public String getManage_fee() {
		return manage_fee;
	}

	public void setManage_fee(String manage_fee) {
		this.manage_fee = manage_fee;
	}

	public int getElev() {
		return elev;
	}

	public void setElev(int elev) {
		this.elev = elev;
	}

	public int getParking_lot() {
		return parking_lot;
	}

	public void setParking_lot(int parking_lot) {
		this.parking_lot = parking_lot;
	}

	public String getGross_area() {
		return gross_area;
	}

	public void setGross_area(String gross_area) {
		this.gross_area = gross_area;
	}

	public String getMoving_date() {
		return moving_date;
	}

	public void setMoving_date(String moving_date) {
		this.moving_date = moving_date;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getAvg_score() {
		return avg_score;
	}

	public void setAvg_score(int avg_score) {
		this.avg_score = avg_score;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId_email() {
		return id_email;
	}

	public void setId_email(String id_email) {
		this.id_email = id_email;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
}
