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
import com.gabang.vo.BuildingTypeVO;
import com.gabang.vo.DealTypeVO;
import com.gabang.vo.ImgVO;
import com.gabang.vo.JjimDAO;
import com.gabang.vo.MaemoolDAO;
import com.gabang.vo.MaemoolVO;
import com.gabang.vo.MapVO;
import com.gabang.vo.PropertyAddrDAO;
import com.gabang.vo.PropertyAddrVO;
import com.gabang.vo.RoomTypeVO;
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

		
		BuildingTypeVO vo=new BuildingTypeVO();
		DealTypeVO vo1=new DealTypeVO();
		ImgVO vo2=new ImgVO();
		MaemoolVO vo3=new MaemoolVO();
		PropertyAddrVO vo4=new PropertyAddrVO();
		RoomTypeVO vo5=new RoomTypeVO();
		
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
		int maemoolNum=MaemoolDAO.maemoolNum();


		String path="c:\\download";
		int size=1024*1024*100;
		String enctype="EUC-KR";

		
		vo3.setNum(maemoolNum);
		vo3.setEmail(email);
		
		String addr=request.getParameter("address")+" "+request.getParameter("datailAddress");
		String x_position=request.getParameter("x_position");
		String y_position=request.getParameter("y_position");
		vo4.setAddr(addr);
		vo4.setX_position(x_position);
		vo4.setY_position(y_position);
		vo4.setNum(maemoolNum);
		
		//매물 이미지 정보 받아오는 라이브러리
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
								//session.getAttribute("email")+"//"+item.getName();
						//System.out.println("fieldName:" + fieldName + ", fileName:" + fileName);
						InputStream fileContent = item.getInputStream();
						BufferedImage image = ImageIO.read(fileContent);
						ImageIO.write(image, "jpg", new File(TEMP_PATH + "/" + fileName));
						
						File f=new File(path+"\\"+fileName);
						File file=new File(path+"\\"+email+"-"+fileName);
						f.renameTo(file);
						
						System.out.println(file.getName());
						vo2.setImg(file.getName());
						vo2.setNum(maemoolNum);
						
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//거래 형태
		String deal_type=request.getParameter("deal_type");
		vo1.setType("deal_type");
		vo1.setNum(maemoolNum);
		
		//방구조
		String room_type=request.getParameter("room_type");
		vo5.setType(Integer.parseInt(room_type));
		vo5.setNum(maemoolNum);
		
		//건물형태
		String building_type=request.getParameter("building_type");
		vo.setType(Integer.parseInt(building_type));
		vo.setNum(maemoolNum);
		
		//관리비
		String manage_fee=request.getParameter("manage_fee");
		if(manage_fee!=null)
		{
			manage_fee=manage_fee+" 만원";
		}
		vo3.setManage_fee(manage_fee);
		
		//관리비 포함항목
		String[] opt=request.getParameterValues("opt");
		String option="";
		for(String opt1:opt)
		{
			option=opt+", ";
		}
		option=option.substring(0,option.lastIndexOf(",")-1);
		vo3.setOpt(option);
		
		//엘리베이터 유무
		String elev=request.getParameter("elev");
		vo3.setElev(Integer.parseInt(elev));
		
		//주차공간 유무
		String parking_lot=request.getParameter("parking_lot");
		
		//해당층
		String floor1=request.getParameter("floor1");
		//전체층
		String floor2=request.getParameter("floor2")+"층";
		if((floor1.startsWith("지")||floor1.startsWith("반")));
		{
			floor1=floor1+"층";
		}
		String floor=floor1+"//"+floor2;
		vo3.setFloor(floor);
		
		//보증금
		String deposit1=request.getParameter("deposit1");
		String deposit2=request.getParameter("deposit2");
		String deposit=deposit1+" 억"+deposit2+" 만원";
		vo3.setDeposit(deposit);
		
		//월세
		String monthly_rent1=request.getParameter("monthly_rent1");
		if(monthly_rent1!=null)
			{
			monthly_rent1=monthly_rent1 + " 억";
			}
		String monthly_rent2=request.getParameter("monthly_rent2");
		String monthly_rent=monthly_rent1+monthly_rent2+" 만원";
		vo3.setMonthly_rent(monthly_rent);
		
		//전용면적
		String gross_area=request.getParameter("gorss_area");
		int pyeong=(int) Math.round(((Integer.parseInt(gross_area)/3.3)*10)/10);
		
		gross_area=request.getParameter("gorss_area")+"㎡"+" ("+pyeong+"P)";
		vo3.setGross_area(gross_area);
		
		//입주가능일
		String moving_date=request.getParameter("moving_date");
		vo3.setMoving_date(moving_date);
		
		//매물 한줄 표현
		String detail_title=request.getParameter("detail_title");
		vo3.setDetail_title(detail_title);
		//매물 상세설명
		String description=request.getParameter("description");
		vo3.setDescription(description);
		
		
		MaemoolDAO.insertMaemool(vo, vo1, vo2, vo3, vo4, vo5);
		
		
		
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
		//req.setAttribute("main_jsp", "../maemool/list.jsp");

		// 테스트 페이지로 이동하게끔
		req.setAttribute("main_jsp", "../maemool/testList.jsp");

		return "main.jsp";
	}
	
	// ajax로 해당페이지를 부른다.
	@RequestMapping("main/sideList.do")
	public String sideList(HttpServletRequest req) throws Exception {
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
		Map oneImg = new HashMap(); // 매물번호 : 매물대표이미지

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
				System.out.println("매물번호 : " + vo.getNum() + " " + e.getMessage());
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
		String ne_x = req.getParameter("ne_x");
		String ne_y = req.getParameter("ne_y");
		String sw_x = req.getParameter("sw_x");
		String sw_y = req.getParameter("sw_y");
		
		// 리스트 출력을 위한 변수
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		// 매물번호 : 매물대표이미지
		Map oneImg = new HashMap();
		
		if(keyword != null) {
			System.out.println("testSideList로 전송된 keyword : " + keyword);
			geoList = PropertyAddrDAO.searchMaemool(keyword);
		} else if(ne_x != null && ne_y != null && sw_x != null && sw_y != null){
			System.out.println("testSideList로 전송됨\n" + ne_x + " " + ne_y + "\n" + sw_x + " " + sw_y);
			
		}

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
