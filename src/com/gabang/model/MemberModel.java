package com.gabang.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;
import com.gabang.vo.MemberDAO;
import com.gabang.vo.MemberVO;
import com.sun.xml.internal.ws.client.SenderException;




@Controller
public class MemberModel {
	
	
	@RequestMapping("main/login.do")
	public String LoginData(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "main.jsp";
	}
	
	@RequestMapping("main/login_ok.do")
	public String LoginOk(HttpServletRequest request) throws Exception
	{	
		request.setCharacterEncoding("EUC-KR");
		
		String cmd=request.getRequestURI();//현재 uri를 가져옴
		cmd="../"+cmd.substring(cmd.indexOf("/",1)+1);
		
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		MemberVO vo=new MemberVO();
		String db_pwd="";
		String nick="";
		
		//id 존재 여부 체크
		int loginIdCheck=MemberDAO.loginIdCheck(email);
		
		//id가 있으면
		if(loginIdCheck==1)
		{
			//비밀번호 체크
			vo=MemberDAO.loginPwdCheck(email);
			
			db_pwd=vo.getPwd();
			nick=vo.getNick();
			
			//비번 체크
			if(pwd.equals(db_pwd))
			{
				HttpSession session=request.getSession();
				session.setAttribute("id", email);
				session.setAttribute("nick", nick);
				request.setAttribute("pwd", pwd);
				request.setAttribute("db_pwd",db_pwd );
				request.setAttribute("cmd", cmd);
			}
			else 
			{	//비번이 다르면
				request.setAttribute("pwd", pwd);
				request.setAttribute("db_pwd",db_pwd );
			}
			
		}
		else 
		{
			//id 존재 여부를  보냄(있으면 1 없으면 0)
			request.setAttribute("loginIdCheck", loginIdCheck);
			
		}
		
		
	
		
		return "../member/login_ok.jsp";
	}
	
	
	@RequestMapping("main/logout.do")
	public String logout(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		/*String cmd=request.getRequestURI();//현재 uri를 가져옴
		//cmd="../"+cmd.substring(cmd.indexOf("/",1)+1);
		System.out.println(cmd);
		String page=request.getParameter("page");
		System.out.println(page);
		page="../"+page.substring(page.lastIndexOf("/GaBang/")+8);
		System.out.println(page);*/
		request.setAttribute("main_jsp", "home.jsp");
		return "main.jsp";
	}
	
	
	@RequestMapping("main/maemul_upload.do")
	public String maemul_upload(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "../member/maemul_upload.jsp");
		return "main.jsp";
	}
	
	
	@RequestMapping("main/join.do")
	public String JoinData(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "main.jsp";
	}

}
