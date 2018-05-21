package com.gabang.vo;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.gabang.vo.*;

public class MemberDAO {

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
	   
	   public static int loginIdCheck(String email) 
	   {
		   int loginIdCheck=0;
		   SqlSession session=null;//connection연결=>sql문장수행 
		   try
		   {
			   
			   
			   session=ssf.openSession();

			   // 실행 결과값 받기 
			   loginIdCheck=session.selectOne("loginIdCheck", email);
		   }catch(Exception ex)
		   {
			   System.out.println("boardListData : " +ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return loginIdCheck;
	   }
	   
	   public static MemberVO loginPwdCheck(String email)
	   {
		   MemberVO vo=new MemberVO();
		   SqlSession session=null;//connection연결=>sql문장수행 
		   try
		   {
			   
			   session=ssf.openSession();

			   // 실행 결과값 받기 
			   vo=session.selectOne("loginPwdCheck", email);
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return vo;
	   }
	   
	   public static int nickCheck(String nick) 
	   {
		   int nickCheck=0;
		   SqlSession session=null;//connection연결=>sql문장수행 
		   try
		   {
			   
			   
			   session=ssf.openSession();

			   // 실행 결과값 받기 
			   nickCheck=session.selectOne("nickCheck", nick);
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return nickCheck;
	   }
	
	
}
