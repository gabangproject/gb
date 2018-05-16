package com.gabang.vo;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.gabang.vo.BoardVO;

import java.io.*;// XML파일 읽기 = 파싱요청 

public class BoardDAO {
   private static SqlSessionFactory ssf;
   static 
   {
	   try
	   {
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	   }catch(Exception ex)
	   {
		   System.out.println("boardDAO : " + ex.getMessage());
	   }
   }
   
   // 목록 읽기
   public static List<BoardVO> boardListData(Map map) 
   {
	   List<BoardVO> list=new ArrayList<BoardVO>();
	   SqlSession session=null;//connection연결=>sql문장수행 
	   try
	   {
		   session=ssf.openSession();

		   // 실행 결과값 받기 
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
		   // connection 주소 읽기
		   session=ssf.openSession();
		   total=session.selectOne("boardTotalPage");
	   }catch(Exception ex)
	   {
		   System.out.println("boardTotalPage : " + ex.getMessage());
	   }
	   finally
	   {
		   // connection 반환
		   if(session!=null)
			   session.close();
	   }
	   return total;
   }

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
/*
   //내용보기
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
   }*/
}