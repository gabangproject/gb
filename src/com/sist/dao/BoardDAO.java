package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;// XML���� �б� = �Ľ̿�û 
/*
 *    class A
 *    {
 *       private static int a;
 *       static
 *       {
 *          a=10;
 *       }
 *    }
 *    class A
 *    {
 *       private static int a=10;
 *      
 *    }
 *    class A
 *    {
 *       private static int a;
 *       static
 *       {
 *          for(int i=0;i<10;i++)
 *          {
 *             a=i;
 *          }
 *       }
 *    }
 */
public class BoardDAO {
   private static SqlSessionFactory ssf;
   // SqlSessionFactory = XML�� �о �Ľ��� �ϴ� Ŭ������ (SAX)
   static // static �� : static������ ���� �ʱ�ȭ 
   {
	   try
	   {
		   // XML�б�
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   // Config.xml => mapper.xml
		   // �Ľ̿�û 
		   ssf=new SqlSessionFactoryBuilder().build(reader);
		   // ssf => getConnection(),disConnection()
		   // Spring,MyBatis ==> classpath:SRC
	   }catch(Exception ex)
	   {
		   System.out.println("boardDAO : " + ex.getMessage());
	   }
   }
   // ��� �б�
   //            ������  (resultType)   �Ű�����(parameterType)
   public static List<BoardVO> boardListData(Map map) 
   {
	   List<BoardVO> list=new ArrayList<BoardVO>();
	   SqlSession session=null;//connection����=>sql������� 
	   try
	   {
		   //session ���� = connection���� => getConnection()
		   session=ssf.openSession();
		   // openSession() => openSession(true)
		   // autoCommit(false)   autoCommit(true)
		   // ���� ����� �ޱ� 
		   list=session.selectList("boardListData", map);
	   }catch(Exception ex)
	   {
		   System.out.println("boardListData : " +ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return list;
   }
   public static int boardTotalPage()
   {
	   int total=0;
	   SqlSession session=null;
	   try
	   {
		   // connection �ּ� �б�
		   session=ssf.openSession();
		   total=session.selectOne("boardTotalPage");
	   }catch(Exception ex)
	   {
		   System.out.println("boardTotalPage : " + ex.getMessage());
	   }
	   finally
	   {
		   // connection ��ȯ
		   if(session!=null)
			   session.close();
	   }
	   return total;
   }
   // �߰� 
   /*
    *   public void freeboardInsert(FreeBoardVO vo)
	   {
		   try
		   {
			   getConnection();
			   String sql="INSERT INTO freeboard VALUES("
					     +"(SELECT NVL(MAX(no)+1,1) FROM freeboard),"
					     +"?,?,?,?,SYSDATE,0)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getSubject());
			   ps.setString(3, vo.getContent());
			   ps.setString(4, vo.getPwd());
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
	   }
    */
   public static void boardInsert(BoardVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);
		   // autoCommit(true)
		   session.insert("boardInsert",vo);
	   }catch(Exception ex)
	   {
		   System.out.println("boardInsert :" +ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
   }
   //���뺸��
   public static BoardVO boardContentData(int no) {
	   BoardVO vo = new BoardVO();
	   SqlSession session=null;
	   try {
		   session=ssf.openSession();
		   session.update("hitIncrement",no);
		   session.commit();
		   vo = session.selectOne("boardContentData", no);
		   
	   }catch (Exception e) {
		   System.out.println("boardContentData : " +e.getMessage());
	   }finally {
		   if(session!=null) {
			   session.close();
		   }
	   }
	   return vo;
   }
   public static BoardVO boardUpdateData(int no) {
	   BoardVO vo = new BoardVO();
	   SqlSession session=null;
	   try {
		   session=ssf.openSession();
		   vo = session.selectOne("boardContentData", no);
		   
	   }catch (Exception e) {
		   System.out.println("boardUpdateData : " +e.getMessage());
	   }finally {
		   if(session!=null) {
			   session.close();
		   }
	   }
	   return vo;
   }
   public static boolean boardUpdate(BoardVO vo) {
	   boolean bCheck= false;
	   SqlSession session = null;
	   try {
		   session=ssf.openSession();
		   String pwd = session.selectOne("boardGetPwd",vo.getNo());
		   if(pwd.equals(vo.getPwd())) {
			   bCheck=true;
			   //UPDATE
			   session.update("boardUpdate",vo);
			   session.commit();
		   }else {
			   bCheck=false;
		   }
	   }catch (Exception e) {
		   System.out.println("boardUpdate : " +e.getMessage());
	   }finally {
		   if(session!=null) {
			   session.close();
		   }
	   }
	   return bCheck;
   }
   
   public static String boardGetPwd(int no) {
	   String pwd = "";
	   SqlSession session = null;
	   try {
		   session = ssf.openSession();
		   pwd = session.selectOne("boardGetPwd", no);
	   }catch (Exception e) {
		   System.out.println("boardGetPwd : " +e.getMessage());
	   }finally {
		   if(session!= null)
			   session.close();
	   }
	   return pwd;
   }
   public static void boardDelete(int no) {
	   SqlSession session = null;
	   try {
		   session = ssf.openSession(true);
		   session.delete("boardDelete",no);
	   }catch (Exception e) {
		   System.out.println("boardDelete : " + e.getMessage());
	   }finally {
		   if(session!=null) {
			   session.close();
		   }
	   }
   }
}