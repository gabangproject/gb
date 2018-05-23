package com.gabang.vo;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.gabang.vo.*;

import java.io.*;// XML���� �б� = �Ľ̿�û 

public class BoardDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println("boardDAO : " + ex.getMessage());
		}
	}

	// ��� �б�
	public static List<BoardVO> boardListData(Map map) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		SqlSession session = null;// connection����=>sql�������
		try {
			session = ssf.openSession();

			// ���� ����� �ޱ�
			list = session.selectList("boardListData", map);
		} catch (Exception ex) {
			System.out.println("boardListData : " + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	// ��Ż������
	public static int boardTotalPage() {
		int total = 0;
		SqlSession session = null;
		try {
			// connection �ּ� �б�
			session = ssf.openSession();
			total = session.selectOne("boardTotalPage");
		} catch (Exception ex) {
			System.out.println("boardTotalPage : " + ex.getMessage());
		} finally {
			// connection ��ȯ
			if (session != null)
				session.close();
		}
		return total;
	}

	// �۾���
	public static void boardInsert(BoardVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			// autoCommit(true)
			session.insert("boardInsert", vo);
		} catch (Exception ex) {
			System.out.println("boardInsert :" + ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
	}

	// ���뺸��
	public static BoardVO boardContentData(int no) {
		BoardVO vo = new BoardVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("hitIncrement", no);
			session.commit();
			vo = session.selectOne("boardContentData", no);

		} catch (Exception e) {
			System.out.println("boardContentData : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}

	// �����ϱ�
	public static BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("boardContentData", no);

		} catch (Exception e) {
			System.out.println("boardUpdateData : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}

	public static void boardUpdate(BoardVO vo) {
		boolean bCheck = false;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("boardUpdate", vo);
		} catch (Exception e) {
			System.out.println("boardUpdate : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public static void boardDelete(int no) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.delete("boardDelete", no);
		} catch (Exception e) {
			System.out.println("boardDelete : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public static void boardReply(int no, BoardVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession();

			BoardVO pvo = session.selectOne("boardReply1", no);

			// vo.setGroup_step(pvo.getGroup_step()+1);
			session.update("boardReply2", pvo);

			vo.setGroup_id(pvo.getGroup_id());
			vo.setGroup_step(pvo.getGroup_step() + 1);
			vo.setGroup_tab(pvo.getGroup_tab() + 1);
			session.insert("boardReply3", vo);

			session.update("boardReply4", no);
			session.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public static List<BoardVO> titleSearch(String keyword) {
		List<BoardVO> vo = new ArrayList<BoardVO>();
		SqlSession session = null;
		try {
			
			session = ssf.openSession(true);
			vo = session.selectList("titleSearch", keyword);
			
			} catch (Exception e) {
			System.out.println("boardDelete : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}

	public static List<BoardVO> emailSearch(String keyword) {
		List<BoardVO> vo = new ArrayList<BoardVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			vo = session.selectList("emailSearch", keyword);
		} catch (Exception e) {
			System.out.println("emailSearch : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}

	public static List<BoardVO> contentSearch(String keyword) {
		List<BoardVO> vo = new ArrayList<BoardVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			vo = session.selectList("contentSearch", keyword);
		} catch (Exception e) {
			System.out.println("contentSearch : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return vo;
	}
	public static int titleCount(String keyword) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			total = session.selectOne("boardTotalPage2",keyword);
		} catch (Exception e) {
			System.out.println("titlecount : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return total;
	}
	
	public static int emailCount(String keyword) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			total = session.selectOne("boardTotalPage3",keyword);
		} catch (Exception e) {
			System.out.println("titlecount : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return total;
	}
	
	public static int contentCount(String keyword) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			total = session.selectOne("boardTotalPage4",keyword);
		} catch (Exception e) {
			System.out.println("titlecount : " + e.getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return total;
	}

}