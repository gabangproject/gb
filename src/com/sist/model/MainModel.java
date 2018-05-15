package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class MainModel {

	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "home.jsp");
		return "main.jsp";
	}
}
