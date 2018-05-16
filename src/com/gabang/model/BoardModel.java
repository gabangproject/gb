package com.gabang.model;

import javax.servlet.http.HttpServletRequest;

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
		int totalpage = BoardDAO.boardTotalPage();
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("main_jsp", "../qnaboard/qnaboard.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/content.do")
	public String boardContentData(HttpServletRequest request) {
		String no = request.getParameter("no");
		BoardVO vo = new BoardVO();
		vo = BoardDAO.boardContentData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../qnaboard/content.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/insert.do")
	public String boardInsert(HttpServletRequest request) {
		request.setAttribute("main_jsp", "../qnaboard/insert.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/insert_ok.do")
	public String boardInsertOk(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("EUC-KR");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		// DB연동
		BoardVO vo = new BoardVO();
		vo.setEmail(email);
		vo.setTitle(title);
		vo.setContent(content);
		BoardDAO.boardInsert(vo);
		return "redirect:qnaboard.do";
	}
	/*
	 * @RequestMapping("qnaboard/update.do") public String
	 * boardUpdate(HttpServletRequest request) { String no =
	 * request.getParameter("no"); // DB연동 BoardVO vo =
	 * BoardDAO.boardUpdateData(Integer.parseInt(no)); // 결과값 전송
	 * request.setAttribute("vo", vo); return "update.jsp"; }
	 * 
	 * @RequestMapping("qnaboard/update_ok.do") public String
	 * boardUpdateOk(HttpServletRequest request) throws Exception {
	 * request.setCharacterEncoding("EUC-KR"); String
	 * name=request.getParameter("name"); String
	 * subject=request.getParameter("subject"); String
	 * content=request.getParameter("content"); String
	 * pwd=request.getParameter("pwd"); String no = request.getParameter("no");
	 * 
	 * BoardVO vo=new BoardVO(); vo.setNo(Integer.parseInt(no)); vo.setName(name);
	 * vo.setSubject(subject); vo.setContent(content); vo.setPwd(pwd);
	 * 
	 * // DB 연동 boolean bCheck= BoardDAO.boardUpdate(vo); // 결과값을 전송
	 * request.setAttribute("bCheck", bCheck); if(bCheck==true) {
	 * request.setAttribute("no", no); } return "update_ok.jsp"; }
	 * 
	 * @RequestMapping("qnaboard/delete.do") public String
	 * boardDelete(HttpServletRequest request) { String no =
	 * request.getParameter("no"); request.setAttribute("no", no); return
	 * "delete.jsp"; }
	 * 
	 * @RequestMapping("qnaboard/delete_ok.do") public String
	 * boardDeleteOK(HttpServletRequest request) { String no =
	 * request.getParameter("no"); String pwd = request.getParameter("pwd"); BoardVO
	 * vo = new BoardVO(); vo.setNo(Integer.parseInt(no)); vo.setPwd(pwd);
	 * 
	 * String db_pwd = BoardDAO.boardGetPwd(vo.getNo()); boolean bCheck=false;
	 * if(db_pwd.equals(vo.getPwd())) { bCheck = true;
	 * BoardDAO.boardDelete(vo.getNo());
	 * 
	 * }else { bCheck=false; } request.setAttribute("bCheck", bCheck); return
	 * "delete_ok.jsp";
	 * 
	 * 
	 * 
	 * }
	 */
}