package com.sist.controller;
// com.sist.model 
/*
 *   ListModel
 *   InsertModel
 *   UpdateModel
 *   Model (interface)
 *      => com.sist.model.ListModel
 *      String s="new String()"
 */
import java.util.*;
import java.io.*;
public class FileConfig {
   // C:\webDev\webStudy2\MVCXMLProject4\src\com\sist\model
   public static void main(String[] arg)
   {
	   FileConfig fc=new FileConfig();
	   fc.componentScan("com.sist.model");
   }
   public List<String> componentScan(String pack)
   {
	   List<String> list=new ArrayList<String>();
	   try
	   {
		   String basePath="C:\\webDev\\webStudy3\\FinalMVCProject";//System.getProperty("user.dir");
		   System.out.println(basePath);
		   String strPack=basePath+"\\src\\"+pack.replace(".", "\\");
		   System.out.println(strPack);
		   File dir=new File(strPack);
		   File[] files=dir.listFiles();
		   for(File f:files)
		   {
			   //System.out.println(f.getName());
			   String ext=f.getName().substring(f.getName().lastIndexOf(".")+1);
			   //System.out.println("================");
			   if(ext.equals("java"))
			   {
				   //System.out.println("´ë»ó:"+f.getName());
				   String data=pack+"."
				      +f.getName().substring(0,f.getName().lastIndexOf("."));
				   //System.out.println(data);
				   list.add(data);
			   }
		   }
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   return list;
   }
}






















