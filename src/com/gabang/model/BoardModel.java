package com.gabang.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.IntegerTypeHandler;

import java.util.*;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;
import com.gabang.vo.BoardVO;
import com.gabang.vo.*;

@Controller
public class BoardModel {
	@RequestMapping("main/qnaboard.do")
	public String boardListData(HttpServletRequest request) {
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
		List<BoardVO> list = BoardDAO.boardListData(map);
		
		HttpSession session=request.getSession();
		
		int totalpage = BoardDAO.boardTotalPage();
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		session.getAttribute("id"); //email
		session.getAttribute("nick"); //nick
		request.setAttribute("main_jsp", "../qnaboard/qnaboard.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/content.do")
	public String boardContentData(HttpServletRequest request) {
		String no = request.getParameter("no");
		BoardVO vo = new BoardVO();
		vo = BoardDAO.boardContentData(Integer.parseInt(no));
		
		String pages = request.getParameter("page");
		int page = Integer.parseInt(pages);
		
		request.setAttribute("vo", vo);
		request.setAttribute("curpage", page);
		request.setAttribute("main_jsp", "../qnaboard/content.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/insert.do")
	public String boardInsert(HttpServletRequest request) {
		String page = request.getParameter("page");
		request.setAttribute("curpage", page);
		request.setAttribute("main_jsp", "../qnaboard/insert.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/insert_ok.do")
	public String boardInsertOk(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("EUC-KR");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session= request.getSession();
		String email = (String) session.getAttribute("id");
		// DB연동
		BoardVO vo = new BoardVO();

		vo.setTitle(title);
		vo.setContent(content);
		vo.setEmail(email);
		BoardDAO.boardInsert(vo);
		
		return "redirect:qnaboard.do";
	}

@RequestMapping("main/update.do")
	public String boardUpdate(HttpServletRequest request) {
		String no = request.getParameter("no");
		String page = request.getParameter("page");
		BoardVO vo = BoardDAO.boardUpdateData(Integer.parseInt(no)); // 결과값 전송
		request.setAttribute("vo", vo);
		request.setAttribute("curpage", page);
		request.setAttribute("main_jsp", "../qnaboard/update.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/update_ok.do")
	public String boardUpdateOk(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("EUC-KR");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String no = request.getParameter("no");
		String page = request.getParameter("page");
		BoardVO vo = new BoardVO();
		vo.setNo(Integer.parseInt(no));
		vo.setTitle(title);
		vo.setContent(content);
		
		BoardDAO.boardUpdate(vo);
		
		request.setAttribute("no", no);
		
		return "redirect:content.do?no="+no+"&page="+page;
	}

	@RequestMapping("main/delete.do")
	public String boardDelete(HttpServletRequest request) {
		String no = request.getParameter("no");
		BoardVO vo = new BoardVO();
		BoardDAO.boardDelete(Integer.parseInt(no));
		
		request.setAttribute("no", no);
		return "redirect:qnaboard.do";
	}
	@RequestMapping("main/reply.do")
	public String replyInsert(HttpServletRequest request) {
		String no = request.getParameter("no");
		String curpage = request.getParameter("page");
		
		request.setAttribute("no", no);
		request.setAttribute("curpage", curpage);
		request.setAttribute("main_jsp", "../qnaboard/reply.jsp");
		return "main.jsp";
	}
	@RequestMapping("main/reply_ok.do")
	public String replyInsertData(HttpServletRequest request) {
		String pno = request.getParameter("no");
		String curpage = request.getParameter("page");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		
		
		BoardVO vo = new BoardVO();
		vo.setParent(Integer.parseInt(pno));
		vo.setTitle(title);
		vo.setContent(content);
		String email = (String)session.getAttribute("id");
		vo.setEmail(email); //email
		
		
		BoardDAO.boardReply(Integer.parseInt(pno),vo);
		request.setAttribute("no", pno);
		request.setAttribute("curpage", curpage);
		
		
		return "redirect:qnaboard.do";
	}
}