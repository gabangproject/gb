package com.gabang.model;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.type.IntegerTypeHandler;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
@Controller
public class BoardModel {
   @RequestMapping("main/qnaboard.do")
   public String boardListData(HttpServletRequest request)
   {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   int rowSize=10;
	   // rownum = 1
	   // 1~10
	   // 11~20
	   int start=(curpage*rowSize)-(rowSize-1);
	   int end=curpage*rowSize;
	   Map map=new HashMap();
	   map.put("start", start);
	   map.put("end", end);
	   List<BoardVO> list=BoardDAO.boardListData(map);
	   int totalpage=BoardDAO.boardTotalPage();
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("main_jsp", "../qnaboard/qnaboard.jsp");
	   return "main.jsp";
   }
}
/*   @RequestMapping("qnaboard/content.do")
   public String boardContentData(HttpServletRequest request)
   {
	   String no=request.getParameter("no");
	   //DB���� 
	   BoardVO vo = BoardDAO.boardContentData(Integer.parseInt(no));
	   request.setAttribute("vo", vo);
	   return "content.jsp";
   }
   @RequestMapping("qnaboard/insert.do")
   public String boardInsert(HttpServletRequest request)
   {
	   return "insert.jsp";
   }
   @RequestMapping("qnaboard/insert_ok.do")
   public String boardInsertOk(HttpServletRequest request)
   throws Exception
   {
	   request.setCharacterEncoding("EUC-KR");
	   String name=request.getParameter("name");
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String pwd=request.getParameter("pwd");
	   //DB���� 
	   BoardVO vo=new BoardVO();
	   vo.setName(name);
	   vo.setSubject(subject);
	   vo.setContent(content);
	   vo.setPwd(pwd);
	   BoardDAO.boardInsert(vo);
	   return "redirect:list.do";
   }
   @RequestMapping("qnaboard/update.do")
   public String boardUpdate(HttpServletRequest request)
   {
	   String no = request.getParameter("no");
	   // DB����
	   	BoardVO vo = BoardDAO.boardUpdateData(Integer.parseInt(no));
	   // ����� ����
	   	request.setAttribute("vo", vo);
	   return "update.jsp";
   }
   @RequestMapping("qnaboard/update_ok.do")
   public String boardUpdateOk(HttpServletRequest request)
   throws Exception
   {	
	   request.setCharacterEncoding("EUC-KR");
	   String name=request.getParameter("name");
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String pwd=request.getParameter("pwd");
	   String no = request.getParameter("no"); 
	   
	   BoardVO vo=new BoardVO();
	   vo.setNo(Integer.parseInt(no));
	   vo.setName(name);
	   vo.setSubject(subject);
	   vo.setContent(content);
	   vo.setPwd(pwd);
	   
	   // DB ����
	   boolean bCheck= BoardDAO.boardUpdate(vo);
	   // ������� ����
	   request.setAttribute("bCheck", bCheck);
	   if(bCheck==true) {
		   request.setAttribute("no", no);
	   }
	   return "update_ok.jsp";
   }
   @RequestMapping("qnaboard/delete.do")
   public String boardDelete(HttpServletRequest request) {
	   String no = request.getParameter("no");
	   request.setAttribute("no", no);
	   return "delete.jsp";
   }
   @RequestMapping("qnaboard/delete_ok.do")
	   public String boardDeleteOK(HttpServletRequest request) {
		   String no = request.getParameter("no");
		   String pwd = request.getParameter("pwd");
		   BoardVO vo = new BoardVO();
		   vo.setNo(Integer.parseInt(no));	
		   vo.setPwd(pwd);
		   
		   String db_pwd = BoardDAO.boardGetPwd(vo.getNo());
		   boolean bCheck=false;
		   if(db_pwd.equals(vo.getPwd())) {
			   bCheck = true;
			   BoardDAO.boardDelete(vo.getNo());
			   
		   }else {
			   bCheck=false;
		   }
		   request.setAttribute("bCheck", bCheck);
		   return "delete_ok.jsp";
		
				   
				   
	   }

}
*/