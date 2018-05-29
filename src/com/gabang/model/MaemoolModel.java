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
			// System.out.println("maemoolModel 매물번호 : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // 해당 매물번호로 이미지 검색
				// System.out.println(imgList.get(0).getImg());
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // 매물번호 : 이미지 주소
				
			} catch (Exception e) {
				System.out.println("매물번호 : " +vo.getNum() + e.getMessage());
			}
		}
		
		// 관심목록 by.한솔
		String num = req.getParameter("num");
		if (num == null) {
			num = "";
		}
		Cookie cookie = new Cookie("likeNum", num);
		cookie.setMaxAge(365 * 24 * 60 * 60); // 쿠기 유효기간 365일 설정1
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
	
		String num=request.getParameter("num"); // 이미지랑 이미지에 해당하는 상세정보를 매물번호에 맞게 출력
		if(num == null)
			num = "1";
		MaemoolVO vo1=new MaemoolVO();
	//	vo1.setNum(Integer.parseInt(num));
		 
		List<ImgVO> imgList = MaemoolDAO.detailMaemool(Integer.parseInt("50")); // 임시로 50번의 매물번호의 이미지를 출력
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
		//이미 파일 생성은 끝!
		
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
	    // 업로드된 상태 
	    else
	    {
	    	for(int i=0;i<img.length;i++)
	    	{	
	    		System.out.println(img[i]);
	    		vo.setNum(1);
		    	//file의 크기를 저장할 때는 file의 길이를 인트로 변환해서 사이즈를 측정
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

	// home.jsp에서 검색할 경우 작동
	@RequestMapping("main/maemool_search.do")
	public String maemoolSearch(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("euc-kr");
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap();	// 매물번호 : 매물대표이미지
		String keyword = req.getParameter("keyword");

		System.out.println("MaemoolModel maemoolSearch : " + keyword);
		geoList = PropertyAddrDAO.searchMaemool(keyword);

		// 이미지 출력 부분
		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel 매물번호 : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // 해당 매물번호로 이미지 검색
				// System.out.println(imgList.get(0).getImg());
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // 매물번호 : 이미지 주소
			} catch (Exception e) {
				System.out.println("매물번호 : " +vo.getNum() + " "+ e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // 매물번호 : 이미지 주소
			}
		}

		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
//		req.setAttribute("main_jsp", "../maemool/list.jsp");

		// 테스트 페이지로 이동하게끔
		 req.setAttribute("main_jsp", "../maemool/testList.jsp");

		return "main.jsp";
	}
	
	// ajax로 해당페이지를 부른다.
	@RequestMapping("main/sideList.do")
	public String sideList(HttpServletRequest req) {
		
		return "../maemool/sideList.jsp";
	}
	
	// 테스트를 위한 메소드
	@RequestMapping("main/testSideList.do")
	public String testSideList(HttpServletRequest req) throws Exception {
		// 본 메소드는 ajax를 통해서 한글로 전송받기때문에
		// utf-8로 받아야 한글이 깨지지 않는다.
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("keyword");// 검색어를 전달받는다.
		
		// 위도와 경도를 전달받는다.
		String swLatlng = req.getParameter("swLatlng");
		String neLatlng = req.getParameter("neLatlng");
		
		// 리스트 출력을 위한 변수
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap();	// 매물번호 : 매물대표이미지
		
		System.out.println("testSideList로 전송된 keyword : " + keyword);
		geoList = PropertyAddrDAO.searchMaemool(keyword);

		// 이미지 출력 부분
		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel 매물번호 : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // 해당 매물번호로 이미지 검색
				// System.out.println(imgList.get(0).getImg());
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // 매물번호 : 이미지 주소
			} catch (Exception e) {
				System.out.println("매물번호 : " +vo.getNum() + " "+ e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // 매물번호 : 이미지 주소
			}
		}
		
		// 위도와 경도가 null이 아닐 경우 실행한다.
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
		// id는 session에 저장되어있다.
		HttpSession session = req.getSession();
		Map map = new HashMap();
		String id = (String) session.getAttribute("id");
		int num = (int) req.getAttribute("num");
		
		// 찜 활성화의 parameterType이 map이므로 map에 넣어준다.
		map.put("id", id);
		map.put("num", num);
		
		// 찜 활성화 실행.
		JjimDAO.jjimActive(map);
		
		return "main.jsp";
	}
	@RequestMapping("main/like.do")
	public String like(HttpServletRequest req) {
		String nums = "";
		Cookie[] cookies = req.getCookies();
		System.out.println("현재 저장된 관심목록 갯수 : " + cookies.length);
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
