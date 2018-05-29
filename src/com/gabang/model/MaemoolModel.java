package com.gabang.model;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.catalina.Session;
import org.apache.catalina.connector.Request;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;
import com.gabang.vo.ImgVO;
import com.gabang.vo.JjimDAO;
import com.gabang.vo.MaemoolDAO;
import com.gabang.vo.MaemoolVO;
import com.gabang.vo.MapVO;
import com.gabang.vo.PropertyAddrDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MaemoolModel {
	@RequestMapping("main/maemool_list.do")
	public String maemoolList(HttpServletRequest req,HttpServletResponse response) throws Exception {
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
		
		// ���ɸ�� by.�Ѽ�
		String num = req.getParameter("num");
		if (num == null) {
			num = "";
		}
		Cookie cookie = new Cookie("likeNum", num);
		cookie.setMaxAge(365 * 24 * 60 * 60); // ��� ��ȿ�Ⱓ 365�� ����1
		cookie.setPath("C:\\GaBang\\gb");
		response.addCookie(cookie);

		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		req.setAttribute("main_jsp", "../maemool/list.jsp");
		return "main.jsp";
	}
	
	@RequestMapping("main/maemool_detail.do")
	public String maemoolDetail(HttpServletRequest request)
	throws Exception {
		request.setCharacterEncoding("euc-kr");
	
		String num=request.getParameter("num"); // �̹����� �̹����� �ش��ϴ� �������� �Ź���ȣ�� �°� ���
		if(num == null)
			num = "1";
		MaemoolVO vo1=new MaemoolVO();
	//	vo1.setNum(Integer.parseInt(num));
		 
		List<ImgVO> imgList = MaemoolDAO.detailMaemool(Integer.parseInt("50")); // �ӽ÷� 50���� �Ź���ȣ�� �̹����� ���
		MaemoolVO vo = MaemoolDAO.infoMaemool(Integer.parseInt(num));
		
		request.setAttribute("imgList", imgList);
		request.setAttribute("infoMaemool", vo);
		request.setAttribute("main_jsp", "../maemool/maemool_detail.jsp");
	//	CommonModel.commonSendData(request);
		return "main.jsp";
	}
	

	@RequestMapping("main/upload.do")
	public void maemoolInsert(HttpServletRequest request) throws IOException {

		String path="c:\\download";
		int size=1024*1024*100;
		String enctype="EUC-KR";
		
		MultipartRequest mr=new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
		//�̹� ���� ������ ��!
		
		String[] list= mr.getParameterValues("img");
		for(int i=0;i<list.length;i++)
		{
			System.out.println(list+"[i]");
		}
		System.out.println(list);
		/*for(String pName:list)
		{
			System.out.println(pName);
		}*/
		/*while(img.hasMoreElements())
		{
			String img1=(String)img.nextElement();
			String originalName=mr.getOriginalFileName(img1);
			System.out.println(img1);
			System.out.println(originalName);
		}*/
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
		
		
		
		final int KILOBYTE = 1024 * 1024;
		final int MEMORY_THRESHOLD = 3 * KILOBYTE;
		final int MAX_FILE_SIZE = 40 * KILOBYTE;
		final int MAZ_REQUEST_SIZE = 50 * KILOBYTE;
		final String TEMP_PATH = "c:\\download";
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// Set factory constraints
			factory.setSizeThreshold(MEMORY_THRESHOLD);			

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			// Set overall request size constraint
			upload.setSizeMax(MAZ_REQUEST_SIZE);
			upload.setFileSizeMax(MAX_FILE_SIZE);

			// Parse the request			
			try { 
				List<FileItem> items = new ServletFileUpload(factory).parseRequest(request);
				for (FileItem item : items) {
					if (item.isFormField()) {
						// Process regular form field (input type="text|radio|checkbox|etc", select,
						// etc).
						String fieldName = item.getFieldName();
						String fieldValue = item.getString();
						// ... (do your job here)
					} else {
						// Process form file field (input type="file").
						String fieldName = item.getFieldName();
						String fileName = item.getName();
						System.out.println("fieldName:" + fieldName + ", fileName:" + fileName);
						InputStream fileContent = item.getInputStream();
						BufferedImage image = ImageIO.read(fileContent);
						ImageIO.write(image, "jpg", new File(TEMP_PATH + "/" + fileName));
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// home.jsp���� �˻��� ��� �۵�
	@RequestMapping("main/maemool_search.do")
	public String maemoolSearch(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("euc-kr");
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap();	// �Ź���ȣ : �Ź���ǥ�̹���
		String keyword = req.getParameter("keyword");

		System.out.println("MaemoolModel maemoolSearch : " + keyword);
		geoList = PropertyAddrDAO.searchMaemool(keyword);

		// �̹��� ��� �κ�
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
//		req.setAttribute("main_jsp", "../maemool/list.jsp");

		// �׽�Ʈ �������� �̵��ϰԲ�
		 req.setAttribute("main_jsp", "../maemool/testList.jsp");

		return "main.jsp";
	}
	
	// ajax�� �ش��������� �θ���.
	@RequestMapping("main/sideList.do")
	public String sideList(HttpServletRequest req) {
		
		return "../maemool/sideList.jsp";
	}
	
	// �׽�Ʈ�� ���� �޼ҵ�
	@RequestMapping("main/testSideList.do")
	public String testSideList(HttpServletRequest req) throws Exception {
		// �� �޼ҵ�� ajax�� ���ؼ� �ѱ۷� ���۹ޱ⶧����
		// utf-8�� �޾ƾ� �ѱ��� ������ �ʴ´�.
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("keyword");// �˻�� ���޹޴´�.
		
		// ������ �浵�� ���޹޴´�.
		String swLatlng = req.getParameter("swLatlng");
		String neLatlng = req.getParameter("neLatlng");
		
		// ����Ʈ ����� ���� ����
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap();	// �Ź���ȣ : �Ź���ǥ�̹���
		
		System.out.println("testSideList�� ���۵� keyword : " + keyword);
		geoList = PropertyAddrDAO.searchMaemool(keyword);

		// �̹��� ��� �κ�
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
		
		// ������ �浵�� null�� �ƴ� ��� �����Ѵ�.
		if (swLatlng != null && neLatlng != null) {
			System.out.println(swLatlng);
			System.out.println(neLatlng);
		}
		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		
		return "../maemool/testSideList.jsp";
	}
	
	@RequestMapping("main/jjim.do")
	public String jjim(HttpServletRequest req) {
		// id�� session�� ����Ǿ��ִ�.
		HttpSession session = req.getSession();
		Map map = new HashMap();
		String id = (String) session.getAttribute("id");
		int num = (int) req.getAttribute("num");
		
		// �� Ȱ��ȭ�� parameterType�� map�̹Ƿ� map�� �־��ش�.
		map.put("id", id);
		map.put("num", num);
		
		// �� Ȱ��ȭ ����.
		JjimDAO.jjimActive(map);
		
		return "main.jsp";
	}
	@RequestMapping("main/like.do")
	public String like(HttpServletRequest req) {
		String nums = "";
		Cookie[] cookies = req.getCookies();
		System.out.println("���� ����� ���ɸ�� ���� : " + cookies.length);
		if(cookies!=null) {
			for(int i=0; i<cookies.length; i++) {
					nums=cookies[i].getValue();
			}
		}
		MaemoolDAO dao = new MaemoolDAO();
		
		int num = Integer.parseInt(nums);
		MaemoolVO vo = dao.cookie(num);
		
		req.setAttribute("vo", vo);
		for(int i = 0; i<cookies.length; i++) {
			
		}
		
		
		req.setAttribute("main_jsp", "../like/like.jsp");
		return "main.jsp";
	}
}
