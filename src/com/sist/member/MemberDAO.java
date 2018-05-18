package com.sist.member;
import java.util.*; // ArrayList
import java.sql.*; // Connection,PreparedStatement,ResultSet
import javax.naming.*;// Context
import javax.sql.*;// DataSource => Database�� ���� 
// DBCP : Connection�� �̸� �����Ŀ� �ּҸ� �� ����Ŭ�� �����ϴ� ��� 
/*
 *    1) ������ Connection ������ ����  : getConnection()
 *    2) ���
 *    3) ��ȯ 
 *    =======> Connection�� ������ �����ϸ鼭 ������ �����ϰ� ����� �ش� 
 */
public class MemberDAO {
    private Connection conn;
    private PreparedStatement ps;
  
    public void getConnection()
    {
    	// Context c;
    	try
    	{
    		// POOL���� 
    		Context init=new InitialContext();
    		// Ž���⸦ ���� ==> JNDI
    		// C:\\����̹��� ����
    		Context c=(Context)init.lookup("java://comp/env");
    		// ����� �����ͺ��̽��� ����(DataSource)�� ���´�
    		DataSource ds=(DataSource)c.lookup("jdbc/oracle");
    		
    		conn=ds.getConnection();
    	}catch(Exception ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
    // ��ȯ 
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close(); // ������̶��..
    	}catch(Exception ex){}
    	
    }
    // ��� 
    public int idcheck(String id)
    {
    	int count=0;
    	try
    	{
    		// �ּҰ� ���
    		getConnection();
    		// SQL���� ����
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
    		disConnection();// ��ȯ
    	}
    	return count;
    }
    	public void memberJoin(MemberVO vo)
    	{
    		try
    		{
    			getConnection(); // �ּҰ� ���
    			String sql="insert into member values(?,?,?,?,?,?)";
    			ps=conn.prepareStatement(sql);
    			ps.setString(1,vo.getEmail());
    			ps.setString(2,vo.getPwd());
    			ps.setString(3,vo.getGender());
    			ps.setString(4,vo.getName());
    			ps.setString(5,vo.getNick());
    			ps.setString(6,vo.getPhone());

    			// ����
    			ps.executeUpdate();
    		}
    		catch (Exception ex) 
    		{
    			System.out.println(ex.getMessage());
			}
    		finally
    		{
    			disConnection(); // ��ȯ
    		}
    	}
    	// �α���
    	public String isLogin(String id, String pwd)
    	{
    		String result="";
    		try
    		{
    			getConnection();
    			// id ���� ���� Ȯ�� ( ���� (1) ����(0) )
    			String sql="select count(*) from member where id=?";
    			
    			ps=conn.prepareStatement(sql);
    			ps.setString(1, id);
    			
    			ResultSet rs=ps.executeQuery();
    			rs.next();
    			int count = rs.getInt(1);
    			rs.close();
    			
    			if(count==0) // �������� ���� ��
    			{
    				result="NoID";
    			}
    			else // ������ ��
    			{
    				sql="select pwd,name from member where id=?";
    				ps=conn.prepareStatement(sql);
    				ps.setString(1, id);
    				
    				rs=ps.executeQuery();
    				rs.next();
    				
    				String db_pwd=rs.getString(1);
    				String name=rs.getString(2);
    				rs.close();
    				
    				if(db_pwd.equals(pwd)) // �α����� �� ����
    				{
    					result=name;
    				}
    				else // ��й�ȣ�� Ʋ������
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











