package com.gabang.model;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

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
		int loginIdCheck=MemberDAO.loginIdCheck(email);
		
		String state="";
		
		//id가 있으면
		if(loginIdCheck==1)
		{
			//비밀번호 체크
			MemberVO vo=new MemberVO();
			vo=MemberDAO.loginPwdCheck(email);
			
			String db_pwd=vo.getPwd();
			String nick=vo.getNick();
			int grade=vo.getGrade();
			
			/*System.out.println(pwd);
			System.out.println(db_pwd);*/
			
			//비번 체크
			if(pwd.equals(db_pwd))
			{
				HttpSession session=request.getSession();
				session.setAttribute("id", email);
				session.setAttribute("nick", nick);
				session.setAttribute("grade", grade);
				
				state="OK";
				request.setAttribute("state", state);
				
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
	
	
	@RequestMapping("main/logout.do")
	public String logout(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		
		request.setAttribute("main_jsp", "home.jsp");
		return "main.jsp";
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
		case "email":    count=MemberDAO.loginIdCheck(param);
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
		email=email.substring(0,email.indexOf("@"))+"\\"+email.substring(email.indexOf("@"));
		
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
			String fileName=mr.getOriginalFileName("pic");
			// 업로드가 없는 경우
		    if(fileName==null)
		    {
		    	vo1.setPic("");
		    	vo1.setPic_size(0);
		    }
		    // 업로드된 상태 
		    else
		    {
		    	//file의 크기를 저장할 때는 file의 길이를 인트로 변환해서 사이즈를 측정
		    	vo1.setPic(fileName);
		    	File f=new File(path+"\\"+fileName);
		    	vo1.setPic_size((int)f.length());
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
