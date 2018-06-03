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

	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	public static int maemoolNum() {
		SqlSession session = null;
		int maemoolNum = 0;
		try {
			session = ssf.openSession();
			maemoolNum = session.selectOne("maemoolNum");

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return maemoolNum;
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

	public static List<ImgVO> maemoolImage(int num)
	{
		SqlSession session=null;
		List<ImgVO> list=new ArrayList<ImgVO>();
		try {
		
				
				session=ssf.openSession();
				list=session.selectList("imgFind", num);
				
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
		
		return list;
		
	}
	
	public static void insertMaemool(MaemoolVO vo1, BuildingTypeVO vo2, DealTypeVO vo3, PropertyAddrVO vo4,RoomTypeVO vo5) 
	{
		SqlSession session = null;

		try {
			
		
		
			session = ssf.openSession(true);

			session.insert("insertMaemool", vo1);
			session.insert("insertBuildingType", vo2);
			session.insert("insertDealType", vo3);
			session.insert("insertPropertyAddr", vo4);
			session.insert("insertRoomType", vo5);

		} catch (Exception ex) {

			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	

	public static List<ImgVO> detailMaemool(int num) {
		SqlSession session = null;
		List<ImgVO> list = new ArrayList<ImgVO>();
		try {

			session = ssf.openSession();
			list = session.selectList("imgFind", num);

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println("maemool Image finally");
		return list;
	}

	// 매물 상세정보

	public static MaemoolVO infoMaemool(int num)
	{
		MaemoolVO vo = new MaemoolVO();

		SqlSession session = null;
		
		try
		{	
			
			session=ssf.openSession();
			vo=session.selectOne("infoFind",num);
			System.out.println("여기 문제구만");
		}
		catch (Exception ex)
		{
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	///////////////////박한솔 - 쿠키 사용////////////////////////
	public MapVO cookie(int num) {
		MapVO vo = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("cookie", num);

		} catch (Exception e) {
			System.out.println("cookie : " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	///////////////////박한솔 - 쿠키 사용////////////////////////
	/*
	 * day: 2018.05.29 who: t
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
	
	//deal_type 데이터 가져오기
	public static DealTypeVO getDealType(int num) {
		DealTypeVO vo=null;
		SqlSession session = null;

		try {
			session = ssf.openSession();
			vo = session.selectOne("getDealType",num);
		} catch (Exception e) {
			System.out.println("MaemoolDAO - getDealType : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}
	
	//room_type 데이터 가져오기
	public static RoomTypeVO getRoomType(int num) {
		RoomTypeVO vo=null;
		SqlSession session = null;

		try {
			session = ssf.openSession();
			vo = session.selectOne("getRoomType",num);
		} catch (Exception e) {
			System.out.println("MaemoolDAO - getRoomType : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}
	
}
