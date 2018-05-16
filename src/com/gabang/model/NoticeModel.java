package com.gabang.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;
import com.gabang.vo.BoardDAO;
import com.gabang.vo.BoardVO;

@Controller
public class NoticeModel {
	@RequestMapping("main/notice.do")
	public String noticeListData(HttpServletRequest request) {
		request.setAttribute("main_jsp", "../notice/notice.jsp");
		return "main.jsp";
	}
}