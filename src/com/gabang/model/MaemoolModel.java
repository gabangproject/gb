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
		req.setCharacterEncoding("euc-kr");
		String keyword = req.getParameter("keyword");
		System.out.println(keyword);
		//theme = theme.trim();		
		List<MapVO> geoList = null;
		List<MapVO> tempList = null;
		
		if(keyword.equals("��蹂댁쬆湲�")) {						
			tempList = MaemoolDAO.getDepositInfo();
			geoList = new ArrayList<MapVO>();
			//System.out.println("媛��닔:"+tempList.size());
			for(MapVO vo:tempList) {
				if(vo.getDeposit().contains("�쟾") || vo.getDeposit().contains("�뼲")) continue;
				String str = vo.getDeposit();				
				str = str.replaceAll("[^0-9]+","").trim();
				int num = Integer.parseInt(str);
				if(num > 500) continue;				
				geoList.add(vo);
			}
		}
		
		else if(keyword.equals("二쇱감 媛��뒫"))
			geoList = MaemoolDAO.getParkingInfo();	
			
		else if(keyword.equals("�썝猷�"))
			geoList = MaemoolDAO.getOneRoomInfo();		
			
		else if(keyword.equals("�삤�뵾�뒪�뀛")) 
			geoList = MaemoolDAO.getOfficetelInfo();				
		
		List<ImgVO> imgList = null;
		Map<Integer,Object> oneImg = new HashMap<Integer,Object>();

		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel 留ㅻЪ踰덊샇 : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // �빐�떦 留ㅻЪ踰덊샇濡� �씠誘몄� 寃��깋
				//System.out.println("img1");
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // 留ㅻЪ踰덊샇 : �씠誘몄� 二쇱냼
				//System.out.println("img2");
				
			} catch (Exception e) {
				System.out.println("留ㅻЪ踰덊샇 : " +vo.getNum() + " "+ e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // 留ㅻЪ踰덊샇 : �씠誘몄� 二쇱냼
			}
		}
//
		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
//		//req.setAttribute("main_jsp", "../maemool/list.jsp");		
		req.setAttribute("main_jsp", "../maemool/testList.jsp");
		return "main.jsp";
	}
	

	@RequestMapping("main/maemool_detail.do")
	public String maemoolDetail(HttpServletRequest request, HttpServletResponse res)
	throws Exception {
		request.setCharacterEncoding("euc-kr");
		
		String num=request.getParameter("num"); // �씠誘몄��옉 �씠誘몄��뿉 �빐�떦�븯�뒗 �긽�꽭�젙蹂대�� 留ㅻЪ踰덊샇�뿉 留욊쾶 異쒕젰
		String x=request.getParameter("x");
		String y=request.getParameter("y");
		System.out.println(num);
		System.out.println(x);
		System.out.println(y);
		
		
	
		MaemoolVO vo1=new MaemoolVO();
	
		 
		List<ImgVO> imgList = MaemoolDAO.detailMaemool(Integer.parseInt(num));
		MaemoolVO vo = MaemoolDAO.infoMaemool(Integer.parseInt(num));
		String email=MemberDAO.sellerEmail(Integer.parseInt(num));
		SellerVO seller=MemberDAO.sellerData(email);
		
		for(ImgVO vo2:imgList)
		{
			System.out.println(vo2.getImg());
		}
		
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
		
		MaemoolVO vo1=new MaemoolVO();
		BuildingTypeVO vo2=new BuildingTypeVO();
		DealTypeVO vo3=new DealTypeVO();
		PropertyAddrVO vo4=new PropertyAddrVO();
		RoomTypeVO vo5=new RoomTypeVO();
		
		
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("id");
		int maemoolNum=MaemoolDAO.maemoolNum()+1;
		
		 
		//fileItem.getString("EUC_KR"); 
		int i=1;
		
		String option="";
		Map map=new HashMap();
		List<String> list=new ArrayList<String>();
		
		//img�뀒�씠釉붿뿉 �븘�슂�븳 �뜲�씠�꽣 ���옣
				//留ㅻЪ �씠誘몄� �젙蹂� 諛쏆븘�삤�뒗 �씪�씠釉뚮윭由�
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
								if(!(fieldName.equals("opt")))
								{
									map.put(fieldName, fieldValue);
								}
								else 
								{
									option=option+fieldValue+", ";
								}
								
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
								
								list.add(fileName);
								
							}
						}
					} catch (FileUploadException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
		
				
		//property_Addr�뿉 �븘�슂�븳 �뜲�씠�꽣 ���옣
		String addr=map.get("address")+" "+map.get("detailAddress");
		String x_position=(String) map.get("x_position");
		String y_position=(String) map.get("y_position");
		vo4.setAddr(addr);
		vo4.setX_position(x_position);
		vo4.setY_position(y_position);
		vo4.setNum(maemoolNum);
		
		System.out.println(addr);
		System.out.println(x_position);
		System.out.println(y_position);
		System.out.println(maemoolNum);
			
		
		
		//deal_type�뀒�씠釉붿뿉 �븘�슂�븳 �뜲�씠�꽣
		//嫄곕옒 �삎�깭
		String deal_type= (String) map.get("deal_type");
		vo3.setType(Integer.parseInt(deal_type));
		vo3.setNum(maemoolNum);
		System.out.println(deal_type);
		
		//room_type�뿉 �븘�슂�븳 �뜲�씠�꽣
		//諛⑷뎄議�
		String room_type=(String) map.get("room_type");
		vo5.setType(Integer.parseInt(room_type));
		vo5.setNum(maemoolNum);
		System.out.println(room_type);
		
		//building_type�뿉 �븘�슂�븳 �뜲�씠�꽣
		//嫄대Ъ�삎�깭
		String building_type=(String) map.get("building_type");
		vo2.setType(Integer.parseInt(building_type));
		vo2.setNum(maemoolNum);
		System.out.println(building_type);
		
		//maemool�뀒�씠釉붿뿉 �븘�슂�븳 �뜲�씠�꽣
		vo1.setNum(maemoolNum);
		vo1.setEmail(email);
		
		
		//愿�由щ퉬
		String manage_fee=(String) map.get("manage_fee");
		if(manage_fee!=null)
		{
			manage_fee=manage_fee+"留뚯썝";
		}
		vo1.setManage_fee(manage_fee);
		System.out.println(manage_fee);
		
		//愿�由щ퉬 �룷�븿�빆紐�
		//option=(String) map.get("option");
		option=option.substring(0,option.lastIndexOf(","));
		vo1.setOpt(option);
		System.out.println(option);
		
		//�뿕由щ쿋�씠�꽣 �쑀臾�
		String elev=(String) map.get("elev");
		vo1.setElev(Integer.parseInt(elev));
		System.out.println(elev);
		
		//二쇱감怨듦컙 �쑀臾�
		String parking_lot=(String) map.get("parking_lot");
		vo1.setParking_lot(Integer.parseInt(parking_lot));
		System.out.println(parking_lot);
		
		//�빐�떦痢�
		String floor1=(String) map.get("floor1")+"痢�";
		
		//�쟾泥댁링
		String floor2=(String) map.get("floor2")+"痢�";
		String floor=floor1+"/"+floor2;
		vo1.setFloor(floor);
		System.out.println(floor);
	
		//�썡�꽭
		String monthly_rent=(String) map.get("monthly_rent");
		vo1.setMonthly_rent(monthly_rent+ "留뚯썝");
		System.out.println("monthly_rent:"+monthly_rent);
		
		//蹂댁쬆湲�
		String deposit1=(String) map.get("deposit1");
		if(deposit1!=null)
		{
			deposit1=deposit1 + "�뼲";
		}
		String deposit2=(String) map.get("deposit2");
		if(deposit2!=null)
		{
			deposit2=deposit2 + "留뚯썝";
		}
		
		String deposit=deposit1+deposit2;
		
		/*if(monthly_rent.trim()==null)
		{
		deposit=deposit+" (�쟾�꽭媛��뒫)";
		}*/
			vo1.setDeposit(deposit);
		System.out.println(deposit);
		
		
		
		//�쟾�슜硫댁쟻
		String gross_area=(String) map.get("gross_area")+"�렊";
		vo1.setGross_area(gross_area);
		System.out.println(gross_area);
		
		//�엯二쇨��뒫�씪
		String moving_date=(String) map.get("moving_date");
		vo1.setMoving_date(moving_date);
		System.out.println(moving_date);
		
		//留ㅻЪ �븳以� �몴�쁽
		String detail_title=(String) map.get("detail_title");
		vo1.setDetail_title(detail_title);
		System.out.println(detail_title);
		
		//�씤洹� 吏��븯泥� �몴�떆
		String near_subway=(String) map.get("near_subway");
		vo1.setNear_subway(near_subway);
		System.out.println(near_subway);
		
		//留ㅻЪ �긽�꽭�꽕紐�
		String description=(String) map.get("description");
		vo1.setDescription(description);
		System.out.println(description);
		
		
		MaemoolDAO.insertMaemool(vo1, vo2, vo3, vo4, vo5);
		
		
		
		//�씠誘몄� ���옣
		ImgVO vo=new ImgVO();
		for(String fileName:list)
		{
					
			File f=new File(PATH+"\\"+fileName);
			File file=new File(PATH+"\\"+email+"-"+fileName);
			f.renameTo(file);
			vo.setImg("c:download\\"+file.getName());
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

	// home.jsp�뿉�꽌 寃��깋�븷 寃쎌슦 �옉�룞 by.�븳
	@RequestMapping("main/maemool_search.do")
	public String maemoolSearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("euc-kr");
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap();	// 留ㅻЪ踰덊샇 : 留ㅻЪ���몴�씠誘몄�
		String keyword = req.getParameter("keyword");

		System.out.println("MaemoolModel maemoolSearch : " + keyword);
		geoList = PropertyAddrDAO.searchMaemool(keyword);

		// �씠誘몄� 異쒕젰 遺�遺�
		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel 留ㅻЪ踰덊샇 : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // �빐�떦 留ㅻЪ踰덊샇濡� �씠誘몄� 寃��깋
				// System.out.println(imgList.get(0).getImg());
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // 留ㅻЪ踰덊샇 : �씠誘몄� 二쇱냼
			} catch (Exception e) {
				System.out.println("留ㅻЪ踰덊샇 : " +vo.getNum() + " "+ e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // �씠誘몄� �뾾�뒗 留ㅻЪ�쓽 寃쎌슦 泥섎━
			}
		}

		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		// 怨듭떇 �럹�씠吏�
		//req.setAttribute("main_jsp", "../maemool/list.jsp");

		// �뀒�뒪�듃 �럹�씠吏�
		req.setAttribute("main_jsp", "../maemool/testList.jsp");

		return "main.jsp";
	}
	
	// 吏��룄 �쁿 留ㅻЪ 紐⑸줉�쓣 異쒕젰 by. �븳
	// ajax濡� �빐�떦�럹�씠吏�瑜� 遺�瑜몃떎.
	@RequestMapping("main/sideList.do")
	public String sideList(HttpServletRequest req, HttpServletResponse response) throws Exception {
		// 蹂� 硫붿냼�뱶�뒗 ajax瑜� �넻�빐�꽌 �븳湲��쓣 �뙆�씪誘명꽣濡� �쟾�넚諛쏄린 �븣臾몄뿉
		// utf-8濡� 諛쏆븘�빞 �븳湲��씠 源⑥�吏� �븡�뒗�떎.
		req.setCharacterEncoding("utf-8");
		String keyword = req.getParameter("keyword");// 寃��깋�뼱瑜� �쟾�떖諛쏅뒗�떎.

		// �쐞�룄�� 寃쎈룄瑜� �쟾�떖諛쏅뒗�떎.
		String swLatlng = req.getParameter("swLatlng");
		String neLatlng = req.getParameter("neLatlng");

		// 由ъ뒪�듃 異쒕젰�쓣 �쐞�븳 蹂��닔
		List<MapVO> geoList = null;
		List<ImgVO> imgList = null;
		Map oneImg = new HashMap(); // 留ㅻЪ踰덊샇 : 留ㅻЪ���몴�씠誘몄�

		System.out.println("testSideList濡� �쟾�넚�맂 keyword : " + keyword);
		geoList = PropertyAddrDAO.searchMaemool(keyword);

		// �씠誘몄� 異쒕젰 遺�遺�
		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel 留ㅻЪ踰덊샇 : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // �빐�떦 留ㅻЪ踰덊샇濡� �씠誘몄� 寃��깋
				// System.out.println(imgList.get(0).getImg());
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // 留ㅻЪ踰덊샇 : �씠誘몄� 二쇱냼
			} catch (Exception e) {
				System.out.println("留ㅻЪ踰덊샇 : " + vo.getNum() + " " + e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // 留ㅻЪ踰덊샇 : �씠誘몄� 二쇱냼
			}
		}
		

		// �쐞�룄�� 寃쎈룄媛� null�씠 �븘�땺 寃쎌슦 �떎�뻾�븳�떎.
		if (swLatlng != null && neLatlng != null) {
			System.out.println(swLatlng);
			System.out.println(neLatlng);
		}
		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		return "../maemool/sideList.jsp";
	}
	
	// �뀒�뒪�듃瑜� �쐞�븳 硫붿냼�뱶 by. �븳
	// ajax濡� 吏��룄 �씠�룞�뿉 �뵲�씪 蹂댁뿬吏��뒗 �쁺�뿭�뿉 �븣留욌뒗 留ㅻЪ�쓣 遺�瑜대룄濡� �뀒�뒪�듃 以�
	@RequestMapping("main/testSideList.do")
	public String testSideList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");		
		String keyword = req.getParameter("keyword");		
		System.out.println("testSideList.do"+keyword);
		// 吏��룄 �쁺�뿭 媛� 紐⑥꽌由ъ쓽 �쐞�룄�� 寃쎈룄瑜� �쟾�떖諛쏅뒗�떎.
		String Sne_x = req.getParameter("ne_x");
		String Sne_y = req.getParameter("ne_y");
		String Ssw_x = req.getParameter("sw_x");
		String Ssw_y = req.getParameter("sw_y");
		
		// �븘�옒 肄붾뱶�뒗 �젣��濡� 媛� 諛쏆븯�굹 �솗�씤�슜
		/*
		System.out.println("Sne_x : " + Sne_x);
		System.out.println("Sne_y : " + Sne_y);
		System.out.println("Ssw_x : " + Ssw_x);
		System.out.println("Ssw_y : " + Ssw_y);
		*/

		// �쐞�룄寃쎈룄瑜� ���옣�븯湲� �쐞�븳 map
		Map<String, Object> bound = null;
		
		// 由ъ뒪�듃 異쒕젰�쓣 �쐞�븳 蹂��닔
		List<MapVO> geoList = null;
		List<MapVO> tempList = null;
		List<ImgVO> imgList = null;
		// 留ㅻЪ踰덊샇 : 留ㅻЪ���몴�씠誘몄�
		Map oneImg = new HashMap();
		
		// 愿��떖紐⑸줉 by.�븳�넄
		String num = req.getParameter("num");
		
		if (num != null) {
//			num = "";
			Cookie cookie = new Cookie("likeNum", num);
			cookie.setMaxAge(365 * 24 * 60 * 60); // 荑좉린 �쑀�슚湲곌컙 365�씪 �꽕�젙1
			cookie.setPath("C:\\GaBang\\gb");
			res.addCookie(cookie);
		}
		
		// list.jsp�뿉�꽌 �쟾�넚諛쏆� 吏��룄 bound �솗�씤
		if(keyword != null) {
			System.out.println("�뿀 testSideList濡� �쟾�넚�맂 keyword : " + keyword);
			
			/*
			 * 		by t.
			 * 		2018.05.30
			 * 		�뀒留� 寃��깋	
			 */			
			if(keyword.equals("��蹂댁쬆湲�")) {
				geoList = new ArrayList<MapVO>();
				tempList = MaemoolDAO.getDepositInfo();
				//System.out.println("媛��닔:"+tempList.size());
				for(MapVO vo:tempList) {
					if(vo.getDeposit().contains("�쟾") || vo.getDeposit().contains("�뼲")) continue;
					String str = vo.getDeposit();				
					str = str.replaceAll("[^0-9]+","").trim();
					int number = Integer.parseInt(str);
					if(number > 500) continue;				
					geoList.add(vo);
				}
			}
			else if(keyword.equals("二쇱감 媛��뒫"))
				geoList = MaemoolDAO.getParkingInfo();	
				
			else if(keyword.equals("�썝猷�"))
				geoList = MaemoolDAO.getOneRoomInfo();		
				
			else if(keyword.equals("�삤�뵾�뒪�뀛")) 
				geoList = MaemoolDAO.getOfficetelInfo();	
			else			
				geoList = PropertyAddrDAO.searchMaemool(keyword);
		
			// 吏��룄 ��吏곸씪 寃쎌슦 �빐�떦 吏��룄 �궡 留ㅻЪ 異쒕젰
			// �쐞�룄寃쎈룄媛� null�씠 �븘�땺 寃쎌슦
		} else if((Sne_x != null) && (Sne_y != null) && (Ssw_x != null) && (Ssw_y != null)){
			// 吏��룄 遺곷룞�걹�젏 �쐞寃쎈룄
			double ne_x = Double.parseDouble(Sne_x);
			double ne_y = Double.parseDouble(Sne_y);
			// 吏��룄 �궓�꽌�걹�젏 �쐞寃쎈룄
			double sw_x = Double.parseDouble(Ssw_x);
			double sw_y = Double.parseDouble(Ssw_y);
			
			System.out.println("�뿀 testSideList濡� �쟾�넚�맖\nne_x : " + ne_x + " ne_y : " + ne_y);
			System.out.println("sw_x : " + sw_x + " sw_y : " + sw_y);
			// 諛쏆� 紐⑥꽌由� �쐞寃쎈룄瑜� 留듭뿉 ���옣
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

		// �씠誘몄� 異쒕젰 遺�遺�
		for (MapVO vo : geoList) {
			// System.out.println("maemoolModel 留ㅻЪ踰덊샇 : " + vo.getNum());
			try {
				imgList = PropertyAddrDAO.imgFind(vo.getNum()); // �빐�떦 留ㅻЪ踰덊샇濡� �씠誘몄� 寃��깋
				// System.out.println(imgList.get(0).getImg());
				oneImg.put(vo.getNum(), imgList.get(0).getImg()); // 留ㅻЪ踰덊샇 : �씠誘몄� 二쇱냼
			} catch (Exception e) {
				System.out.println("留ㅻЪ踰덊샇 : " +vo.getNum() + " "+ e.getMessage());
				oneImg.put(vo.getNum(), "../maemool/img/noimg.png"); // 留ㅻЪ踰덊샇 : �씠誘몄� 二쇱냼
			}
		}		
		
		req.setAttribute("oneImg", oneImg);
		req.setAttribute("geoList", geoList);
		
		return "../maemool/testSideList.jsp";
	}
	
	/*by.以��쁺*/
	@RequestMapping("main/add_jjim.do")
	public String real_jjim(HttpServletRequest req, HttpServletResponse res) {
		// id�뒗 session�뿉 ���옣�릺�뼱�엳�떎.
		HttpSession session = req.getSession();
		
		//李쒖뿉 �븘�슂�븳 �뜲�씠�꽣 (id�븯怨� 留ㅻЪ踰덊샇)
		String email = (String) session.getAttribute("id");
		String num = req.getParameter("maemool_num");
		
		
		JjimVO vo=new JjimVO();
		
		vo.setEmail(email);
		vo.setNum(Integer.parseInt(num));
		vo.setRegdate(new Date());
		
		System.out.println(email);
		System.out.println(num);
		
		JjimDAO.insertJjim(vo);
		System.out.println("dao �셿猷�");
		
		return "../maemool/jjim.jsp";
	}
	
	/*by.以��쁺*/
	@RequestMapping("main/remove_jjim.do")
	public String remove_jjim(HttpServletRequest req, HttpServletResponse res) {
		// id�뒗 session�뿉 ���옣�릺�뼱�엳�떎.
		HttpSession session = req.getSession();
		
		//李쒖뿉 �븘�슂�븳 �뜲�씠�꽣 (id�븯怨� 留ㅻЪ踰덊샇)
		String email = (String) session.getAttribute("id");
		String num = req.getParameter("maemool_num");
		
		
		Map map=new HashMap();
		
		map.put("email", email);
		map.put("num", num);
		System.out.println(map.get("email"));
		System.out.println(map.get("num"));
		
		JjimDAO.removeJjim(map);
		
		return "../maemool/jjim.jsp";
	}
	
	@RequestMapping("main/jjim_detail.do")
	public String jjim_detail(HttpServletRequest req, HttpServletResponse res) {
		// id�뒗 session�뿉 ���옣�릺�뼱�엳�떎.
		HttpSession session = req.getSession();
		
		//李쒖뿉 �븘�슂�븳 �뜲�씠�꽣 (id�븯怨� 留ㅻЪ踰덊샇)
		String email = (String) session.getAttribute("id");
		String num = req.getParameter("maemool_num");
		
		Map map=new HashMap();
		
		map.put("email", email);
		map.put("num", num);
		System.out.println(map.get("email"));
		System.out.println(map.get("num"));
		
		JjimDAO.removeJjim(map);
		
		
		return "../maemool/jjim.jsp";
	}
	//�븳�넄
	@RequestMapping("main/like.do")
	public String like(HttpServletRequest request, HttpServletResponse response) {
		String nums = "";
		List<MaemoolVO> list = new ArrayList<MaemoolVO>();
		MaemoolVO vo = null;
		MaemoolDAO dao = null;
		int num = 0;
		Cookie[] cookies = request.getCookies();
		System.out.println("�쁽�옱 ���옣�맂 愿��떖紐⑸줉 媛��닔 : " + cookies.length);
	
		if(cookies!=null) {
			for(int i=0; i<cookies.length; i++) {
				Cookie c = cookies[i];
				String cName = c.getName();
				System.out.println(cName);
				if (cName.startsWith("cookNo")) {

				nums=c.getValue();
				System.out.println(nums);
				dao = new MaemoolDAO();
				num = Integer.parseInt(nums);
				vo = dao.cookie(num);
				
				}
				
			}
		}
		request.setAttribute("vo", vo);
		//request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../like/like.jsp");
		return "main.jsp";
	}
	// by. �븳�넄
	@RequestMapping("main/like_add.do")
	public String LikeAdd(HttpServletRequest request, HttpServletResponse response) {
/*		// 愿��떖紐⑸줉 by.�븳�넄
		String num = request.getParameter("num");
		System.out.println(num);
		Cookie c = new Cookie("cookNo", num);
		c.setMaxAge(0);
		// cookie.setPath("C:\\GaBang\\gb"); //荑좏궎�쓽 踰붿쐞 �꽕�젙
		response.addCookie(c); // 荑좏궎瑜� ���옣
		System.out.println(c);*/
		
		
		String no = request.getParameter("num");
		System.out.println("�뙆�씪誘명꽣 num : " + no);
		Cookie[] cookies = request.getCookies();
		String name = "";
		String ss = "";
		int num = Integer.parseInt(no);
		/*******************************************************/
//		for (Cookie c : cookies) {
//			System.out.println("�쁾荑좏궎 �씠由� : " + c.getName());
//			System.out.println("荑좏궎 媛� : " + c.getValue());
//			System.out.println("荑좏궎 �쑀吏��떆媛� :" + c.getMaxAge());
//		}

		if (cookies != null) {
			System.out.println("荑좏궎 媛��닔 : " + cookies.length);
			
			for (int i = 0; i < cookies.length; i++) {
				
				Cookie c = cookies[i];
				String cName = c.getName();
				System.out.println("cookies["+i+"] �씠由� �솗�씤 : " + cookies[i].getName());
				System.out.println("cookies["+i+"] 媛� �솗�씤 : " + cookies[i].getValue());
				System.out.println("cookies["+i+"] �떆媛� �솗�씤 : " + cookies[i].getMaxAge());
				
				if (cName.startsWith("cookNo")) {
					String cValue = c.getValue();
					ss = cName.replaceAll("[^0-9]", "");
					System.out.println("cName.startsWith(\"cookNo\") ss = " + ss);
				} else {
					name = "cookNo"+ no;
					ss = "0";
				}
			}
			
			/***************�씠 遺�遺� �븳踰� �솗�씤�빐二쇱꽭�슂***************/
			int a = Integer.parseInt(ss);
			System.out.println("ss=" + ss);
			/*******************************************************/
			name ="cookNo"+no;
		}
		// 荑좏궎媛� null�씪 寃쎌슦
		else {
			name = "cookNo"+ num;
		}
		Cookie c = new Cookie(name, no);
		c.setMaxAge(60 * 60 * 24); // 荑좏궎 理쒕� �쑀吏��떆媛� �꽕�젙
		response.addCookie(c);
		
		System.out.println(no+"異붽��셿猷�");
		return "../like/like.jsp";

	}
	@RequestMapping("main/like_delete.do")
	public String LikeDelete(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("num");
		Cookie[] cookies = request.getCookies();
		System.out.println(no);
		if(cookies!=null) {
			for(int i = 0; i<cookies.length; i++) {
				Cookie c = cookies[i]; 
				String cName = c.getName();
				
				if (cName.equals("cookNo"+no)) {
					c.setMaxAge(0); // 荑좏궎 理쒕� �쑀吏��떆媛� �꽕�젙
					System.out.println(c.getMaxAge());
					response.addCookie(c);
					System.out.println("cookNo["+no+"]�궘�젣�셿猷�");

				}
				/////////////////////////////////////

			}
			
		}
		System.out.println("荑좏궎 媛��닔 : " + cookies.length);
		for (Cookie c : cookies) {
			System.out.println("�쁾荑좏궎 �씠由� : " + c.getName());
			System.out.println("荑좏궎 媛� : " + c.getValue());
			System.out.println("荑좏궎 �쑀吏��떆媛� :" + c.getMaxAge());
		}
		
		
		return "../like/like.jsp";
	}
}
