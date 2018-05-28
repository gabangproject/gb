package com.gabang.vo;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MaemoolDAO {
	
	private static SqlSessionFactory ssf;
	
	static
	{
		try 
		{
			
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
			
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	
	public static void insertMaemool(ImgVO vo)
	{
		SqlSession session=null;
		
		try {
			
			session=ssf.openSession(true);
			session.insert("insertImg",vo);
			
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	public MaemoolVO cookie(int num) {
		MaemoolVO vo = new MaemoolVO();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			session.selectList("cookie",num);
			
		}catch (Exception e) {
			
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
}
