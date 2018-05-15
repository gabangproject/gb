package com.gabang.vo;

public class ScoreVO {
	private String email;		//	아이디
	private int num;			//	매물 번호
	private String happy_point;//	만족 지수
	private String eval_score;	//	평가 점수	
	private String	msg;		//	매물 후기
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
	public String getHappy_point() {
		return happy_point;
	}
	public void setHappy_point(String happy_point) {
		this.happy_point = happy_point;
	}
	public String getEval_score() {
		return eval_score;
	}
	public void setEval_score(String eval_score) {
		this.eval_score = eval_score;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}	
}
