package com.gabang.vo;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class PropertyAddrDAO {
	public static SqlSessionFactory ssf;
	
	static {
		try {
			Reader rd = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(rd);
		} catch (Exception e) {
			System.out.println("PropertyAddrDAO 초기화 : " + e.getMessage());
		}
	}
/*	>> 호출 안 되는 메소드
 	public static List<MapVO> getGeoInfo() {
	List<MapVO> list = new ArrayList<MapVO>();
	SqlSession session = null;
	
	try {
		session = ssf.openSession();
		list = session.selectList("getGeoInfo_temp");
	} catch (Exception e) {
		System.out.println("PropertyAddrDAO - getGeoInfo : " + e.getMessage());
	} finally {
		if (session != null) {
			session.close();
		}
	}
	
	return list;
}*/		
	
	public static List<MapVO> searchMaemool(String keyword) {
		List<MapVO> list = new ArrayList<MapVO>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("searchMaemool", keyword);
		} catch (Exception e) {
			System.out.println("PropertyAddrDAO - searchMaemool : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		
		return list;
	}
	
	public static List<ImgVO> imgFind(int num) {
		List<ImgVO> list = new ArrayList<ImgVO>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("imgFind", num);
		} catch (Exception e) {
			System.out.println("PropertyAddrDAO - imgFind : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		
		return list;
	}
	
	public static PropertyAddrVO jjimProperty(int num) {
		PropertyAddrVO vo = null;
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			vo = session.selectOne("jjimListProperty", num);
		} catch (Exception e) {
			System.out.println("PropertyAddrDAO - jjimListProperty : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		
		return vo;
	}
}
