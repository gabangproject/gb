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

		// ������ �߰�
		if (keyword.equals("��������")) {
			geoList = MaemoolDAO.getDepositInfo();
			tempList = new ArrayList<MapVO>();
			// System.out.println("����:"+tempList.size());
			for (MapVO vo : geoList) {
				if (vo.getDeposit().contains("��") || vo.getDeposit().contains("��"))
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

		else if (keyword.equals("���� ����")) {
			geoList = MaemoolDAO.getParkingInfo(map);
			totalpage = MaemoolDAO.parkingTotalPage();
		}			

		else if (keyword.equals("����"))
			geoList = MaemoolDAO.getOneRoomInfo();

		else if (keyword.equals("���ǽ���"))
			geoList = MaemoolDAO.getOfficetelInfo();

		List<ImgVO> imgList = null;
		Map<Integer, Object> oneImg = new HashMap<Integer, Object>();

		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel �Ź���ȣ : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // �ش� �Ź���ȣ�� �̹��� �˻�
				// System.out.println("img1");
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // �Ź���ȣ : �̹��� �ּ�
				// System.out.println("img2");

			} catch (Exception e) {
				System.out.println("�Ź���ȣ : " + vo.getNum() + " " + e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // �Ź���ȣ : �̹��� �ּ�
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

		String num = request.getParameter("num"); // �̹����� �̹����� �ش��ϴ� �������� �Ź���ȣ�� �°� ���
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

		//deal_type ������ ��������
		DealTypeVO dealvo=MaemoolDAO.getDealType(Integer.parseInt(num));
		String deal_type="";
		if(dealvo.getType()==0)
		{
			deal_type="����";
		}
		else
		{
			deal_type="����";
		}
		
		//room_type ������ ��������
		RoomTypeVO roomvo=MaemoolDAO.getRoomType(Integer.parseInt(num));
		String room_type="";
		if(roomvo.getType()==0)
		{
			room_type="����";
		}
		else if(roomvo.getType()==1)
		{
			room_type="����";	
		}
		else if(roomvo.getType()==2)
		{
			room_type="������";	
		}
		else if(roomvo.getType()==3)
		{
			room_type="�и�������";	
		}
		else
		{
			room_type="������+";	
		}
		
		//�� �Ǿ� �ִ� �Ź� Ȯ���ϱ�
		HttpSession session = request.getSession();

		// �� �ʿ��� ������ (id�ϰ� �Ź���ȣ)
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

		// img���̺� �ʿ��� ������ ����
		// �Ź� �̹��� ���� �޾ƿ��� ���̺귯��
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

		// property_Addr�� �ʿ��� ������ ����
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

		// deal_type���̺� �ʿ��� ������
		// �ŷ� ����
		String deal_type = (String) map.get("deal_type");
		vo3.setType(Integer.parseInt(deal_type));
		vo3.setNum(maemoolNum);
		System.out.println(deal_type);

		// room_type�� �ʿ��� ������
		// �汸��
		String room_type = (String) map.get("room_type");
		vo5.setType(Integer.parseInt(room_type));
		vo5.setNum(maemoolNum);
		System.out.println(room_type);

		// building_type�� �ʿ��� ������
		// �ǹ�����
		String building_type = (String) map.get("building_type");
		vo2.setType(Integer.parseInt(building_type));
		vo2.setNum(maemoolNum);
		System.out.println(building_type);

		// maemool���̺� �ʿ��� ������
		vo1.setNum(maemoolNum);
		vo1.setEmail(email);

		// ������
		String manage_fee = (String) map.get("manage_fee");
		if (manage_fee != null) {
			manage_fee = manage_fee + "����";
		}
		vo1.setManage_fee(manage_fee);
		System.out.println(manage_fee);

		// ������ �����׸�
		// option=(String) map.get("option");
		option = option.substring(0, option.lastIndexOf(","));
		vo1.setOpt(option);
		System.out.println(option);

		// ���������� ����
		String elev = (String) map.get("elev");
		vo1.setElev(Integer.parseInt(elev));
		System.out.println(elev);

		// �������� ����
		String parking_lot = (String) map.get("parking_lot");
		vo1.setParking_lot(Integer.parseInt(parking_lot));
		System.out.println(parking_lot);

		// �ش���
		String floor1 = (String) map.get("floor1") + "��";

		// ��ü��
		String floor2 = (String) map.get("floor2") + "��";
		String floor = floor1 + "/" + floor2;
		vo1.setFloor(floor);
		System.out.println(floor);

		// ����
		String monthly_rent = (String) map.get("monthly_rent");
		vo1.setMonthly_rent(monthly_rent + "����");
		System.out.println("monthly_rent:" + monthly_rent);

		// ������
		String deposit1 = (String) map.get("deposit1");
		if (deposit1 != null) {
			deposit1 = deposit1 + "��";
		}
		String deposit2 = (String) map.get("deposit2");
		if (deposit2 != null) {
			deposit2 = deposit2 + "����";
		}

		String deposit = deposit1 + deposit2;

		if (monthly_rent.trim() == null) {
			deposit = deposit + " (��������)";
		}
		vo1.setDeposit(deposit);
		System.out.println(deposit);

		// �������
		String gross_area = (String) map.get("gross_area") + "��";
		vo1.setGross_area(gross_area);
		System.out.println(gross_area);

		// ���ְ�����
		String moving_date = (String) map.get("moving_date");
		vo1.setMoving_date(moving_date);
		System.out.println(moving_date);

		// �Ź� ���� ǥ��
		String detail_title = (String) map.get("detail_title");
		vo1.setDetail_title(detail_title);
		System.out.println(detail_title);

		// �α� ����ö ǥ��
		String near_subway = (String) map.get("near_subway");
		vo1.setNear_subway(near_subway);
		System.out.println(near_subway);

		// �Ź� �󼼼���
		String description = (String) map.get("description");
		vo1.setDescription(description);
		System.out.println(description);

		MaemoolDAO.insertMaemool(vo1, vo2, vo3, vo4, vo5);
		String realPath="C:\\\\webDev\\\\webStudy\\\\.metadata\\\\.plugins\\\\org.eclipse.wst.server.core\\\\tmp1\\\\wtpwebapps\\\\GaBang\\\\upload\\\\";
		// �̹��� ����
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

	
	// home.jsp���� �˻��� ��� �۵� by.��
	@RequestMapping("main/maemool_search.do")
	public String maemoolSearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("euc-kr");
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap(); // �Ź���ȣ : �Ź���ǥ�̹���
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
				System.out.println("�Ź���ȣ : " + vo.getNum() + " " + e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // �̹��� ���� �Ź��� ��� ó��
			}
		}

		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		// ���� ������
		// req.setAttribute("main_jsp", "../maemool/list.jsp");

		// �׽�Ʈ ������
		req.setAttribute("main_jsp", "../maemool/testList.jsp");

		return "main.jsp";
	}

	// ���� �� �Ź� ����� ��� by. ��
	// ajax�� �ش��������� �θ���.
	@RequestMapping("main/sideList.do")
	public String sideList(HttpServletRequest req, HttpServletResponse response) throws Exception {
		// �� �޼ҵ�� ajax�� ���ؼ� �ѱ��� �Ķ���ͷ� ���۹ޱ� ������
		// utf-8�� �޾ƾ� �ѱ��� ������ �ʴ´�.
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("keyword");// �˻�� ���޹޴´�.

		// ������ �浵�� ���޹޴´�.
		String swLatlng = req.getParameter("swLatlng");
		String neLatlng = req.getParameter("neLatlng");

		// ����Ʈ ����� ���� ����
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap(); // �Ź���ȣ : �Ź���ǥ�̹���

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
				System.out.println("�Ź���ȣ : " + vo.getNum() + " " + e.getMessage());
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
		return "../maemool/sideList.jsp";
	}

	// �׽�Ʈ�� ���� �޼ҵ� by. ��
	// ajax�� ���� �̵��� ���� �������� ������ �˸´� �Ź��� �θ����� �׽�Ʈ ��
	@RequestMapping("main/testSideList.do")
	public String testSideList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("testSideList.do start-----------------");
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("keyword");
		System.out.println("testSideList.do�� ���޹��� Ű����" + keyword);
		// ���� ���� �� �𼭸��� ������ �浵�� ���޹޴´�.
		String Sne_x = req.getParameter("ne_x");
		String Sne_y = req.getParameter("ne_y");
		String Ssw_x = req.getParameter("sw_x");
		String Ssw_y = req.getParameter("sw_y");

		// �Ʒ� �ڵ�� ����� �� �޾ҳ� Ȯ�ο�
		/*
		 * System.out.println("Sne_x : " + Sne_x); System.out.println("Sne_y : " +
		 * Sne_y); System.out.println("Ssw_x : " + Ssw_x); System.out.println("Ssw_y : "
		 * + Ssw_y);
		 */

		// �����浵�� �����ϱ� ���� map
		Map<String, Object> bound = null;

		// ����Ʈ ����� ���� ����
		List<MapVO> geoList = null;
		List<MapVO> tempList = null;
		List<ImgVO> imgList = null;
		// �Ź���ȣ : �Ź���ǥ�̹���
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

		// ���ɸ�� by.�Ѽ�
		String num = req.getParameter("num");

		if (num != null) {
			// num = "";
			Cookie cookie = new Cookie("likeNum", num);
			cookie.setMaxAge(365 * 24 * 60 * 60); // ��� ��ȿ�Ⱓ 365�� ����1
			cookie.setPath("C:\\GaBang\\gb");
			res.addCookie(cookie);
		}

		// list.jsp���� ���۹��� ���� bound Ȯ��
		if (keyword != null) {
			System.out.println("�� testSideList�� ���۵� keyword : " + keyword);

			/*
			 * by t. 2018.05.30 �׸� �˻�
			 */

			if (keyword.equals("��������")) {
				geoList = MaemoolDAO.getDepositInfo();
				tempList = new ArrayList<MapVO>();
				// System.out.println("����:"+tempList.size());
				for (MapVO vo : geoList) {
					if (vo.getDeposit().contains("��") || vo.getDeposit().contains("��"))
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
			} else if (keyword.equals("���� ����")) {
				geoList = MaemoolDAO.getParkingInfo(map);
				totalpage = MaemoolDAO.parkingTotalPage();
			}				

			else if (keyword.equals("����"))
				geoList = MaemoolDAO.getOneRoomInfo();

			else if (keyword.equals("���ǽ���"))
				geoList = MaemoolDAO.getOfficetelInfo();
			else
				geoList = PropertyAddrDAO.searchMaemool(keyword);

			// ���� ������ ��� �ش� ���� �� �Ź� ���
			// �����浵�� null�� �ƴ� ���
		} else if ((Sne_x != null) && (Sne_y != null) && (Ssw_x != null) && (Ssw_y != null)) {
			// ���� �ϵ����� ���浵
			double ne_x = Double.parseDouble(Sne_x);
			double ne_y = Double.parseDouble(Sne_y);
			// ���� �������� ���浵
			double sw_x = Double.parseDouble(Ssw_x);
			double sw_y = Double.parseDouble(Ssw_y);

			/*System.out.println("�� testSideList�� ���۵�\nne_x : " + ne_x + " ne_y : " + ne_y);
			System.out.println("sw_x : " + sw_x + " sw_y : " + sw_y);*/
			// ���� �𼭸� ���浵�� �ʿ� ����
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

		// �̹��� ��� �κ�
		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel �Ź���ȣ : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // �ش� �Ź���ȣ�� �̹��� �˻�
				// System.out.println(imgList.get(0).getImg());
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // �Ź���ȣ : �̹��� �ּ�
			} catch (Exception e) {
				System.out.println("�Ź���ȣ : " + vo.getNum() + " " + e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // �Ź���ȣ : �̹��� �ּ�
			}
		}
		
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		req.setAttribute("keyword", keyword);

		return "../maemool/testSideList.jsp";
	}

	/* by.�ؿ� */
	@RequestMapping("main/add_jjim.do")
	public void real_jjim(HttpServletRequest req, HttpServletResponse res) {
		// id�� session�� ����Ǿ��ִ�.
		HttpSession session = req.getSession();

		// �� �ʿ��� ������ (id�ϰ� �Ź���ȣ)
		String email = (String) session.getAttribute("id");
		String num = req.getParameter("maemool_num");

		JjimVO vo = new JjimVO();

		vo.setEmail(email);
		vo.setNum(Integer.parseInt(num));
		vo.setRegdate(new Date());

		System.out.println(email);
		System.out.println(num);

		JjimDAO.insertJjim(vo);
		System.out.println("dao �Ϸ�");

		
	}

	/* by.�ؿ� */
	@RequestMapping("main/remove_jjim.do")
	public void remove_jjim(HttpServletRequest req, HttpServletResponse res) {
		// id�� session�� ����Ǿ��ִ�.
		HttpSession session = req.getSession();

		// �� �ʿ��� ������ (id�ϰ� �Ź���ȣ)
		String email = (String) session.getAttribute("id");
		String num = req.getParameter("maemool_num");

		Map map = new HashMap();

		map.put("email", email);
		map.put("num", num);
		System.out.println(map.get("email"));
		System.out.println(map.get("num"));

		JjimDAO.removeJjim(map);

		
	}
	
	/* by.�ؿ� */
	@RequestMapping("main/jjimlist_delete.do")
	public String delete_jjimList(HttpServletRequest req, HttpServletResponse res) {
		// id�� session�� ����Ǿ��ִ�.
		HttpSession session = req.getSession();

		// �� �ʿ��� ������ (id�ϰ� �Ź���ȣ)
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
		// id�� session�� ����Ǿ��ִ�.
		HttpSession session = req.getSession();

		// �� �ʿ��� ������ (id�ϰ� �Ź���ȣ)
		String email = (String) session.getAttribute("id");
		String num = req.getParameter("maemool_num");
		
		Map map = new HashMap();
		map.put("email", email);
		//�Ź���ȣ
		List<JjimVO> list=JjimDAO.jjimList(map);
		//1.��� �� ���̺��� �ش� �̸����� ���� �ִ� �� �Ź� ��ȣ�� �����´�.

		//�Ź� ����
		List<MaemoolVO> maemoolInfo=null;
		List<JjimVO> jjimProperty=null;
		List<MapVO> jjimDetail=new ArrayList<MapVO>();
		System.out.println("������� ��žƳ�");
		//2.�ش� �Ź� ��ȣ�� ���� �ʿ��� �����͸� ��� map�信�� �����´�.
		for(JjimVO vo:list)
		{
			//maemoolInfo.add(MaemoolDAO.infoMaemool(vo.getNum()));
			Map map1=new HashMap();
			map1.put("num", vo.getNum());
			MapVO vo1=JjimDAO.jjimDetail(map1);
			jjimDetail.add(vo1);
			
		}
		//3.jjim.jsp�� map�信�� ������ �����͸� list Ÿ������ �Ѱ��ش�.
		req.setAttribute("list", jjimDetail);
		req.setAttribute("main_jsp", "../maemool/jjim.jsp");
		return "main.jsp";
	}
	
	// by. �Ѽ�
	   @RequestMapping("main/like.do")
	   public String like(HttpServletRequest request, HttpServletResponse response) {
	      String nums = "";
	      List<MapVO> list = new ArrayList<MapVO>();
	      MapVO vo = null;
	      MaemoolDAO dao = null;
	      int num = 0;
	      Cookie[] cookies = request.getCookies();
	      //System.out.println("���� ����� ���ɸ�� ���� : " + cookies.length);
	   
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
	   
	   // by. �Ѽ�
	   @RequestMapping("main/like_add.do")
	   public String LikeAdd(HttpServletRequest request, HttpServletResponse response) {
	/*      // ���ɸ�� by.�Ѽ�
	      String num = request.getParameter("num");
	      System.out.println(num);
	      Cookie c = new Cookie("cookNo", num);
	      c.setMaxAge(0);
	      // cookie.setPath("C:\\GaBang\\gb"); //��Ű�� ���� ����
	      response.addCookie(c); // ��Ű�� ����
	      System.out.println(c);*/
	      
	      
	      String no = request.getParameter("num");
	      System.out.println("�Ķ���� num : " + no);
	      Cookie[] cookies = request.getCookies();
	      String name = "";
	      String ss = "";
	      int num = Integer.parseInt(no);

	      if (cookies != null) {
	         System.out.println("��Ű ���� : " + cookies.length);
	         
	         for (int i = 0; i < cookies.length; i++) {
	            
	            Cookie c = cookies[i];
	            String cName = c.getName();
	            /*System.out.println("cookies["+i+"] �̸� Ȯ�� : " + cookies[i].getName());
	            System.out.println("cookies["+i+"] �� Ȯ�� : " + cookies[i].getValue());
	            System.out.println("cookies["+i+"] �ð� Ȯ�� : " + cookies[i].getMaxAge());*/
	            
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
	      // ��Ű�� null�� ���
	      else {
	         name = "cookNo"+ num;
	      }
	      Cookie c = new Cookie(name, no);
	      c.setMaxAge(60 * 60 * 24); // ��Ű �ִ� �����ð� ����
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
	            
	            //��Ű �̸��� cookNo�� ����
	            if (cName.equals("cookNo" + no)) {
	               c.setMaxAge(0);
	               //System.out.println("��Ű �����ð� : " + c.getMaxAge());
	               response.addCookie(c);
	            }
	         }
	      }
	/*      System.out.println("��Ű ���� : " + cookies.length);
	      for (Cookie c : cookies) {
	         System.out.println("����Ű �̸� : " + c.getName());
	         System.out.println("��Ű �� : " + c.getValue());
	         System.out.println("��Ű �����ð� :" + c.getMaxAge());
	      }*/
	      
	      //request.setAttribute("main_jsp", "../like/like.do");
	      return "redirect:../main/like.do";
	   }
	}