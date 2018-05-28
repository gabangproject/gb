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
	
	public static int maemoolNum()
	{
		SqlSession session=null;
		int maemoolNum=0;
		try {
			
			session=ssf.openSession();
			maemoolNum=session.selectOne("maemoolNum");
			

		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return maemoolNum;
	}
	
	public static void insertMaemool(BuildingTypeVO vo,DealTypeVO vo1,ImgVO vo2,MaemoolVO vo3,PropertyAddrVO vo4,RoomTypeVO vo5)
	{
		SqlSession session=null;
		
		try {
			
			session=ssf.openSession(true);
			session.insert("insertBuildingType",vo);
			session.insert("insertDealType",vo1);
			session.insert("insertImg",vo2);
			session.insert("insertMaemool",vo3);
			session.insert("insertPropertyAddr",vo4);
			session.insert("insertRoomType",vo5);
			

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
	
}
