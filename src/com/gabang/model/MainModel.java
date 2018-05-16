package com.gabang.model;

import javax.servlet.http.HttpServletRequest;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;

@Controller
public class MainModel {

	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "home.jsp");
		return "main.jsp";
	}
}
