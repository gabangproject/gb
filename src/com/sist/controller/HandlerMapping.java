package com.sist.controller;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
/*
 *    ���� ���� 
 *    
 *    1. web.xml
 *       ======= applicationContext.xml  
 *       => WebApplicationContext (XML ��θ� �ޱ�)
 *       => XML�� HandlerMapping (XML �Ľ�)
 *       => FileConfig(Ŭ�������� �����)
 *       => DispatcherServlet
 *    2. applicationContext.xml 
 */
import java.util.*;
public class HandlerMapping extends DefaultHandler{
    List<String> list=new ArrayList<String>();

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		// qName : �±��̸� 
		// attribute : �Ӽ����� ���
		if(qName.equals("context:component-scan"))
		{
			String pack=attributes.getValue("base-package");
			list.add(pack);
		}
	}
    
}











