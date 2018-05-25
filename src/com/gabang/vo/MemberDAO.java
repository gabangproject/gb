package com.gabang.vo;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.gabang.vo.*;

public class MemberDAO {

	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println("boardDAO : " + ex.getMessage());
		}
	}

	public static int loginIdCheck(String email) {
		int loginIdCheck = 0;
		SqlSession session = null;// connection연결=>sql문장수행
		try {

			session = ssf.openSession();

			// 실행 결과값 받기
			loginIdCheck = session.selectOne("loginIdCheck", email);
		} catch (Exception ex) {
			System.out.println("boardListData : " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return loginIdCheck;
	}

	public static MemberVO loginPwdCheck(String email) {
		MemberVO vo = new MemberVO();
		SqlSession session = null;// connection연결=>sql문장수행
		try {

			session = ssf.openSession();

			// 실행 결과값 받기
			vo = session.selectOne("loginPwdCheck", email);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	public static int nickCheck(String nick) {
		int nickCheck = 0;
		SqlSession session = null;// connection연결=>sql문장수행
		try {
			session = ssf.openSession();

			// 실행 결과값 받기
			nickCheck = session.selectOne("nickCheck", nick);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return nickCheck;
	}

	public static int licenseCheck(String license) {
		int licenseCheck = 0;
		SqlSession session = null;// connection연결=>sql문장수행
		try {

			session = ssf.openSession();

			// 실행 결과값 받기
			licenseCheck = session.selectOne("licenseCheck", license);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return licenseCheck;
	}

	public static int compTelCheck(String compTel) {
		int compTelCheck = 0;
		SqlSession session = null;// connection연결=>sql문장수행
		try {
			session = ssf.openSession();

			// 실행 결과값 받기
			compTelCheck = session.selectOne("compTelCheck", compTel);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return compTelCheck;
	}

	public static int phoneCheck(String phone) {
		int phoneCheck = 0;
		SqlSession session = null;// connection연결=>sql문장수행
		try {
			session = ssf.openSession();

			// 실행 결과값 받기
			phoneCheck = session.selectOne("phoneCheck", phone);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return phoneCheck;
	}

	public static void insertMember(MemberVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("insertMember", vo);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static void insertSeller(SellerVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("insertSeller", vo);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}
}
