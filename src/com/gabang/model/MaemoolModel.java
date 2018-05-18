package com.gabang.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;
import com.gabang.vo.MapVO;
import com.gabang.vo.PropertyAddrDAO;
import com.gabang.vo.PropertyAddrVO;

@Controller
public class MaemoolModel{
	@RequestMapping("main/maemool_list.do")
	public String maemoolList(HttpServletRequest req) {
		List<MapVO> geoList = PropertyAddrDAO.getGeoInfo();
		
		req.setAttribute("geoList", geoList);
		req.setAttribute("main_jsp", "../maemool/list.jsp");
		return "main.jsp";
	}
}
