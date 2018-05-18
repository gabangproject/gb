package com.gabang.vo;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.gabang.vo.*;

import java.io.*;// XML���� �б� = �Ľ̿�û 

public class NoticeDAO {
   private static SqlSessionFactory ssf;
   static 
   {
	   try
	   {
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	   }catch(Exception ex)
	   {
		   System.out.println("noticeDAO : " + ex.getMessage());
	   }
   }
   
   // ��� �б�
   public static List<NoticeVO> noticeListData(Map map) 
   {
	   List<NoticeVO> list=new ArrayList<NoticeVO>();
	   SqlSession session=null;//connection����=>sql������� 
	   try
	   {
		   session=ssf.openSession();

		   // ���� ����� �ޱ� 
		   list=session.selectList("noticeListData", map);
	   }catch(Exception ex)
	   {
		   System.out.println("noticeListData : " +ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return list;
   }
   //��Ż������
   public static int noticeTotalPage()
   {
	   int total=0;
	   SqlSession session=null;
	   try
	   {
		   // connection �ּ� �б�
		   session=ssf.openSession();
		   total=session.selectOne("noticeTotalPage");
	   }catch(Exception ex)
	   {
		   System.out.println("noticeTotalPage : " + ex.getMessage());
	   }
	   finally
	   {
		   // connection ��ȯ
		   if(session!=null)
			   session.close();
	   }
	   return total;
   }
   // �۾���
   public static void noticeInsert(NoticeVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);
		   // autoCommit(true)
		   session.insert("noticeInsert",vo);
	   }catch(Exception ex)
	   {
		   System.out.println("noticeInsert :" +ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
   }

   //���뺸��
   public static NoticeVO noticeContentData(int no) {
	   NoticeVO vo = new NoticeVO();
	   SqlSession session=null;
	   try {
		   session=ssf.openSession();
		   vo = session.selectOne("noticeContentData", no);
		   
	   }catch (Exception e) {
		   System.out.println("noticeContentData : " +e.getMessage());
	   }finally {
		   if(session!=null) {
			   session.close();
		   }
	   }
	   return vo;
   }

 	//�����ϱ�
   public static NoticeVO noticeUpdateData(int no) {
	   NoticeVO vo = new NoticeVO();
	   SqlSession session=null;
	   try {
		   session=ssf.openSession();
		   vo = session.selectOne("noticeContentData", no);
		   
	   }catch (Exception e) {
		   System.out.println("NoticeUpdateData : " +e.getMessage());
	   }finally {
		   if(session!=null) {
			   session.close();
		   }
	   }
	   return vo;
   }
   public static void noticeUpdate(NoticeVO vo) {
	   boolean bCheck= false;
	   SqlSession session = null;
	   try {
		   session=ssf.openSession(true);
		   session.update("noticeUpdate",vo);
	   }catch (Exception e) {
		   System.out.println(e.getMessage());
	   }finally {
		   if(session!=null) {
			   session.close();
		   }
	   }
   }

   public static void noticeDelete(int no) {
	   SqlSession session = null;
	   try {
		   session = ssf.openSession(true);
		   session.delete("noticeDelete",no);
	   }catch (Exception e) {
		   System.out.println("noticeDelete : " + e.getMessage());
	   }finally {
		   if(session!=null) {
			   session.close();
		   }
	   }
   }

   
}