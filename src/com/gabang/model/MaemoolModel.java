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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MaemoolModel {
	@RequestMapping("main/maemool_theme_list.do")
	public String maemoolThemeList(HttpServletRequest req, HttpServletResponse response) throws Exception {
		req.setCharacterEncoding("euc-kr");
		String theme = req.getParameter("theme");
		System.out.println(theme);
		//theme = theme.trim();		
		List<MapVO> geoList = new ArrayList<MapVO>();
		List<MapVO> tempList = null;
		
		if(theme.equals("��������")) {						
			tempList = MaemoolDAO.getDepositInfo();
			System.out.println("����:"+tempList.size());
			for(MapVO vo:tempList) {
				if(vo.getDeposit().contains("��") || vo.getDeposit().contains("��")) continue;
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
//		else if(theme.equals("���� ����")) {
//			tempList = MaemoolDAO.getParkingInfo(theme);
//		}
//			
//		else if(theme.equals("����")) {
//			tempList = MaemoolDAO.getOneRoomInfo(theme);
//		}
//			
//		else if(theme.equals("���ǽ���")) {
//			tempList = MaemoolDAO.getOfficetelInfo(theme);
//		}			
		
		List<ImgVO> imgList = null;
		Map<Integer,Object> oneImg = new HashMap<Integer,Object>();

		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel �Ź���ȣ : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // �ش� �Ź���ȣ�� �̹��� �˻�
				//System.out.println("img1");
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // �Ź���ȣ : �̹��� �ּ�
				//System.out.println("img2");
				
			} catch (Exception e) {
				System.out.println("�Ź���ȣ : " +vo.getNum() + " "+ e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // �Ź���ȣ : �̹��� �ּ�
			}
		}
		


		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		req.setAttribute("main_jsp", "../maemool/list.jsp");
		return "main.jsp";
	}
	

	@RequestMapping("main/maemool_detail.do")
	public String maemoolDetail(HttpServletRequest request, HttpServletResponse res)
	throws Exception {
		request.setCharacterEncoding("euc-kr");
	
		String num=request.getParameter("num"); // �̹����� �̹����� �ش��ϴ� �������� �Ź���ȣ�� �°� ���
		if(num == null)
			num = "2";
		MaemoolVO vo1=new MaemoolVO();
	//	vo1.setNum(Integer.parseInt(num));
		 
		List<ImgVO> imgList = MaemoolDAO.detailMaemool(Integer.parseInt(num)); // �ӽ÷� 50���� �Ź���ȣ�� �̹����� ���
		MaemoolVO vo = MaemoolDAO.infoMaemool(Integer.parseInt(num));
		System.out.println(vo.getDeposit());
		
		request.setAttribute("imgList", imgList);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../maemool/maemool_detail.jsp");
	//	CommonModel.commonSendData(request);
		return "main.jsp";
	}
	
	@RequestMapping("main/imageUpload.do")
	public void ImageInsert(HttpServletRequest request, HttpServletResponse res) throws IOException
	{
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("id");
		int maemoolNum=MaemoolDAO.maemoolNum();
		ImgVO vo=new ImgVO();
		
	
		
		//img���̺� �ʿ��� ������ ����
		//�Ź� �̹��� ���� �޾ƿ��� ���̺귯��
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
						vo.setImg(file.getName());
						vo.setNum(maemoolNum);
						MaemoolDAO.insertImage(vo);
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	@RequestMapping("main/upload.do")
	public String maemoolInsert(HttpServletRequest request, HttpServletResponse res) throws IOException {

		request.setCharacterEncoding("EUC-KR");
		
		
		
		BuildingTypeVO vo=new BuildingTypeVO();
		DealTypeVO vo1=new DealTypeVO();
		ImgVO vo2=new ImgVO();
		MaemoolVO vo3=new MaemoolVO();
		PropertyAddrVO vo4=new PropertyAddrVO();
		RoomTypeVO vo5=new RoomTypeVO();
		
		
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("id");
		int maemoolNum=MaemoolDAO.maemoolNum();
		System.out.println(maemoolNum);
		
		
		//img���̺� �ʿ��� ������ ����
				//�Ź� �̹��� ���� �޾ƿ��� ���̺귯��
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
								MaemoolDAO.insertImage(vo2);
							}
						}
					} catch (FileUploadException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
		
				
		//property_Addr�� �ʿ��� ������ ����
		String addr=request.getParameter("address")+" "+request.getParameter("datailAddress");
		String x_position=request.getParameter("x_position");
		String y_position=request.getParameter("y_position");
		vo4.setAddr(addr);
		vo4.setX_position(x_position);
		vo4.setY_position(y_position);
		vo4.setNum(maemoolNum);
		
		System.out.println(addr);
		System.out.println(x_position);
		System.out.println(y_position);
		System.out.println(maemoolNum);
			
		
		
		//deal_type���̺� �ʿ��� ������
		//�ŷ� ����
		String deal_type=request.getParameter("deal_type");
		vo1.setType("deal_type");
		vo1.setNum(maemoolNum);
		
		//room_type�� �ʿ��� ������
		//�汸��
		String room_type=request.getParameter("room_type");
		vo5.setType(Integer.parseInt(room_type));
		vo5.setNum(maemoolNum);
		
		//building_type�� �ʿ��� ������
		//�ǹ�����
		String building_type=request.getParameter("building_type");
		vo.setType(Integer.parseInt(building_type));
		vo.setNum(maemoolNum);
		
		
		//maemool���̺� �ʿ��� ������
		vo3.setNum(maemoolNum);
		vo3.setEmail(email);
		
		
		//������
		String manage_fee=request.getParameter("manage_fee");
		if(manage_fee!=null)
		{
			manage_fee=manage_fee+" ����";
		}
		vo3.setManage_fee(manage_fee);
		
		//������ �����׸�
		String[] opt=request.getParameterValues("opt");
		String option="";
		for(String opt1:opt)
		{
			option=opt+", ";
		}
		option=option.substring(0,option.lastIndexOf(",")-1);
		vo3.setOpt(option);
		
		//���������� ����
		String elev=request.getParameter("elev");
		vo3.setElev(Integer.parseInt(elev));
		
		//�������� ����
		String parking_lot=request.getParameter("parking_lot");
		vo3.setParking_lot(Integer.parseInt(parking_lot));
		
		//�ش���
		String floor1=request.getParameter("floor1");
		
		if(!(floor1.startsWith("��")||floor1.startsWith("��")));
		{
			floor1=floor1+"��";
		}
		//��ü��
		String floor2=request.getParameter("floor2")+"��";
		
		String floor=floor1+"//"+floor2;
		vo3.setFloor(floor);
		
	
		//������
		String deposit1=request.getParameter("deposit1");
		if(deposit1!=null)
		{
			deposit1=deposit1 + " ��";
		}
		String deposit2=request.getParameter("deposit2");
		if(deposit2!=null)
		{
			deposit2=deposit2 + " ����";
		}
		
		String deposit=deposit1+deposit2;
		vo3.setDeposit(deposit);
		
		//����
		String monthly_rent1=request.getParameter("monthly_rent1");
		if(monthly_rent1!=null)
			{
			monthly_rent1=monthly_rent1 + " ��";
			}
		String monthly_rent2=request.getParameter("monthly_rent2");
		if(monthly_rent2!=null)
		{
		monthly_rent2=monthly_rent2 + " ����";
		}
		
		String monthly_rent=monthly_rent1+monthly_rent2;
		vo3.setMonthly_rent(monthly_rent);
		System.out.println(monthly_rent);
		
		//�������
		String gross_area=request.getParameter("gorss_area");
		int pyeong=(int) Math.round(((Integer.parseInt(gross_area)/3.3)*10)/10);
		
		gross_area=request.getParameter("gorss_area")+"��"+" ("+pyeong+"P)";
		vo3.setGross_area(gross_area);
		System.out.println(gross_area);
		//���ְ�����
		String moving_date=request.getParameter("moving_date");
		vo3.setMoving_date(moving_date);
		
		//�Ź� ���� ǥ��
		String detail_title=request.getParameter("detail_title");
		vo3.setDetail_title(detail_title);
		
		//�α� ����ö ǥ��
		String near_subway=request.getParameter("near_subway");
		vo3.setNear_subway(near_subway);
		
		//�Ź� �󼼼���
		String description=request.getParameter("description");
		vo3.setDescription(description);
		
		
		MaemoolDAO.insertMaemool(vo, vo1, vo3, vo4, vo5);
		
		
		request.setAttribute("main_jsp", "../maemool/maemool_detail.jsp");
			return "main.jsp";
	}

	// home.jsp���� �˻��� ��� �۵� by.��
	@RequestMapping("main/maemool_search.do")
	public String maemoolSearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
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
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // �̹��� ���� �Ź��� ��� ó��
			}
		}

		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		// ���� ������
		//req.setAttribute("main_jsp", "../maemool/list.jsp");

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
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("keyword");
		
		// ���� ���� �� �𼭸��� ������ �浵�� ���޹޴´�.
		String Sne_x = req.getParameter("ne_x");
		String Sne_y = req.getParameter("ne_y");
		String Ssw_x = req.getParameter("sw_x");
		String Ssw_y = req.getParameter("sw_y");
		
		// �Ʒ� �ڵ�� ����� �� �޾ҳ� Ȯ�ο�
		/*
		System.out.println("Sne_x : " + Sne_x);
		System.out.println("Sne_y : " + Sne_y);
		System.out.println("Ssw_x : " + Ssw_x);
		System.out.println("Ssw_y : " + Ssw_y);
		*/

		// �����浵�� �����ϱ� ���� map
		Map<String, Object> bound = null;
		
		// ����Ʈ ����� ���� ����
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		// �Ź���ȣ : �Ź���ǥ�̹���
		Map oneImg = new HashMap();
		
		// ���ɸ�� by.�Ѽ�
		String num = req.getParameter("num");
		
		if (num != null) {
//			num = "";
			Cookie cookie = new Cookie("likeNum", num);
			cookie.setMaxAge(365 * 24 * 60 * 60); // ��� ��ȿ�Ⱓ 365�� ����1
			cookie.setPath("C:\\GaBang\\gb");
			res.addCookie(cookie);
		}
		
		// list.jsp���� ���۹��� ���� bound Ȯ��
		if(keyword != null) {
			System.out.println("�� testSideList�� ���۵� keyword : " + keyword);
			geoList = PropertyAddrDAO.searchMaemool(keyword);
		
			// ���� ������ ��� �ش� ���� �� �Ź� ���
			// �����浵�� null�� �ƴ� ���
		} else if((Sne_x != null) && (Sne_y != null) && (Ssw_x != null) && (Ssw_y != null)){
			// ���� �ϵ����� ���浵
			double ne_x = Double.parseDouble(Sne_x);
			double ne_y = Double.parseDouble(Sne_y);
			// ���� �������� ���浵
			double sw_x = Double.parseDouble(Ssw_x);
			double sw_y = Double.parseDouble(Ssw_y);
			
			System.out.println("�� testSideList�� ���۵�\nne_x : " + ne_x + " ne_y : " + ne_y);
			System.out.println("sw_x : " + sw_x + " sw_y : " + sw_y);
			// ���� �𼭸� ���浵�� �ʿ� ����
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
		
		return "../maemool/testSideList.jsp";
	}
	
	@RequestMapping("main/jjim.do")
	public String jjim(HttpServletRequest req, HttpServletResponse res) {
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
	public String like(HttpServletRequest req, HttpServletResponse res) {
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

		req.setAttribute("main_jsp", "../like/like.jsp");
		return "main.jsp";
	}
}
