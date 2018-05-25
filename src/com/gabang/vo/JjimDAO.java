package com.gabang.vo;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class JjimDAO {
	private static SqlSessionFactory ssf;
	
	public JjimDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			System.out.println("jjimDAO 초기화 : " + e.getMessage());
		}
	}
	
	public static String jjimActive(Map map) {
		SqlSession session = null;
		
		try {
			// map의 키는 id, num이다.
			session = ssf.openSession();
			session.insert("jjimActive", map);
		} catch (Exception e) {
			System.out.println("jjimDAO jjimActive : " + e.getMessage());
		}
		
		return null;
	}
}
