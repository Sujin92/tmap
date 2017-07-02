package com.secondproject.admin.dao;

import java.sql.*;
import java.util.Map;

import com.secondproject.util.db.DBClose;
import com.secondproject.util.db.DBConnection;

public class CommonDaoImpl implements CommonDao {

	private static CommonDao commonDao;

	public static CommonDao getCommonDao() {
		return commonDao;
	}

	private CommonDaoImpl() {
	};

	static {
		commonDao = new CommonDaoImpl();
	}

	@Override
	public int totalExhibitionCount(Map<String, Object> params) {
		int count = 0;
		String key = (String) params.get("key");
		String word = (String) params.get("word");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) \n");
			sql.append("			from exhibition \n");
			if (!key.isEmpty() && !word.isEmpty()) {
				if (key.equals("title")) {
					sql.append("	  where ex_title like '%' ||?|| '%'\n");
				}
			}
			pstmt = conn.prepareStatement(sql.toString());
			if (!key.isEmpty() && !word.isEmpty()) {
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return count;
	}

	@Override
	public int totalReviewCount(Map<String, Object> params) {
		int count = 0;
		String key = (String) params.get("key");
		String word = (String) params.get("word");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) \n");
			sql.append(" from review r, shop s, users u \n");
			sql.append("  where r.user_id = u.user_id and \n");
			sql.append(" 	   r.shop_id = s.shop_id  \n");

			if (!key.isEmpty() && !word.isEmpty()) {
				if (key.equals("emailname")) {
					sql.append("	  where ex_title like '%' ||?|| '%'\n");
				}
			}
			pstmt = conn.prepareStatement(sql.toString());
			if (!key.isEmpty() && !word.isEmpty()) {
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return count;
	}

	@Override
	public int totalUserCount(Map<String, Object> params) {
		int count = 0;
		String key = (String) params.get("key");
		String word = (String) params.get("word");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) \n");
			sql.append("			from users \n");
			if (!word.isEmpty() && !key.isEmpty()) {
				sql.append("where " + key + " like '%' || ? || '%' \n");
			}
			pstmt = conn.prepareStatement(sql.toString());
			if (!word.isEmpty() && !key.isEmpty()) {
				pstmt.setString(1, word);
			}
			System.out.println(sql.toString());
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return count;
	}

	@Override
	public int totalShopCount(Map<String, Object> params) {
		int count = 0;
		String key = (String) params.get("key");
		String word = (String) params.get("word");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) \n");
			sql.append("from shop s, shop_category c, exhibition_detail e \n");
			sql.append("where c.category_id = s.category_id and s.shop_id = e.shop_id \n");

			System.out.println(word + "     commonDaoImpl" );
			if (!word.isEmpty() && !key.isEmpty()) {
				sql.append("and " + key + " like '%' || ? || '%' \n");
			}
			pstmt = conn.prepareStatement(sql.toString());
			if (!word.isEmpty() && !key.isEmpty()) {
				pstmt.setString(1, word);
			}
			System.out.println(sql.toString());
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return count;
	}

}