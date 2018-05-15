package com.sist.controller;
import java.io.File;
import java.util.*;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
/*
 *   XML : 설정파일  => 공유
 *   ===
 *    => 설정 내용 읽기
 *       JAXP (파싱) 
 *           = DOM
 *           = SAX
 *       JAXB (객체<=>XML) : 빅데이터 출력 
 */
public class WebApplicationContext {
   public List<String> clist=new ArrayList<String>();
   public static void main(String[] arg)
   {
	   WebApplicationContext wc=
			   new WebApplicationContext("C:\\webDev\\webStudy3\\MusicMVCProject\\WebContent\\WEB-INF\\applicationContext.xml");
   }
   public WebApplicationContext(String path)
   {
	   //path=xml 경로 => HandlerMapping (XML 파싱)
	   try
	   {
		   SAXParserFactory spf=
				   SAXParserFactory.newInstance();
		   // 파서기
		   SAXParser sp=spf.newSAXParser();
		   HandlerMapping hm=new HandlerMapping();
		   sp.parse(new File(path), hm);
		   List<String> list=hm.list;
		   FileConfig fc=new FileConfig();
		   for(String pack:list)
		   {
			   //System.out.println(pack);
			   List<String> fList=fc.componentScan(pack);
			   for(String s:fList)
			   {
				   //System.out.println(s);
				   clist.add(s);
				   
			   }
		   }
		   
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
   }
}


