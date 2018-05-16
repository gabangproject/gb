package com.gabang.model;

import javax.servlet.http.HttpServletRequest;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;




@Controller
public class MemberModel {
	
	@RequestMapping("main/login.do")
	public String LoginData(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "main.jsp";
	}
	
	@RequestMapping("main/join.do")
	public String JoinData(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "../member/singIn.jsp");
		return "main.jsp";
	}

}
