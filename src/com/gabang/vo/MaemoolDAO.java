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
	public static MaemoolVO infoMaemool(MaemoolVO vo)
	{
		MaemoolVO vo1 = new MaemoolVO();
		SqlSession session = null;
		try
		{
			session=ssf.openSession();
			vo1=session.selectOne("infoFind",vo);
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
