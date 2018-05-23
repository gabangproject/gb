package com.gabang.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;
import com.gabang.vo.MapVO;
import com.gabang.vo.PropertyAddrDAO;

@Controller
public class MaemoolModel{
	@RequestMapping("main/maemool_list.do")
	public String maemoolList(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("euc-kr");
		List<MapVO> geoList = PropertyAddrDAO.getGeoInfo();
		
		req.setAttribute("geoList", geoList);
		req.setAttribute("main_jsp", "../maemool/list.jsp");
		return "main.jsp";
	}
	
	@RequestMapping("main/upload.do")
	public String maemoolInsert(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "../maemool/list.jsp");
		return "main.jsp";
	}
	
	@RequestMapping("main/maemool_search.do")
	public String maemoolSearch(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("euc-kr");
		List<MapVO> geoList = null;
		String search = req.getParameter("search");
		
		System.out.println("MaemoolModel maemoolSearch : " + search);
		geoList = PropertyAddrDAO.guMaemool(search);

		req.setAttribute("geoList", geoList);
//		req.setAttribute("main_jsp", "../maemool/list.jsp");
		
		//테스트 페이지로 이동하게끔
		req.setAttribute("main_jsp", "../maemool/testList.jsp");
		
		return "main.jsp";
	}
}
