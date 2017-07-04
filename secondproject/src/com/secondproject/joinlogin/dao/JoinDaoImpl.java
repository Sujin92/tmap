package com.secondproject.joinlogin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.secondproject.userdto.UserDto;
import com.secondproject.util.db.DBClose;
import com.secondproject.util.db.DBConnection;

public class JoinDaoImpl implements JoinDao {

	private static JoinDao joinDao;
	
	static{
		joinDao = new JoinDaoImpl();
	}
	
	private JoinDaoImpl() {}

	public static JoinDao getJoinDao() {
		return joinDao;
	}

	@Override
	public int attest(Map<String, String> map) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int gender = Integer.parseInt(map.get("attestgender"));
		int age = Integer.parseInt(map.get("attestage"));
		
		try {
			conn = DBConnection.getConnection();
//			conn.setAutoCommit(false); //Ʈ����� ������ ���� 
			
			// �켱 ���� DB ����
			StringBuffer attest_ins = new StringBuffer();
			attest_ins.append("insert into users \n");
			attest_ins.append("(user_id, email, password, type, gender, age, status_msg, reg_date, reg_ip, update_date) \n");
			attest_ins.append("values (SEQ_USERS_ID.nextval, ?, ?, 1, ?, ?, 'ȯ���մϴ�.', sysdate, 'localhost', sysdate)");
			//ȸ��Ÿ�� 9���� �̸��� ���� ��� ����
			pstmt = conn.prepareStatement(attest_ins.toString());
			pstmt.setString(1, map.get("attestemail"));
			pstmt.setString(2, map.get("attestpassword"));
			pstmt.setInt(3, gender);
			pstmt.setInt(4, age);
			cnt = pstmt.executeUpdate();
			
//			pstmt.close(); //insert�� �ش��ϴ� pstmt �ݱ�
			
			
			//���� ���Ͽ� �߰��� session�� userDto ���
//			StringBuffer attest_sel = new StringBuffer();
//			attest_sel.append("select user_id, email, type, update_date \n");
//			attest_sel.append("from users \n");
//			attest_sel.append("where email = ? and password = ? \n");
//			pstmt = conn.prepareStatement(attest_sel.toString());
//			pstmt.setString(1, map.get("useremail"));
//			pstmt.setString(2, map.get("userpw"));
//			rs = pstmt.executeQuery();
//			System.out.println("5");
//			if(rs.next()) {
//				userDto = new UserDto();
//				userDto.setUser_id(rs.getInt("user_id"));
//				userDto.setEmail(rs.getString("email"));
//				userDto.setType(rs.getInt("type"));
//				userDto.setUpdate_date(rs.getString("update_date"));
//				System.out.println("6");
//			}
//			System.out.println("7");
//			conn.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
//			try{
//				conn.rollback();
//				userDto = null;
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	@Override
	public int idCheck(String sid) {
		int count = 0; //count�� 0�̸� �ش� id�� ����Ҽ� �ֽ��ϴ�.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select count(email) \n";
			sql += "from users \n";
			sql += "where email = ?"; 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery(); 
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			count= 1; //���� 0�̶� �����س�� �̷��� �ؾ���
		}finally{
			DBClose.close(conn, pstmt, rs);
		}
		return count;
	}

	@Override
	public UserDto lastcheck(Map<String, String> map) {
		UserDto userDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			StringBuffer check_sql = new StringBuffer();
//			// TODO sql�� ���� ¥�� select 
			
//			������ �� �������� �� ��� ������
//			�� ���� ���ϴ� ������ �� ������
//			������ �� ���� ����
//			shining like sunshine
//			
//			�� ������ �����Կ� ���� �ν��� ����
//			��ο� �����ڰ� Ȱ¦ ������ ���� 
//			�� ������ ������ �� 
//			just bling like silver&gold
//			vivid lively aaaa
//			
//			��~����~~�� �Ƹ��� ���� ���� ��~~������ 
//			�� �ʹ� ����
//			��~����~~�� �Ƹ��� ���� ���� ��~~������ 
//			�� ���� �Ƹ�����
//			
//			
//			�Ƹ����� �Ƹ����� �ƾƾƾƸ��� 
//			�ϼ� �ö��� ����
//			�Ƹ��� �Ƹ��� �ƾƾ� �Ƹ�����
//
//			�Ӹ����� ȯ�� ����
//			���� �νõ��� ����
//			�Ӹ����� �߳����� ��ó�� ������ ����
//			
//			�� �Ҽ� ��Ʈ��Ƽ�� ��� ������ ��
//			�� ����� ��Ʈ��Ƽ�� ��¦�̴� �Լ�
//			�� ��� ��Ʈ��Ƽ�� �ʹ� �Ϻ��� ��
//			�� ����� ��Ʈ��Ƽ�� �� ���� �ٸ���
			
			
			
			pstmt = conn.prepareStatement(check_sql.toString());
			pstmt.setString(0, null);
			pstmt.setString(0, null);
			rs = pstmt.executeQuery();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return userDto;
	}

}
