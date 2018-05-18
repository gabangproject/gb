package com.gabang.vo;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

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
			System.out.println("PropertyAddrDAO √ ±‚»≠ : " + e.getMessage());
		}
	}
	
	public static List<PropertyAddrVO> getGeoInfo() {
		List<PropertyAddrVO> list = new ArrayList<PropertyAddrVO>();
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
	}
}
