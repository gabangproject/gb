package com.gabang.vo;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	
	public static void insertMaemool(MaemoolVO vo1,BuildingTypeVO vo2,DealTypeVO vo3,PropertyAddrVO vo4,RoomTypeVO vo5)
	{
		SqlSession session=null;
		
		try {
			
			session=ssf.openSession(true);
			
			session.insert("insertMaemool",vo1);
			session.insert("insertBuildingType",vo2);
			session.insert("insertDealType",vo3);
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
	
	public static void insertImage(ImgVO vo)
	{
		SqlSession session=null;
		
		try 
		{
			session=ssf.openSession(true);
			session.insert("insertImg",vo);

		}
	
		catch(Exception ex)

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
		MaemoolVO vo = null;
		SqlSession session=null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("cookie" , num);
			
		}catch (Exception e) {
			System.out.println("cookie : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	/*
	 *	day: 2018.05.29
	 *	who: t
	 */
	// 저보증금
	public static List<MapVO> getDepositInfo() {
		List<MapVO> list = new ArrayList<MapVO>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("getDepositInfo");
		} catch (Exception e) {
			System.out.println("MaemoolDAO - getDepositInfo : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}		
		return list;
	}
	
	// 주차 가능
	public static List<MapVO> getParkingInfo(Map<String, Object> map) {
		List<MapVO> list = new ArrayList<MapVO>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("getParkingInfo",map);
		} catch (Exception e) {
			System.out.println("MaemoolDAO - getParkingInfo : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}		
		return list;
	}
	
	public static int parkingTotalPage() {		
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("parkingTotalPage");
		} catch (Exception e) {
			System.out.println("MaemoolDAO - parkingTotalPage : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}		
		return total;
	}
	
	// 원룸
	public static List<MapVO> getOneRoomInfo() {
		List<MapVO> list = new ArrayList<MapVO>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("getOneRoomInfo");
		} catch (Exception e) {
			System.out.println("MaemoolDAO - getOneRoomInfo : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}		
		return list;
	}
	
	// 오피스텔
	public static List<MapVO> getOfficetelInfo() {
		List<MapVO> list = new ArrayList<MapVO>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("getOfficetelInfo");
		} catch (Exception e) {
			System.out.println("MaemoolDAO - getOfficetelInfo : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}		
		return list;
	}
}
