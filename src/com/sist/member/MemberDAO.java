package com.sist.member;
import java.util.*; // ArrayList
import java.sql.*; // Connection,PreparedStatement,ResultSet
import javax.naming.*;// Context
import javax.sql.*;// DataSource => Database의 정보 
// DBCP : Connection을 미리 생성후에 주소를 얻어서 오라클에 접근하는 방식 
/*
 *    1) 생성된 Connection 가지고 오다  : getConnection()
 *    2) 사용
 *    3) 반환 
 *    =======> Connection의 갯수를 제한하면서 재사용이 가능하게 만들어 준다 
 */
public class MemberDAO {
    private Connection conn;
    private PreparedStatement ps;
  
    public void getConnection()
    {
    	// Context c;
    	try
    	{
    		// POOL연결 
    		Context init=new InitialContext();
    		// 탐색기를 연다 ==> JNDI
    		// C:\\드라이버에 연결
    		Context c=(Context)init.lookup("java://comp/env");
    		// 저장된 데이터베이스의 정보(DataSource)를 얻어온다
    		DataSource ds=(DataSource)c.lookup("jdbc/oracle");
    		
    		conn=ds.getConnection();
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
    // 반환 
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close(); // 사용중이라면..
    	}catch(Exception ex){}
    	
    }
    // 기능 
    public int idcheck(String id)
    {
    	int count=0;
    	try
    	{
    		// 주소값 얻기
    		getConnection();
    		// SQL문장 전송
    		String sql="SELECT COUNT(*) FROM member "
    				  +"WHERE id=?";
    		ps=conn.prepareStatement(sql);
    		ps.setString(1, id);
    		ResultSet rs=ps.executeQuery();
    		rs.next();
    		count=rs.getInt(1);
    		rs.close();
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    	finally
    	{
    		disConnection();// 반환
    	}
    	return count;
    }
    	public void memberJoin(MemberVO vo)
    	{
    		try
    		{
    			getConnection(); // 주소값 얻기
    			String sql="insert into member values(?,?,?,?,?,?)";
    			ps=conn.prepareStatement(sql);
    			ps.setString(1,vo.getEmail());
    			ps.setString(2,vo.getPwd());
    			ps.setString(3,vo.getGender());
    			ps.setString(4,vo.getName());
    			ps.setString(5,vo.getNick());
    			ps.setString(6,vo.getPhone());

    			// 실행
    			ps.executeUpdate();
    		}
    		catch (Exception ex) 
    		{
    			System.out.println(ex.getMessage());
			}
    		finally
    		{
    			disConnection(); // 반환
    		}
    	}
    	// 로그인
    	public String isLogin(String id, String pwd)
    	{
    		String result="";
    		try
    		{
    			getConnection();
    			// id 존재 여부 확인 ( 존재 (1) 없음(0) )
    			String sql="select count(*) from member where id=?";
    			
    			ps=conn.prepareStatement(sql);
    			ps.setString(1, id);
    			
    			ResultSet rs=ps.executeQuery();
    			rs.next();
    			int count = rs.getInt(1);
    			rs.close();
    			
    			if(count==0) // 존재하지 않을 때
    			{
    				result="NoID";
    			}
    			else // 존재할 때
    			{
    				sql="select pwd,name from member where id=?";
    				ps=conn.prepareStatement(sql);
    				ps.setString(1, id);
    				
    				rs=ps.executeQuery();
    				rs.next();
    				
    				String db_pwd=rs.getString(1);
    				String name=rs.getString(2);
    				rs.close();
    				
    				if(db_pwd.equals(pwd)) // 로그인이 된 상태
    				{
    					result=name;
    				}
    				else // 비밀번호가 틀린상태
    				{
    					result="NoPWD";
    				}
    			}
    		}
    		catch (Exception ex)
    		{
				System.out.println(ex.getMessage());
			}
    		finally 
    		{
				disConnection();
			}
    		return result;
    	}
}











