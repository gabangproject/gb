package com.gabang.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private List<String> list=new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		// XML의 경로 받기
		String path=config.getInitParameter("contextConfigLocation");
	    WebApplicationContext wc=
	    		new WebApplicationContext(path);
	    list=wc.clist;
	    // com.sist.model.BoardModel
	    // com.sist.model.ModelModel
	}
    // board/list.do
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd=request.getRequestURI();
		cmd=cmd.substring(request.getContextPath().length()+1);		
		try
		{
			// com.sist.model.BoardModel
		    // com.sist.model.ModelModel
			for(String cls:list)
			{
				Class clsName=Class.forName(cls);
				// isAnnotationPresent: 어노테이션 존재여부 확인
				if(clsName.isAnnotationPresent(Controller.class)==false)
					  continue;
				
				// 존재 => 메모리 할당
				Object obj=clsName.newInstance();
				// 메소드 찾기
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods)
				{
					//System.out.println(m.getName());
					RequestMapping rm=m.getAnnotation(RequestMapping.class);					
					if(cmd.equals(rm.value()))
					{
						String jsp=(String)m.invoke(obj, request, response);
						if(jsp.startsWith("redirect"))
						{
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
						}
						else
						{
							RequestDispatcher rd=
									request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
						return;
					}
				}
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}

}








