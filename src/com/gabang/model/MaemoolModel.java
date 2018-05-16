package com.gabang.model;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;

@Controller
public class MaemoolModel extends HttpServlet {
	@RequestMapping("main/maemool_list.do")
	public String maemoolList(HttpServletRequest req) {
		String[] theme = {
				"��������",
				"���� ����",
				"����",
				"���ǽ���",
				"���� ���� �Ź�",
				"���� ��� �Ź�"
		};
		
		req.setAttribute("theme", theme);
		req.setAttribute("main_jsp", "../maemool/list.jsp");
		return "main.jsp";
	}
}
