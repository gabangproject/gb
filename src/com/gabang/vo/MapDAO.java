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

	public MapDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			System.out.println("MapDAO √ ±‚»≠ : " + e.getMessage());
		}
	}

	public static List<MapVO> findMaemoolInBound(Map<String, Double> bound) {
		SqlSession session = null;
		List<MapVO> list = null;

		try {
			session = ssf.openSession();
			list = session.selectList("findMaemoolInBound", bound);
		} catch (Exception e) {
			System.out.println("MapDAO findMaemoolInBound : " + e.getMessage());
		}

		return list;
	}
}
