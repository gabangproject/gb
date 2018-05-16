package com.gabang.vo;
import java.util.*;
// MyBatis => column명 = 변수명 
// column 데이터형 = 변수의 데이터형
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
    private int no; //번호
    private String email; //이메일
    private String title; // 제목
    private String content; //내용
    private String hit; //조회수
    private Date regdate; //등록일
    private int group_id; //그룹번호
    private int group_step; //그룹에서 번호
    private int group_tab; // 답변 
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