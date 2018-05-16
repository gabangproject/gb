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
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		
		int idCheck=MemberDAO.idCheck(email);
		
		
		request.setAttribute("idCheck", idCheck);
		
		MemberVO vo=MemberDAO.pwdCheck(email);
		
		String db_pwd=vo.getPwd();
		String nick=vo.getNick();
		request.setAttribute("pwd", pwd);
		request.setAttribute("db_pwd",db_pwd );
		
		if(idCheck==1&db_pwd.equals(pwd))
		{
			HttpSession session=request.getSession();
			session.setAttribute("id", email);
			session.setAttribute("nick", nick);
		}
		
		return "../member/login_ok.jsp";
	}
	@RequestMapping("main/logout.do")
	public String logout(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		request.setAttribute("main_jsp", "home.jsp");
		return "index.jsp";
	}
	
	
	
	
	
	@RequestMapping("main/join.do")
	public String JoinData(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "main.jsp";
	}

}
