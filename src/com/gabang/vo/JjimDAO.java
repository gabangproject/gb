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
			System.out.println("jjimDAO 초기화 : " + e.getMessage());
		}
	}

	/* by.준영 */
	public static void insertJjim(JjimVO vo) {
		SqlSession session = null;

		try {
			System.out.println("이거는 받아오나?");
			session = ssf.openSession(true);

			System.out.println("여기문제인가?");
			session.insert("insertJjim", vo);

		} catch (Exception e) {
			System.out.println("jjimDAO jjiminsert : " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	/* by.준영 */
	public static void removeJjim(Map map) {
		SqlSession session = null;

		try {
			// map의 키는 id, num이다.
			session = ssf.openSession(true);
			session.delete("removeJjim", map);
		} catch (Exception e) {
			System.out.println("jjimDAO jjimActive : " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}
}
