package com.gabang.model;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
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
		
		BuildingTypeVO vo=new BuildingTypeVO();
		DealTypeVO vo1=new DealTypeVO();
		ImgVO vo2=new ImgVO();
		MaemoolVO vo3=new MaemoolVO();
		PropertyAddrVO vo4=new PropertyAddrVO();
		RoomTypeVO vo5=new RoomTypeVO();
		
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
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
		
		//�Ź� �̹��� ���� �޾ƿ��� ���̺귯��
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
						String fileName = session.getAttribute("email")+"//"+item.getName();
						//System.out.println("fieldName:" + fieldName + ", fileName:" + fileName);
						InputStream fileContent = item.getInputStream();
						BufferedImage image = ImageIO.read(fileContent);
						ImageIO.write(image, "jpg", new File(TEMP_PATH + "/" + fileName));
						vo2.setImg(fileName);
						vo2.setNum(maemoolNum);
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//�ŷ� ����
		String deal_type=request.getParameter("deal_type");
		vo1.setType("deal_type");
		vo1.setNum(maemoolNum);
		
		//�ְ� ����
		String room_type=request.getParameter("room_type");
		vo5.setType(Integer.parseInt(room_type));
		vo5.setNum(maemoolNum);
		
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
		
		//�ش���
		String floor1=request.getParameter("floor1");
		//��ü��
		String floor2=request.getParameter("floor2")+"��";
		if((floor1.startsWith("��")||floor1.startsWith("��")));
		{
			floor1=floor1+"��";
		}
		String floor=floor1+"//"+floor2;
		vo3.setFloor(floor);
		
		//������
		String deposit1=request.getParameter("deposit1");
		String deposit2=request.getParameter("deposit2");
		String deposit=deposit1+" ��"+deposit2+" ����";
		vo3.setDeposit(deposit);
		
		//����
		String monthly_rent1=request.getParameter("monthly_rent1");
		if(monthly_rent1!=null)
			{
			monthly_rent1=monthly_rent1 + " ��";
			}
		String monthly_rent2=request.getParameter("monthly_rent2");
		String monthly_rent=monthly_rent1+monthly_rent2+" ����";
		vo3.setMonthly_rent(monthly_rent);
		
		//�������
		String gross_area=request.getParameter("gorss_area");
		int pyeong=(int) Math.round(((Integer.parseInt(gross_area)/3.3)*10)/10);
		
		gross_area=request.getParameter("gorss_area")+"��"+" ("+pyeong+"P)";
		vo3.setGross_area(gross_area);
		
		//���ְ�����
		String moving_date=request.getParameter("moving_date");
		vo3.setMoving_date(moving_date);
		
		//�Ź� ���� ǥ��
		String detail_title=request.getParameter("detail_title");
		vo3.setDetail_title(detail_title);
		//�Ź� �󼼼���
		String description=request.getParameter("description");
		vo3.setDescription(description);
		
		
		MaemoolDAO.insertMaemool(vo, vo1, vo2, vo3, vo4, vo5);
		
		
		
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
}
