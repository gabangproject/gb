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
			System.out.println(ex.getMessage());
		}
	}

	public static int emailCheck(String email) {
		int idCheck = 0;
		SqlSession session = null;// connection연결=>sql문장수행
		try {

			session = ssf.openSession();

			// 실행 결과값 받기
			idCheck = session.selectOne("emailCheck", email);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return idCheck;
	}

	public static MemberVO pwdCheck(String email) {
		MemberVO vo = new MemberVO();
		SqlSession session = null;// connection연결=>sql문장수행
		try {

			session = ssf.openSession();

			// 실행 결과값 받기
			vo = session.selectOne("pwdCheck", email);
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

	public static void loginState(MemberVO vo)
	{
		SqlSession session=null;
		
		try {
				session=ssf.openSession(true);
				session.insert("loginState",vo);
				
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		
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
	


	public static SellerVO sellerData(String email) {
		SqlSession session = null;
		SellerVO vo=null;
		try {
			session = ssf.openSession(true);
			vo=session.selectOne("sellerData", email);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	
	public static String sellerEmail(int num) {
		SqlSession session = null;
		String sellerEmail="";
		try {
			session = ssf.openSession(true);
			sellerEmail=session.selectOne("sellerEmail", num);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return sellerEmail;
	}
}
