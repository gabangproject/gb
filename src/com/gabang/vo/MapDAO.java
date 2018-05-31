package com.gabang.vo;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MapDAO {
	private static SqlSessionFactory ssf;

	static {
		try {
			Reader rd = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(rd);
		} catch (Exception e) {
			System.out.println("PropertyAddrDAO 초기화 : " + e.getMessage());
		}
	}

	
	public static List<MapVO> findMaemoolInBound(Map<String, Object> bound) {
		SqlSession session = null;
		List<MapVO> list = null;

//		System.out.println("★MapDAO의 findMaemoolInBound");
//		System.out.println("bound의 크기 : " + bound.size());
//		System.out.println("sw_x : " + bound.get("sw_x"));
//		System.out.println("sw_y : " + bound.get("sw_y"));
//		System.out.println("ne_x : " + bound.get("ne_x"));
//		System.out.println("ne_y : " + bound.get("ne_y"));
		try {
			session = ssf.openSession();
			list = session.selectList("findMaemoolInBound", bound);
		} catch (Exception e) {
			System.out.println("MapDAO findMaemoolInBound : " + e.getMessage());
		}

		return list;
	}
}
