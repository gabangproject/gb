package com.gabang.model;

import javax.servlet.http.HttpServletRequest;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;

@Controller
public class MainModel {

	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request) {
		String[] theme = { "저보증금", "주차 가능", "원룸", "오피스텔", "상위 만족 매물", "많이 찜된 매물" };
		
		request.setAttribute("theme", theme);
		request.setAttribute("main_jsp", "home.jsp");
		return "main.jsp";
	}
}
