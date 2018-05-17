package com.gabang.model;

import javax.servlet.http.HttpServletRequest;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;

@Controller
public class MaemoolModel{
	@RequestMapping("main/maemool_list.do")
	public String maemoolList(HttpServletRequest req) {
		
		
		req.setAttribute("main_jsp", "../maemool/list.jsp");
		return "main.jsp";
	}
}
