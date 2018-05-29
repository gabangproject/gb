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
import com.gabang.vo.MapDAO;
import com.gabang.vo.MapVO;
import com.gabang.vo.PropertyAddrDAO;
import com.gabang.vo.PropertyAddrVO;
import com.gabang.vo.RoomTypeVO;

@Controller
public class MaemoolModel {
	@RequestMapping("main/maemool_theme_list.do")
	public String maemoolThemeList(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("euc-kr");
		String theme = req.getParameter("theme");
		System.out.println(theme);
		//theme = theme.trim();		
		List<MapVO> geoList = new ArrayList<MapVO>();
		List<MapVO> tempList = null;
		
		if(theme.equals("저보증금")) {						
			tempList = MaemoolDAO.getDepositInfo();
			System.out.println("갯수:"+tempList.size());
			for(MapVO vo:tempList) {
				if(vo.getDeposit().contains("전") || vo.getDeposit().contains("억")) continue;
				String str = vo.getDeposit();				
				str = str.replaceAll("[^0-9]+","").trim();
				int num = Integer.parseInt(str);
				if(num > 500) continue;				
				geoList.add(vo);
			}
//			for(MapVO vo:geoList)
//				System.out.println(vo.getDeposit());
		}
//			
//		else if(theme.equals("주차 가능")) {
//			tempList = MaemoolDAO.getParkingInfo(theme);
//		}
//			
//		else if(theme.equals("원룸")) {
//			tempList = MaemoolDAO.getOneRoomInfo(theme);
//		}
//			
//		else if(theme.equals("오피스텔")) {
//			tempList = MaemoolDAO.getOfficetelInfo(theme);
//		}			
		
		List<ImgVO> imgList = null;
		Map<Integer,Object> oneImg = new HashMap<Integer,Object>();

		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel 매물번호 : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // 해당 매물번호로 이미지 검색
				//System.out.println("img1");
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // 매물번호 : 이미지 주소
				//System.out.println("img2");
				
			} catch (Exception e) {
				System.out.println("매물번호 : " +vo.getNum() + " "+ e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // 매물번호 : 이미지 주소
			}
		}
		
//		// 관심목록 by.한솔
//		String num = req.getParameter("num");
//		if (num == null) {
//			num = "";
//		}
//		Cookie cookie = new Cookie("likeNum", num);
//		cookie.setMaxAge(365 * 24 * 60 * 60); // 쿠기 유효기간 365일 설정1
//		cookie.setPath("C:\\GaBang\\gb");
//		response.addCookie(cookie);

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
		System.out.println(vo.getDeposit());
		
		request.setAttribute("imgList", imgList);
		request.setAttribute("vo", vo);
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
		String email=(String) session.getAttribute("id");
		int maemoolNum=MaemoolDAO.maemoolNum();
		
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
		final String PATH = "c:\\download";
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
						ImageIO.write(image, "jpg", new File(PATH + "/" + fileName));
						
						File f=new File(PATH+"\\"+fileName);
						File file=new File(PATH+"\\"+email+"-"+fileName);
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

	// home.jsp에서 검색할 경우 작동 by.한
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
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // 이미지 없는 매물의 경우 처리
			}
		}

		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		// 공식 페이지
		//req.setAttribute("main_jsp", "../maemool/list.jsp");

		// 테스트 페이지
		req.setAttribute("main_jsp", "../maemool/testList.jsp");

		return "main.jsp";
	}
	
	// 지도 옆 매물 목록을 출력 by. 한
	// ajax로 해당페이지를 부른다.
	@RequestMapping("main/sideList.do")
	public String sideList(HttpServletRequest req) throws Exception {
		// 본 메소드는 ajax를 통해서 한글을 파라미터로 전송받기 때문에
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
	
	// 테스트를 위한 메소드 by. 한
	// ajax로 지도 이동에 따라 보여지는 영역에 알맞는 매물을 부르도록 테스트 중
	@RequestMapping("main/testSideList.do")
	public String testSideList(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("keyword");
		
		// 지도 영역 각 모서리의 위도와 경도를 전달받는다.
		String Sne_x = req.getParameter("ne_x");
		String Sne_y = req.getParameter("ne_y");
		String Ssw_x = req.getParameter("sw_x");
		String Ssw_y = req.getParameter("sw_y");
		
		// 아래 코드는 제대로 값 받았나 확인용
		/*
		System.out.println("Sne_x : " + Sne_x);
		System.out.println("Sne_y : " + Sne_y);
		System.out.println("Ssw_x : " + Ssw_x);
		System.out.println("Ssw_y : " + Ssw_y);
		*/

		// 위도경도를 저장하기 위한 map
		//Map<String, Double> bound = null;
		Map<String, Object> bound = null;
		
		// 리스트 출력을 위한 변수
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		// 매물번호 : 매물대표이미지
		Map oneImg = new HashMap();
		
		// list.jsp에서 전송받은 지도 bound 확인
		if(keyword != null) {
			System.out.println("◈ testSideList로 전송된 keyword : " + keyword);
			geoList = PropertyAddrDAO.searchMaemool(keyword);
		
			// 지도 움직일 경우 해당 지도 내 매물 출력
			// 위도경도가 null이 아닐 경우
		} else if((Sne_x != null) && (Sne_y != null) && (Ssw_x != null) && (Ssw_y != null)){
			// 지도 북동끝점 위경도
			double ne_x = Double.parseDouble(Sne_x);
			double ne_y = Double.parseDouble(Sne_y);
			// 지도 남서끝점 위경도
			double sw_x = Double.parseDouble(Ssw_x);
			double sw_y = Double.parseDouble(Ssw_y);
			
			System.out.println("◈ testSideList로 전송됨\nne_x : " + ne_x + " ne_y : " + ne_y);
			System.out.println("sw_x : " + sw_x + " sw_y : " + sw_y);
			// 받은 모서리 위경도를 맵에 저장
			//bound = new HashMap<String, Double>();
			bound = new HashMap<String, Object>();
			bound.put("sw_x", sw_x);
			bound.put("sw_y", sw_y);
			bound.put("ne_x", ne_x);
			bound.put("ne_y", ne_y);
			
			try {
				geoList = MapDAO.findMaemoolInBound(bound);
			} catch (Exception e) {
				System.out.println("geoList = MapDAO.findMaemoolInBound(bound) : " + e.getMessage());
			}
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

		req.setAttribute("main_jsp", "../like/like.jsp");
		return "main.jsp";
	}
}
