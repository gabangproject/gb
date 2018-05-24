package com.gabang.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;
import com.gabang.vo.ImgVO;
import com.gabang.vo.MapVO;
import com.gabang.vo.PropertyAddrDAO;

@Controller
public class MaemoolModel {
	@RequestMapping("main/maemool_list.do")
	public String maemoolList(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("euc-kr");
		List<MapVO> geoList = PropertyAddrDAO.getGeoInfo();
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap();

		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel �Ź���ȣ : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // �ش� �Ź���ȣ�� �̹��� �˻�
				// System.out.println(imgList.get(0).getImg());
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // �Ź���ȣ : �̹��� �ּ�
			} catch (Exception e) {
				System.out.println("�Ź���ȣ : " +vo.getNum() + e.getMessage());
			}
		}

		req.setAttribute("oneImg", oneImg);

		req.setAttribute("geoList", geoList);
		req.setAttribute("main_jsp", "../maemool/list.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/upload.do")
	public String maemoolInsert(HttpServletRequest request) {
		request.setAttribute("main_jsp", "../maemool/list.jsp");
		return "main.jsp";
	}

	@RequestMapping("main/maemool_search.do")
	public String maemoolSearch(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("euc-kr");
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap();
		String keyword = req.getParameter("keyword");

		System.out.println("MaemoolModel maemoolSearch : " + keyword);
		geoList = PropertyAddrDAO.searchMaemool(keyword);

		// �Ź���ȣ 1985�� �̹����� ���� null �߻� ��
		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel �Ź���ȣ : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // �ش� �Ź���ȣ�� �̹��� �˻�
				// System.out.println(imgList.get(0).getImg());
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // �Ź���ȣ : �̹��� �ּ�
			} catch (Exception e) {
				System.out.println("�Ź���ȣ : " +vo.getNum() + " "+ e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // �Ź���ȣ : �̹��� �ּ�
			}
		}

		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		req.setAttribute("main_jsp", "../maemool/list.jsp");

		// �׽�Ʈ �������� �̵��ϰԲ�
		// req.setAttribute("main_jsp", "../maemool/testList.jsp");

		return "main.jsp";
	}
}
