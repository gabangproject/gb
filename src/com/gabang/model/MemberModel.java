package com.gabang.model;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	public String LoginData(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "main.jsp";
	}
	
	@RequestMapping("main/login_ok.do")
	public String LoginOk(HttpServletRequest request) throws Exception
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
			session.setAttribute("email", email);
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
	public String reLogin(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
		MemberVO vo=new MemberVO();
		System.out.println(email);
		vo.setLogin(0);
		vo.setEmail(email);
		MemberDAO.loginState(vo);
		//request.setAttribute("main_jsp", "home.jsp");
		return "main.do";
	}
	
	
	@RequestMapping("main/logout.do")
	public String logout(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		
		String email=(String) session.getAttribute("email");
		System.out.println("email:"+email);
		
		
		MemberVO vo=new MemberVO();
		vo.setEmail(email);
		vo.setLogin(0);
		MemberDAO.loginState(vo);
		
		session.removeAttribute("email");
		session.removeAttribute("nick");
		session.removeAttribute("grade");
		
		//session.invalidate();
		
		
		request.setAttribute("main_jsp", "home.jsp");
		return "main.do";
	}
	
	
	
	@RequestMapping("main/check_ok.do")
	public String idCheck(HttpServletRequest request) throws UnsupportedEncodingException
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
	public String nickCheck(HttpServletRequest request)
	{
		String nick=request.getParameter("nick");
		int count=MemberDAO.nickCheck(nick);
		
		request.setAttribute("count", count);
		return "../member/check.jsp";
	}
	
	@RequestMapping("main/license_ok.do")
	public String licenseCheck(HttpServletRequest request)
	{
		String license=request.getParameter("license");
		int count=MemberDAO.licenseCheck(license);
		
		request.setAttribute("count", count);
		return "../member/check.jsp";
	}
	
	@RequestMapping("main/compTel_ok.do")
	public String compTelCheck(HttpServletRequest request)
	{
		String compTel=request.getParameter("compTel");
		int count=MemberDAO.compTelCheck(compTel);
		
		request.setAttribute("count", count);
		return "../member/check.jsp";
	}
	
	@RequestMapping("main/phone_ok.do")
	public String phoneCheck(HttpServletRequest request)
	{
		String phone=request.getParameter("phone");
		int count=MemberDAO.phoneCheck(phone);
		
		request.setAttribute("count", count);
		return "../member/check.jsp";
	}
	
	@RequestMapping("main/maemul_upload.do")
	public String maemul_upload(HttpServletRequest request)
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
	public String JoinData(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "main.jsp";
	}
	
	@RequestMapping("main/join_ok.do")
	public String insertMemberData (HttpServletRequest request) throws IOException 
	{
		request.setCharacterEncoding("EUC-KR");
		
		String path="c:\\download";
		int size=1024*1024*100;
		String enctype="EUC-KR";
		
		MultipartRequest mr=new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
		
		MemberVO vo=new MemberVO();
		
		String email=mr.getParameter("email");
		//email=email.substring(0,email.indexOf("@"))+"\\"+email.substring(email.indexOf("@"));
		
		vo.setEmail(email);
		vo.setPwd(mr.getParameter("password"));
		vo.setName(mr.getParameter("name"));
		vo.setNick(mr.getParameter("nick"));
		vo.setPhone(mr.getParameter("phone"));
		vo.setGender(mr.getParameter("gender"));
		String grade=mr.getParameter("seller");
		
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
			
			//DefaultFileRenamePolicy() => 파일명 바꿔주는 것
			
			
			
			SellerVO vo1=new SellerVO();
			vo1.setLicense(mr.getParameter("license"));
			vo1.setEmail(email);
			vo1.setComp_tel(mr.getParameter("compTel"));
			vo1.setComp_name(mr.getParameter("comp_name"));
			vo1.setAddr(mr.getParameter("address")+mr.getParameter("detailAddress"));
			vo1.setIntro(mr.getParameter("intro"));
			
			//파일 원본 이름 저장
			String fileName=mr.getOriginalFileName("pic");
						
			/*File folder=new File("c:\\download");
			String[] listFiles=folder.list(new FilenameFilter() {
				
				@Override
				public boolean accept(File dir, String name) {
					
					return name.startsWith(fileName);
				}
			});*/
			
			
			//확장자 저장
			String ext=fileName.substring(fileName.indexOf("."));
			
			
			System.out.println(ext);
			
			// 업로드가 없는 경우
		    if(fileName==null)
		    {
		    	vo1.setPic("");
		    	
		    }
		    // 업로드된 상태 
		    else
		    {
		    	
		    	File f=new File("c:\\download\\"+fileName);
		    	//닉네임으로 파일명 변경
		    	File newFile=new File("c:\\download\\"+email+ext);
		    	f.renameTo(newFile);
		    	
		    	System.out.println(f.getName());
		    	vo1.setPic(email+ext);
		    }
			
			
	
			
			MemberDAO.insertSeller(vo1);
			
			/*System.out.println(vo1.getLicense());
			System.out.println(vo1.getComp_name());
			System.out.println(vo1.getComp_tel());
			System.out.println(vo1.getAddr());*/
			
			
		}
		

		/*System.out.println(vo.getEmail());
		System.out.println(vo.getPwd());
		System.out.println(vo.getName());
		System.out.println(vo.getNick());
		System.out.println(vo.getPhone());
		System.out.println(vo.getGender());
		System.out.println(vo.getGrade());*/

		
		request.setAttribute("main_jsp", "home.jsp");
		return "main.jsp";
	}

}
