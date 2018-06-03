package com.gabang.model;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import java.util.Date;
import java.util.Enumeration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.gabang.vo.JjimVO;
import com.gabang.vo.MaemoolDAO;
import com.gabang.vo.MaemoolVO;
import com.gabang.vo.MapDAO;
import com.gabang.vo.MapVO;
import com.gabang.vo.MemberDAO;
import com.gabang.vo.PropertyAddrDAO;
import com.gabang.vo.PropertyAddrVO;
import com.gabang.vo.RoomTypeVO;
import com.gabang.vo.SellerVO;

@Controller
public class MaemoolModel {
	@RequestMapping("main/maemool_theme_list.do")
	public String maemoolThemeList(HttpServletRequest req, HttpServletResponse response) throws Exception {
		System.out.println("maemool_theme_list.do start");
		req.setCharacterEncoding("euc-kr");
		String keyword = req.getParameter("keyword");
		System.out.println(keyword);
		// theme = theme.trim();
		List<MapVO> geoList = null;
		List<MapVO> tempList = null;

		String page = req.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		System.out.println("curpage:"+curpage);
		int totalpage = 0;
		int rowSize = 30;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		//System.out.println("start:"+start+", end:"+end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 데이터 추가
		if (keyword.equals("저보증금")) {
			geoList = MaemoolDAO.getDepositInfo();
			tempList = new ArrayList<MapVO>();
			// System.out.println("갯수:"+tempList.size());
			for (MapVO vo : geoList) {
				if (vo.getDeposit().contains("전") || vo.getDeposit().contains("억"))
					continue;
				String str = vo.getDeposit();
				str = str.replaceAll("[^0-9]+", "").trim();
				int num = Integer.parseInt(str);
				if (num > 500)
					continue;
				tempList.add(vo);
			}
			totalpage = (int)Math.ceil(tempList.size()/30);
			System.out.println("start:"+start+", end:"+end);
			System.out.println("totalpage:"+totalpage);
			geoList.clear();
			for(int i = start ; i <= end; i++)
				geoList.add(tempList.get(i));			
		}

		else if (keyword.equals("주차 가능")) {
			geoList = MaemoolDAO.getParkingInfo(map);
			totalpage = MaemoolDAO.parkingTotalPage();
		}			

		else if (keyword.equals("원룸"))
			geoList = MaemoolDAO.getOneRoomInfo();

		else if (keyword.equals("오피스텔"))
			geoList = MaemoolDAO.getOfficetelInfo();

		List<ImgVO> imgList = null;
		Map<Integer, Object> oneImg = new HashMap<Integer, Object>();

		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel 매물번호 : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // 해당 매물번호로 이미지 검색
				// System.out.println("img1");
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // 매물번호 : 이미지 주소
				// System.out.println("img2");

			} catch (Exception e) {
				System.out.println("매물번호 : " + vo.getNum() + " " + e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // 매물번호 : 이미지 주소
			}
		}
		//
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		// //req.setAttribute("main_jsp", "../maemool/list.jsp");
		req.setAttribute("main_jsp", "../maemool/testList.jsp");
		System.out.println("maemool_theme_list.do end--------------------");
		return "main.jsp";
	}

	@RequestMapping("main/maemool_detail.do")
	public String maemoolDetail(HttpServletRequest request, HttpServletResponse res) throws Exception {
		request.setCharacterEncoding("euc-kr");

		String num = request.getParameter("num"); // 이미지랑 이미지에 해당하는 상세정보를 매물번호에 맞게 출력
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String addr = request.getParameter("addr");
		if (num == null)
			num = "7";

		MaemoolVO vo1 = new MaemoolVO();

		List<ImgVO> imgList = MaemoolDAO.detailMaemool(Integer.parseInt(num));
		MaemoolVO vo = MaemoolDAO.infoMaemool(Integer.parseInt(num));
		String email = MemberDAO.sellerEmail(Integer.parseInt(num));
		SellerVO seller = MemberDAO.sellerData(email);

		//deal_type 데이터 가져오기
		DealTypeVO dealvo=MaemoolDAO.getDealType(Integer.parseInt(num));
		String deal_type="";
		if(dealvo.getType()==0)
		{
			deal_type="전세";
		}
		else
		{
			deal_type="월세";
		}
		
		//room_type 데이터 가져오기
		RoomTypeVO roomvo=MaemoolDAO.getRoomType(Integer.parseInt(num));
		String room_type="";
		if(roomvo.getType()==0)
		{
			room_type="원룸";
		}
		else if(roomvo.getType()==1)
		{
			room_type="투룸";	
		}
		else if(roomvo.getType()==2)
		{
			room_type="복층형";	
		}
		else if(roomvo.getType()==3)
		{
			room_type="분리형원룸";	
		}
		else
		{
			room_type="쓰리룸+";	
		}
		
		//찜 되어 있는 매물 확인하기
		HttpSession session = request.getSession();

		// 찜에 필요한 데이터 (id하고 매물번호)
		String member = (String) session.getAttribute("id");
		JjimVO jjim=null;
		if(member!=null)
		{
			Map map = new HashMap();
	
			map.put("email", member);
			map.put("num", num);
			
			jjim=JjimDAO.checkJjim(map);
			System.out.println("jjimCheck:"+vo.getNum());
		};
		
		request.setAttribute("jjim", jjim);
		request.setAttribute("num", num);
		request.setAttribute("addr", addr);
		request.setAttribute("deal_type", deal_type);
		request.setAttribute("room_type", room_type);
		request.setAttribute("x", x);
		request.setAttribute("y", y);
		request.setAttribute("imgList", imgList);
		request.setAttribute("seller", seller);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../maemool/maemool_detail.jsp");

		return "main.jsp";
	}

	@RequestMapping("main/upload.do")
	public String maemoolInsert(HttpServletRequest request, HttpServletResponse res) throws IOException {

		request.setCharacterEncoding("EUC-KR");

		MaemoolVO vo1 = new MaemoolVO();
		BuildingTypeVO vo2 = new BuildingTypeVO();
		DealTypeVO vo3 = new DealTypeVO();
		PropertyAddrVO vo4 = new PropertyAddrVO();
		RoomTypeVO vo5 = new RoomTypeVO();

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("id");
		int maemoolNum = MaemoolDAO.maemoolNum() + 1;

		// fileItem.getString("EUC_KR");
		

		String option = "";
		Map map = new HashMap();
		List<String> list = new ArrayList<String>();

		// img테이블에 필요한 데이터 저장
		// 매물 이미지 정보 받아오는 라이브러리
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
			upload.setHeaderEncoding("EUC_KR");
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
						String fieldValue = item.getString("EUC_KR");
						System.out.println(fieldName);
						System.out.println(fieldValue);
						if (!(fieldName.equals("opt"))) {
							map.put(fieldName, fieldValue);
						} else {
							option = option + fieldValue + ", ";
						}

						// ... (do your job here)
					} else {
						// Process form file field (input type="file").
						String fieldName = item.getFieldName();
						String fileName = item.getName();
						// session.getAttribute("email")+"//"+item.getName();
						// System.out.println("fieldName:" + fieldName + ", fileName:" + fileName);
						InputStream fileContent = item.getInputStream();
						BufferedImage image = ImageIO.read(fileContent);
						ImageIO.write(image, "jpg", new File(PATH + "/" + fileName));

						list.add(fileName);

					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// property_Addr에 필요한 데이터 저장
		String addr = map.get("address") + " " + map.get("detailAddress");
		String x_position = (String) map.get("x_position");
		String y_position = (String) map.get("y_position");
		vo4.setAddr(addr);
		vo4.setX_position(x_position);
		vo4.setY_position(y_position);
		vo4.setNum(maemoolNum);

		System.out.println(addr);
		System.out.println(x_position);
		System.out.println(y_position);
		System.out.println(maemoolNum);

		// deal_type테이블에 필요한 데이터
		// 거래 형태
		String deal_type = (String) map.get("deal_type");
		vo3.setType(Integer.parseInt(deal_type));
		vo3.setNum(maemoolNum);
		System.out.println(deal_type);

		// room_type에 필요한 데이터
		// 방구조
		String room_type = (String) map.get("room_type");
		vo5.setType(Integer.parseInt(room_type));
		vo5.setNum(maemoolNum);
		System.out.println(room_type);

		// building_type에 필요한 데이터
		// 건물형태
		String building_type = (String) map.get("building_type");
		vo2.setType(Integer.parseInt(building_type));
		vo2.setNum(maemoolNum);
		System.out.println(building_type);

		// maemool테이블에 필요한 데이터
		vo1.setNum(maemoolNum);
		vo1.setEmail(email);

		// 관리비
		String manage_fee = (String) map.get("manage_fee");
		if (manage_fee != null) {
			manage_fee = manage_fee + "만원";
		}
		vo1.setManage_fee(manage_fee);
		System.out.println(manage_fee);

		// 관리비 포함항목
		// option=(String) map.get("option");
		option = option.substring(0, option.lastIndexOf(","));
		vo1.setOpt(option);
		System.out.println(option);

		// 엘리베이터 유무
		String elev = (String) map.get("elev");
		vo1.setElev(Integer.parseInt(elev));
		System.out.println(elev);

		// 주차공간 유무
		String parking_lot = (String) map.get("parking_lot");
		vo1.setParking_lot(Integer.parseInt(parking_lot));
		System.out.println(parking_lot);

		// 해당층
		String floor1 = (String) map.get("floor1") + "층";

		// 전체층
		String floor2 = (String) map.get("floor2") + "층";
		String floor = floor1 + "/" + floor2;
		vo1.setFloor(floor);
		System.out.println(floor);

		// 월세
		String monthly_rent = (String) map.get("monthly_rent");
		vo1.setMonthly_rent(monthly_rent + "만원");
		System.out.println("monthly_rent:" + monthly_rent);

		// 보증금
		String deposit1 = (String) map.get("deposit1");
		if (deposit1 != null) {
			deposit1 = deposit1 + "억";
		}
		String deposit2 = (String) map.get("deposit2");
		if (deposit2 != null) {
			deposit2 = deposit2 + "만원";
		}

		String deposit = deposit1 + deposit2;

		if (monthly_rent.trim() == null) {
			deposit = deposit + " (전세가능)";
		}
		vo1.setDeposit(deposit);
		System.out.println(deposit);

		// 전용면적
		String gross_area = (String) map.get("gross_area") + "㎡";
		vo1.setGross_area(gross_area);
		System.out.println(gross_area);

		// 입주가능일
		String moving_date = (String) map.get("moving_date");
		vo1.setMoving_date(moving_date);
		System.out.println(moving_date);

		// 매물 한줄 표현
		String detail_title = (String) map.get("detail_title");
		vo1.setDetail_title(detail_title);
		System.out.println(detail_title);

		// 인근 지하철 표시
		String near_subway = (String) map.get("near_subway");
		vo1.setNear_subway(near_subway);
		System.out.println(near_subway);

		// 매물 상세설명
		String description = (String) map.get("description");
		vo1.setDescription(description);
		System.out.println(description);

		MaemoolDAO.insertMaemool(vo1, vo2, vo3, vo4, vo5);
		String realPath="C:\\\\webDev\\\\webStudy\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp1\\\\wtpwebapps\\\\GaBang\\\\upload\\\\";
		// 이미지 저장
		ImgVO vo = new ImgVO();
		for (String fileName : list) {

			File f = new File(PATH + "\\" + fileName);
			File file = new File(realPath + email + "-" + fileName);
			f.renameTo(file);
			vo.setImg("../upload/"+file.getName());
			vo.setNum(maemoolNum);
			vo.getImg();
			vo.getNum();
			MaemoolDAO.insertImage(vo);
		}
		
		request.setAttribute("num", maemoolNum);
		request.setAttribute("x", x_position);
		request.setAttribute("y", y_position);
		request.setAttribute("main_jsp", "../main/complete.jsp");
		return "main.jsp";
	}

	
	// home.jsp에서 검색할 경우 작동 by.한
	@RequestMapping("main/maemool_search.do")
	public String maemoolSearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("euc-kr");
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap(); // 매물번호 : 매물대표이미지
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
				System.out.println("매물번호 : " + vo.getNum() + " " + e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // 이미지 없는 매물의 경우 처리
			}
		}

		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		// 공식 페이지
		// req.setAttribute("main_jsp", "../maemool/list.jsp");

		// 테스트 페이지
		req.setAttribute("main_jsp", "../maemool/testList.jsp");

		return "main.jsp";
	}

	// 지도 옆 매물 목록을 출력 by. 한
	// ajax로 해당페이지를 부른다.
	@RequestMapping("main/sideList.do")
	public String sideList(HttpServletRequest req, HttpServletResponse response) throws Exception {
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
	public String testSideList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("testSideList.do start-----------------");
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("keyword");
		System.out.println("testSideList.do로 전달받은 키워드" + keyword);
		// 지도 영역 각 모서리의 위도와 경도를 전달받는다.
		String Sne_x = req.getParameter("ne_x");
		String Sne_y = req.getParameter("ne_y");
		String Ssw_x = req.getParameter("sw_x");
		String Ssw_y = req.getParameter("sw_y");

		// 아래 코드는 제대로 값 받았나 확인용
		/*
		 * System.out.println("Sne_x : " + Sne_x); System.out.println("Sne_y : " +
		 * Sne_y); System.out.println("Ssw_x : " + Ssw_x); System.out.println("Ssw_y : "
		 * + Ssw_y);
		 */

		// 위도경도를 저장하기 위한 map
		Map<String, Object> bound = null;

		// 리스트 출력을 위한 변수
		List<MapVO> geoList = null;
		List<MapVO> tempList = null;
		List<ImgVO> imgList = null;
		// 매물번호 : 매물대표이미지
		Map<Object,String> oneImg = new HashMap<Object,String>();
		
		String page = req.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		System.out.println("curpage:"+curpage);
		int totalpage = 0;
		int rowSize = 30;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 관심목록 by.한솔
		String num = req.getParameter("num");

		if (num != null) {
			// num = "";
			Cookie cookie = new Cookie("likeNum", num);
			cookie.setMaxAge(365 * 24 * 60 * 60); // 쿠기 유효기간 365일 설정1
			cookie.setPath("C:\\GaBang\\gb");
			res.addCookie(cookie);
		}

		// list.jsp에서 전송받은 지도 bound 확인
		if (keyword != null) {
			System.out.println("◈ testSideList로 전송된 keyword : " + keyword);

			/*
			 * by t. 2018.05.30 테마 검색
			 */

			if (keyword.equals("저보증금")) {
				geoList = MaemoolDAO.getDepositInfo();
				tempList = new ArrayList<MapVO>();
				// System.out.println("갯수:"+tempList.size());
				for (MapVO vo : geoList) {
					if (vo.getDeposit().contains("전") || vo.getDeposit().contains("억"))
						continue;
					String str = vo.getDeposit();
					str = str.replaceAll("[^0-9]+", "").trim();
					int number = Integer.parseInt(str);
					if (number > 500)
						continue;
					tempList.add(vo);
				}				
				totalpage = (int)Math.ceil(tempList.size()/30);
				System.out.println("totalpage:"+totalpage);
				System.out.println("start:"+start+", end:"+end);				
				geoList.clear();
				for(int i = start ; i <= end; i++)
					geoList.add(tempList.get(i));
				System.out.println("testSideList.do end--------------------");
			} else if (keyword.equals("주차 가능")) {
				geoList = MaemoolDAO.getParkingInfo(map);
				totalpage = MaemoolDAO.parkingTotalPage();
			}				

			else if (keyword.equals("원룸"))
				geoList = MaemoolDAO.getOneRoomInfo();

			else if (keyword.equals("오피스텔"))
				geoList = MaemoolDAO.getOfficetelInfo();
			else
				geoList = PropertyAddrDAO.searchMaemool(keyword);

			// 지도 움직일 경우 해당 지도 내 매물 출력
			// 위도경도가 null이 아닐 경우
		} else if ((Sne_x != null) && (Sne_y != null) && (Ssw_x != null) && (Ssw_y != null)) {
			// 지도 북동끝점 위경도
			double ne_x = Double.parseDouble(Sne_x);
			double ne_y = Double.parseDouble(Sne_y);
			// 지도 남서끝점 위경도
			double sw_x = Double.parseDouble(Ssw_x);
			double sw_y = Double.parseDouble(Ssw_y);

			/*System.out.println("◈ testSideList로 전송됨\nne_x : " + ne_x + " ne_y : " + ne_y);
			System.out.println("sw_x : " + sw_x + " sw_y : " + sw_y);*/
			// 받은 모서리 위경도를 맵에 저장
			// bound = new HashMap<String, Double>();
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
				System.out.println("매물번호 : " + vo.getNum() + " " + e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // 매물번호 : 이미지 주소
			}
		}
		
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		req.setAttribute("keyword", keyword);

		return "../maemool/testSideList.jsp";
	}

	/* by.준영 */
	@RequestMapping("main/add_jjim.do")
	public void real_jjim(HttpServletRequest req, HttpServletResponse res) {
		// id는 session에 저장되어있다.
		HttpSession session = req.getSession();

		// 찜에 필요한 데이터 (id하고 매물번호)
		String email = (String) session.getAttribute("id");
		String num = req.getParameter("maemool_num");

		JjimVO vo = new JjimVO();

		vo.setEmail(email);
		vo.setNum(Integer.parseInt(num));
		vo.setRegdate(new Date());

		System.out.println(email);
		System.out.println(num);

		JjimDAO.insertJjim(vo);
		System.out.println("dao 완료");

		
	}

	/* by.준영 */
	@RequestMapping("main/remove_jjim.do")
	public void remove_jjim(HttpServletRequest req, HttpServletResponse res) {
		// id는 session에 저장되어있다.
		HttpSession session = req.getSession();

		// 찜에 필요한 데이터 (id하고 매물번호)
		String email = (String) session.getAttribute("id");
		String num = req.getParameter("maemool_num");

		Map map = new HashMap();

		map.put("email", email);
		map.put("num", num);
		System.out.println(map.get("email"));
		System.out.println(map.get("num"));

		JjimDAO.removeJjim(map);

		
	}
	
	/* by.준영 */
	@RequestMapping("main/jjimlist_delete.do")
	public String delete_jjimList(HttpServletRequest req, HttpServletResponse res) {
		// id는 session에 저장되어있다.
		HttpSession session = req.getSession();

		// 찜에 필요한 데이터 (id하고 매물번호)
		String email = (String) session.getAttribute("id");
		String num = req.getParameter("num");

		Map map = new HashMap();

		map.put("email", email);
		map.put("num", num);
		System.out.println(map.get("email"));
		System.out.println(map.get("num"));

		JjimDAO.removeJjim(map);

		return "redirect:../main/jjim_list.do";
	}

	@RequestMapping("main/jjim_list.do")
	public String jjim_detail(HttpServletRequest req, HttpServletResponse res) {
		// id는 session에 저장되어있다.
		HttpSession session = req.getSession();

		// 찜에 필요한 데이터 (id하고 매물번호)
		String email = (String) session.getAttribute("id");
		String num = req.getParameter("maemool_num");
		
		Map map = new HashMap();
		map.put("email", email);
		//매물번호
		List<JjimVO> list=JjimDAO.jjimList(map);
		//1.디비 찜 테이블에서 해당 이메일이 갖고 있는 찜 매물 번호를 가져온다.

		//매물 정보
		List<MaemoolVO> maemoolInfo=null;
		List<JjimVO> jjimProperty=null;
		List<MapVO> jjimDetail=new ArrayList<MapVO>();
		System.out.println("여기까진 뜰거아냐");
		//2.해당 매물 번호에 대한 필요한 데이터를 디비 map뷰에서 가져온다.
		for(JjimVO vo:list)
		{
			//maemoolInfo.add(MaemoolDAO.infoMaemool(vo.getNum()));
			Map map1=new HashMap();
			map1.put("num", vo.getNum());
			MapVO vo1=JjimDAO.jjimDetail(map1);
			jjimDetail.add(vo1);
			
		}
		//3.jjim.jsp에 map뷰에서 가져온 데이터를 list 타입으로 넘겨준다.
		req.setAttribute("list", jjimDetail);
		req.setAttribute("main_jsp", "../maemool/jjim.jsp");
		return "main.jsp";
	}
	
	// by. 한솔
	   @RequestMapping("main/like.do")
	   public String like(HttpServletRequest request, HttpServletResponse response) {
	      String nums = "";
	      List<MapVO> list = new ArrayList<MapVO>();
	      MapVO vo = null;
	      MaemoolDAO dao = null;
	      int num = 0;
	      Cookie[] cookies = request.getCookies();
	      //System.out.println("현재 저장된 관심목록 갯수 : " + cookies.length);
	   
	      if(cookies!=null) {
	         for(int i=0; i<cookies.length; i++) {
	            Cookie c = cookies[i];
	            String cName = c.getName();
	           // System.out.println(cName);
	            
	            if (cName.startsWith("cookNo")) {
	            nums=c.getValue();
	            //System.out.println(nums);
	            dao = new MaemoolDAO();
	            num = Integer.parseInt(nums);
	            vo = dao.cookie(num);
	            list.add(vo);
	            
	            }
	         }
	      }
	      request.setAttribute("list", list);
	      request.setAttribute("main_jsp", "../like/like.jsp");
	      return "main.jsp";
	   }
	   
	   // by. 한솔
	   @RequestMapping("main/like_add.do")
	   public String LikeAdd(HttpServletRequest request, HttpServletResponse response) {
	/*      // 관심목록 by.한솔
	      String num = request.getParameter("num");
	      System.out.println(num);
	      Cookie c = new Cookie("cookNo", num);
	      c.setMaxAge(0);
	      // cookie.setPath("C:\\GaBang\\gb"); //쿠키의 범위 설정
	      response.addCookie(c); // 쿠키를 저장
	      System.out.println(c);*/
	      
	      
	      String no = request.getParameter("num");
	      System.out.println("파라미터 num : " + no);
	      Cookie[] cookies = request.getCookies();
	      String name = "";
	      String ss = "";
	      int num = Integer.parseInt(no);

	      if (cookies != null) {
	         System.out.println("쿠키 갯수 : " + cookies.length);
	         
	         for (int i = 0; i < cookies.length; i++) {
	            
	            Cookie c = cookies[i];
	            String cName = c.getName();
	            /*System.out.println("cookies["+i+"] 이름 확인 : " + cookies[i].getName());
	            System.out.println("cookies["+i+"] 값 확인 : " + cookies[i].getValue());
	            System.out.println("cookies["+i+"] 시간 확인 : " + cookies[i].getMaxAge());*/
	            
	            if (cName.startsWith("cookNo")) {
	               String cValue = c.getValue();
	               ss = cName.replaceAll("[^0-9]", "");
	              // System.out.println("cName.startsWith(\"cookNo\") ss = " + ss);
	            } else {
	               name = "cookNo"+ no;
	               ss = "0";
	            }
	         }
	         
	        
	         int a = Integer.parseInt(ss);
	         //System.out.println("ss=" + ss);
	       
	         name ="cookNo"+no;
	      }
	      // 쿠키가 null일 경우
	      else {
	         name = "cookNo"+ num;
	      }
	      Cookie c = new Cookie(name, no);
	      c.setMaxAge(60 * 60 * 24); // 쿠키 최대 유지시간 설정
	      response.addCookie(c);
	      
	      
	      return "../like/like.jsp";

	   }
	   
	   @RequestMapping("main/like_delete.do")
	   public String LikeDelete(HttpServletRequest request, HttpServletResponse response) {
		   
	      String no = request.getParameter("num");
	      Cookie[] cookies = request.getCookies();
	      //System.out.println(no);
	      if(cookies!=null) {
	         for(int i = 0; i<cookies.length; i++) {
	            Cookie c = cookies[i]; 
	            String cName = c.getName();
	            
	            //쿠키 이름이 cookNo로 시작
	            if (cName.equals("cookNo" + no)) {
	               c.setMaxAge(0);
	               //System.out.println("쿠키 유지시간 : " + c.getMaxAge());
	               response.addCookie(c);
	            }
	         }
	      }
	/*      System.out.println("쿠키 갯수 : " + cookies.length);
	      for (Cookie c : cookies) {
	         System.out.println("★쿠키 이름 : " + c.getName());
	         System.out.println("쿠키 값 : " + c.getValue());
	         System.out.println("쿠키 유지시간 :" + c.getMaxAge());
	      }*/
	      
	      //request.setAttribute("main_jsp", "../like/like.do");
	      return "redirect:../main/like.do";
	   }
	}