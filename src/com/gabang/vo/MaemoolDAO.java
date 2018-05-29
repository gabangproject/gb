package com.gabang.vo;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

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
	public static List<ImgVO> detailMaemool(int num)
	{
		SqlSession session=null;
		List<ImgVO> list=new ArrayList<ImgVO>();
		try {
			
			session=ssf.openSession();
			list=session.selectList("imgFind", num);
			
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return list;
	}
	// 매물 상세정보
	public static MaemoolVO infoMaemool(int num)
	{
		MaemoolVO vo1 = new MaemoolVO();
		SqlSession session = null;
		try
		{	
			//int num = vo.getNum();
			session=ssf.openSession();
			vo1=session.selectOne("infoFind",num);
		}
		catch (Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return vo1;
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
