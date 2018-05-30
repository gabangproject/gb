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
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			System.out.println("jjimDAO �ʱ�ȭ : " + e.getMessage());
		}
	}
	
	public static String jjimActive(Map map) {
		SqlSession session = null;
		
		try {
			// map�� Ű�� id, num�̴�.
			session = ssf.openSession();
			session.insert("jjimActive", map);
		} catch (Exception e) {
			System.out.println("jjimDAO jjimActive : " + e.getMessage());
		}
		
		return null;
	}
	
	public static void insertJjim(JjimVO vo)
	{
		SqlSession session = null;
		
		try {
			System.out.println("�̰Ŵ� �޾ƿ���?");
			session=ssf.openSession(true);
			
			System.out.println("���⹮���ΰ�?");
			session.insert("insertJjim", vo);
			
		} catch (Exception e) {
			System.out.println("jjimDAO jjiminsert : " + e.getMessage());
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	
	
	
	public static void removeJjim(Map map)
	{
		SqlSession session = null;
		
		try {
			// map�� Ű�� id, num�̴�.
			session = ssf.openSession(true);
			session.delete("removeJjim", map);
		} catch (Exception e) {
			System.out.println("jjimDAO jjimActive : " + e.getMessage());
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
}
