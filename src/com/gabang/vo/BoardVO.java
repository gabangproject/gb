package com.gabang.vo;
import java.util.*;
// MyBatis => column�� = ������ 
// column �������� = ������ ��������
/*
 *    CHAR,VARCHAR2,CLOB = String
 *    NUMBER = int
 *    DATE = java.util.Date
 *    BLOB,BFILE = InputStream
 *    
 *    #{name} = ps.setString(1,getName())
 *      ====
 *      getName()
 *    #{subject} 
 */
public class BoardVO {
    private int no; //��ȣ
    private String email; //�̸���
    private String title; // ����
    private String content; //����
    private String hit; //��ȸ��
    private Date regdate; //�����
    private int group_id; //�׷��ȣ
    private int group_step; //�׷쿡�� ��ȣ
    private int group_tab; // �亯 
    private int parent; //?
    private int degree;  //??
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getGroup_step() {
		return group_step;
	}
	public void setGroup_step(int group_step) {
		this.group_step = group_step;
	}
	public int getGroup_tab() {
		return group_tab;
	}
	public void setGroup_tab(int group_tab) {
		this.group_tab = group_tab;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getDegree() {
		return degree;
	}
	public void setDegree(int degree) {
		this.degree = degree;
	}
    
}