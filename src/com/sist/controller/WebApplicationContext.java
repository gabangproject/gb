package com.sist.controller;
import java.io.File;
import java.util.*;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
/*
 *   XML : ��������  => ����
 *   ===
 *    => ���� ���� �б�
 *       JAXP (�Ľ�) 
 *           = DOM
 *           = SAX
 *       JAXB (��ü<=>XML) : ������ ��� 
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
	   //path=xml ��� => HandlerMapping (XML �Ľ�)
	   try
	   {
		   SAXParserFactory spf=
				   SAXParserFactory.newInstance();
		   // �ļ���
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


