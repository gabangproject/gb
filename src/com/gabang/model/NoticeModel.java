package com.gabang.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.IntegerTypeHandler;

import java.util.*;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;
import com.gabang.vo.NoticeVO;
import com.gabang.vo.*;

@Controller
public class NoticeModel {
	@RequestMapping("main/notice.do")
	public String noticeListData(HttpServletRequest request) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<NoticeVO> list = NoticeDAO.noticeListData(map);
		
		HttpSession session=request.getSession();
		String admin = "admin";
		int totalpage = NoticeDAO.noticeTotalPage();
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		session.getAttribute("id"); //email
		session.getAttribute("nick"); //nick
		request.setAttribute("admin", admin);
		request.setAttribute("main_jsp", "../notice/notice.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/noticeContent.do")
	public String noticeContentData(HttpServletRequest request) {
		String no = request.getParameter("no");
		NoticeVO vo = new NoticeVO();
		vo = NoticeDAO.noticeContentData(Integer.parseInt(no));
		String admin = "admin";
		String pages = request.getParameter("page");
		int page = Integer.parseInt(pages);
		request.setAttribute("admin", admin);
		request.setAttribute("vo", vo);
		request.setAttribute("curpage", page);
		request.setAttribute("main_jsp", "../notice/noticeContent.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/noticeInsert.do")
	public String noticeInsert(HttpServletRequest request) {
		String page = request.getParameter("page");
		request.setAttribute("curpage", page);
		request.setAttribute("main_jsp", "../notice/noticeInsert.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/noticeInsert_ok.do")
	public String noticeInsertOk(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("EUC-KR");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session= request.getSession();
		String email = (String) session.getAttribute("id");
		// DB연동
		NoticeVO vo = new NoticeVO();

		vo.setTitle(title);
		vo.setContent(content);
		vo.setEmail(email);
		NoticeDAO.noticeInsert(vo);
		
		return "redirect:notice.do";
	}

@RequestMapping("main/noticeUpdate.do")
	public String noticeUpdate(HttpServletRequest request) {
		String no = request.getParameter("no"); // DB연동
		String page = request.getParameter("page");
		NoticeVO vo = NoticeDAO.noticeUpdateData(Integer.parseInt(no)); // 결과값 전송
		
		request.setAttribute("curpage", page);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../notice/noticeUpdate.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/noticeUpdate_ok.do")
	public String noticeUpdateOk(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("EUC-KR");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String no = request.getParameter("no");
		String page = request.getParameter("page");
		NoticeVO vo = new NoticeVO();
		vo.setNo(Integer.parseInt(no));
		vo.setTitle(title);
		vo.setContent(content);
		
		NoticeDAO.noticeUpdate(vo);
		
		request.setAttribute("no", no);
		
		return "redirect:noticeContent.do?no="+no+"&page="+page;
	}

	@RequestMapping("main/noticeDelete.do")
	public String noticeDelete(HttpServletRequest request) {
		String no = request.getParameter("no");
		NoticeVO vo = new NoticeVO();
		NoticeDAO.noticeDelete(Integer.parseInt(no));
		
		request.setAttribute("no", no);
		return "redirect:notice.do";
	}
}