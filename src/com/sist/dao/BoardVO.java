package com.sist.dao;
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
    private int no;
    private String name;
    private String subject;
    private String content;
    private String pwd;
    private Date regdate;
    private int hit;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	   
}
