package com.sist.controller;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
/*
 *    서버 가동 
 *    
 *    1. web.xml
 *       ======= applicationContext.xml  
 *       => WebApplicationContext (XML 경로명 받기)
 *       => XML을 HandlerMapping (XML 파싱)
 *       => FileConfig(클래스형을 만든다)
 *       => DispatcherServlet
 *    2. applicationContext.xml 
 */
import java.util.*;
public class HandlerMapping extends DefaultHandler{
    List<String> list=new ArrayList<String>();

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		// qName : 태그이름 
		// attribute : 속성값을 얻기
		if(qName.equals("context:component-scan"))
		{
			String pack=attributes.getValue("base-package");
			list.add(pack);
		}
	}
    
}











