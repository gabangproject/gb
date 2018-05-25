package com.gabang.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;
import com.gabang.vo.ImgVO;
import com.gabang.vo.MaemoolDAO;
import com.gabang.vo.MapVO;
import com.gabang.vo.PropertyAddrDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	public void maemoolInsert(HttpServletRequest request) throws IOException {
		
		
		String path="c:\\download";
		int size=1024*1024*100;
		String enctype="EUC-KR";
		
		MultipartRequest mr=new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
		//�̹� ���� ������ ��!
		
		Enumeration img=mr.getFileNames();
		
		while(img.hasMoreElements())
		{
			String img1=(String)img.nextElement();
			String originalName=mr.getOriginalFileName(img1);
			System.out.println(img1);
			System.out.println(originalName);
		}
		/*String fileName=mr.getOriginalFileName("img[]");
		System.out.println(fileName);*/
		/*ImgVO vo=new ImgVO();
		if(img==null)
	    {
	    	vo.setImg("");
	    }
	    // ���ε�� ���� 
	    else
	    {
	    	for(int i=0;i<img.length;i++)
	    	{	
	    		System.out.println(img[i]);
	    		vo.setNum(1);
		    	//file�� ũ�⸦ ������ ���� file�� ���̸� ��Ʈ�� ��ȯ�ؼ� ����� ����
		    	vo.setImg(img[i]);
		    	File f=new File(path+"\\"+img[i]);
		    	
	    	}
	    }
				*/
		//MaemoolDAO.insertMaemool(vo);
		
		
		
		//request.setAttribute("main_jsp", "../maemool/list.jsp");
		//return "main.jsp";
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
