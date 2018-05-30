package com.gabang.model;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import com.gabang.controller.Controller;
import com.gabang.controller.RequestMapping;
import com.gabang.vo.MemberDAO;
import com.gabang.vo.MemberVO;
import com.gabang.vo.SellerVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.xml.internal.ws.client.SenderException;




@Controller
public class MemberModel {
	
	
	@RequestMapping("main/login.do")
	public String LoginData(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "main.jsp";
	}
	
	@RequestMapping("main/login_ok.do")
	public String LoginOk(HttpServletRequest request, HttpServletResponse response) throws Exception
	{	
		request.setCharacterEncoding("EUC-KR");

		String email=request.getParameter("email").toLowerCase();
		String pwd=request.getParameter("pwd");
		

		//id 존재 여부 체크
		int emailCheck=MemberDAO.emailCheck(email);
		
		String state="";
		
		//id가 있으면
		if(emailCheck==1)
		{
			//비밀번호 체크
			MemberVO vo=new MemberVO();
			vo=MemberDAO.pwdCheck(email);
			
			String db_pwd=vo.getPwd();
			String nick=vo.getNick();
			int grade=vo.getGrade();
			int login=vo.getLogin();
			/*System.out.println(pwd);
			System.out.println(db_pwd);*/
			HttpSession session=request.getSession();
			session.setAttribute("id", email);
			//비번 체크
			if(pwd.equals(db_pwd))
			{
				if(login==0)
				{
				
				
				session.setAttribute("nick", nick);
				session.setAttribute("grade", grade);
				//로그인 상태 변환
				vo.setEmail(email);
				vo.setLogin(1);
				MemberDAO.loginState(vo);
				
				state="OK";
				request.setAttribute("state", state);
				}
				else
				{
					state="ALREADY";
					request.setAttribute("state", state);
				}
				
			}
			else 
			{	
				state="NOPWD";
				request.setAttribute("state", state);
				
			}
			
		}
		else 
		{
			state="NOID";
			request.setAttribute("state", state);
		}
		
		
		
		return "../member/login_ok.jsp";
	}
	
	@RequestMapping("main/reLogin.do")
	public String reLogin(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("id");
		MemberVO vo=new MemberVO();
		System.out.println(email);
		vo.setLogin(0);
		vo.setEmail(email);
		MemberDAO.loginState(vo);
		//request.setAttribute("main_jsp", "home.jsp");
		return "main.do";
	}
	
	
	@RequestMapping("main/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		
		String email=(String) session.getAttribute("id");
		System.out.println("email:"+email);
		
		
		MemberVO vo=new MemberVO();
		vo.setEmail(email);
		vo.setLogin(0);
		MemberDAO.loginState(vo);
		
		session.removeAttribute("id");
		session.removeAttribute("nick");
		session.removeAttribute("grade");
		
		//session.invalidate();		
		
		request.setAttribute("main_jsp", "home.jsp");
		return "redirect:main.do";
	}
	
	
	
	@RequestMapping("main/check_ok.do")
	public String idCheck(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");
		String param=request.getParameter("param");
		String checker=request.getParameter("checker");
		int count=0;
		
		/*System.out.println(param);
		System.out.println(checker);*/
		
		switch(checker)
		{
		case "email":    count=MemberDAO.emailCheck(param);
					     break;
		
		case "nick":     count=MemberDAO.nickCheck(param);
					     break;
					     
		case "phone":    count=MemberDAO.phoneCheck(param);
						 break;
					 
		case "license":  count=MemberDAO.licenseCheck(param);
		 			     break;
		 
		case "comp_tel": count=MemberDAO.compTelCheck(param);
						 break;
		 
		}
		

		request.setAttribute("count", count);
		return "../member/check.jsp";
	}
	
	@RequestMapping("main/nick_ok.do")
	public String nickCheck(HttpServletRequest request, HttpServletResponse response)
	{
		String nick=request.getParameter("nick");
		int count=MemberDAO.nickCheck(nick);
		
		request.setAttribute("count", count);
		return "../member/check.jsp";
	}
	
	@RequestMapping("main/license_ok.do")
	public String licenseCheck(HttpServletRequest request, HttpServletResponse response)
	{
		String license=request.getParameter("license");
		int count=MemberDAO.licenseCheck(license);
		
		request.setAttribute("count", count);
		return "../member/check.jsp";
	}
	
	@RequestMapping("main/compTel_ok.do")
	public String compTelCheck(HttpServletRequest request, HttpServletResponse response)
	{
		String compTel=request.getParameter("compTel");
		int count=MemberDAO.compTelCheck(compTel);
		
		request.setAttribute("count", count);
		return "../member/check.jsp";
	}
	
	@RequestMapping("main/phone_ok.do")
	public String phoneCheck(HttpServletRequest request, HttpServletResponse response)
	{
		String phone=request.getParameter("phone");
		int count=MemberDAO.phoneCheck(phone);
		
		request.setAttribute("count", count);
		return "../member/check.jsp";
	}
	
	@RequestMapping("main/maemul_upload.do")
	public String maemul_upload(HttpServletRequest request, HttpServletResponse response)
	{
		
		
		String[] deal_type= {"전세","월세"};
		String[] room_type= {"원룸","투룸","복층형","분리형원룸","쓰리룸"};
		String[] building_type= {"다세대/다가구","오피스텔"};
		String[] opt= {"에어컨","냉장고","세탁기","침대","책상","옷장","TV","신발장","냉장고","가스레인지","인덕션","전자레인지","전자도어락","비데","옵션없음"};
		
		request.setAttribute("deal_type", deal_type);
		request.setAttribute("room_type", room_type);
		request.setAttribute("building_type", building_type);
		request.setAttribute("opt", opt);
		request.setAttribute("main_jsp", "../member/maemul_upload.jsp");
		return "main.jsp";
	}
	
	
	@RequestMapping("main/join.do")
	public String JoinData(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "main.jsp";
	}
	
	
	@RequestMapping("main/join_ok.do")
	public String insertMemberData (HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		request.setCharacterEncoding("EUC-KR");
		
		String path="c:\\download";
		int size=1024*1024*100;
		String enctype="EUC-KR";
		
		MultipartRequest mr=new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
																		   //DefaultFileRenamePolicy() => 파일명 바꿔주는 것
		
		MemberVO vo=new MemberVO();
		
		//회원가입 정보 vo에 저장(db로 전달하려고)
		String email=mr.getParameter("email");
		vo.setEmail(email);
		vo.setPwd(mr.getParameter("password"));
		vo.setName(mr.getParameter("name"));
		vo.setNick(mr.getParameter("nick"));
		vo.setPhone(mr.getParameter("phone"));
		vo.setGender(mr.getParameter("gender"));
		String grade=mr.getParameter("seller");
		
		//일반회원 OR 공인중개사 를 grade로 구분 1이면 일반회원
		if(grade==null)
		{
			grade="1";
			
			vo.setGrade(Integer.parseInt(grade));
			MemberDAO.insertMember(vo);
		}
		else
		{
			grade="2";
			vo.setGrade(Integer.parseInt(grade));
			MemberDAO.insertMember(vo);
			

			SellerVO vo1=new SellerVO();
			vo1.setLicense(mr.getParameter("license"));
			vo1.setEmail(email);
			vo1.setComp_tel(mr.getParameter("compTel"));
			vo1.setComp_name(mr.getParameter("comp_name"));
			vo1.setAddr(mr.getParameter("address")+mr.getParameter("detailAddress"));
			vo1.setIntro(mr.getParameter("intro"));
			
			
			//업로드한 중개사 관련 사진의 원본 이름 저장
			String fileName=mr.getOriginalFileName("pic");
		
			// 업로드가 없는 경우
		    if(fileName==null)
		    {
		    	vo1.setPic("");
		    }
		    // 업로드된 상태 
		    else
		    {
		    	//저장되어 있는 사진의 이름을 email명으로 변경
		    	File f=new File("c:\\download\\"+fileName);
		    	File newFile=new File("c:\\download\\"+email);
		    	f.renameTo(newFile);
		    	
		    	
		    	vo1.setPic(email);
		    }
			

			//오라클에 연결해서 seller정보 저장
			MemberDAO.insertSeller(vo1);

			
		}
		

		request.setAttribute("main_jsp", "home.jsp");
		return "main.jsp";
	}

}
