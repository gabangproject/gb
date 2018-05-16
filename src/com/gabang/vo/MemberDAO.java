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
	   
	   public static int idCheck(String email) 
	   {
		   int idCheck=0;
		   SqlSession session=null;//connection연결=>sql문장수행 
		   try
		   {
			   
			   
			   session=ssf.openSession();

			   // 실행 결과값 받기 
			   idCheck=session.selectOne("idCheck", email);
		   }catch(Exception ex)
		   {
			   System.out.println("boardListData : " +ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return idCheck;
	   }
	   
	   public static MemberVO pwdCheck(String email)
	   {
		   MemberVO vo=new MemberVO();
		   SqlSession session=null;//connection연결=>sql문장수행 
		   try
		   {
			   
			   session=ssf.openSession();

			   // 실행 결과값 받기 
			   vo=session.selectOne("pwdCheck", email);
		   }catch(Exception ex)
		   {
			   System.out.println("boardListData : " +ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return vo;
	   }
	
	
}
