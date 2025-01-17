package com.helpgpt.sports.reply.model.dao;

import static com.helpgpt.sports.common.util.JDBCTemplate.close;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.helpgpt.sports.reply.model.vo.Reply;

public class ReplyDAO {
	Properties prop;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ReplyDAO() {
		try {
			prop = new Properties();
			String defaultpath = "/com/helpgpt/sports/common/sqls/";
			String filepath = ReplyDAO.class.getResource(defaultpath + "reply-sql.xml").getPath();
			FileInputStream fis = new FileInputStream(filepath);
			prop.loadFromXML(fis);
		} catch (Exception e) {
			System.err.println("[ERROR] Load to news-sql.xml");
			e.printStackTrace();
		}
	}
	
	public List<Reply> getReplies(Connection conn, int replyType, int targetNum) {
		List<Reply> replyList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("getReplyAllByOneTarget");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyType);	// 댓글의 타입 넘버 (1:  커뮤니티,..., 4 : 뉴스)
			pstmt.setInt(2, targetNum);	// 타겟(뉴스, 게시글 등 ...) 의 넘버 (PK)
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int replyNo = rs.getInt("REPLY_NO");
				int userNo = rs.getInt("USER_NO");
				String userName = rs.getString("USER_NAME");
				String userProfileImg = rs.getString("USER_IMG_RENAME") != null ? rs.getString("USER_IMG_RENAME") : "";
				int replyTypeNo = rs.getInt("REPLY_TYPE_NO");
				String replyTypeName = rs.getString("REPLY_TYPE");
				int replyTargetNo = rs.getInt("REPLY_TARGET_NO");
				String replyDt = rs.getTimestamp("REPLY_DT").toString();
				String replyContent = rs.getString("REPLY_CONTENT");
				String replyStatus = rs.getString("REPLY_ST");
				
				Reply reply = new Reply(replyNo, 
						userNo, userName, userProfileImg,
						replyTypeNo, replyTypeName, 
						replyTargetNo,
						replyDt, 
						replyContent, 
						replyStatus);
				
				replyList.add(reply);
			}
			
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to get Replies");
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return replyList;
	}

	public int insertReply(Connection conn, int targetTypeNo, int userNo, int targetNo, String replyContent) {
		String sql = prop.getProperty("insertReply");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, targetTypeNo);
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, targetNo);
			pstmt.setString(4, replyContent);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[ERROR] Failed to insert reply");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Reply getReturnReply(Connection conn) {
		Reply tempResult = new Reply();
		
		try {
			String sql = prop.getProperty("getReturnReply");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				tempResult.setReplyDt(rs.getTimestamp("REPLY_DT").toString());
				tempResult.setReplyNo(rs.getInt("REPLY_NO"));
			}
			
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to get Replies");
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return tempResult;
	}

	public int deleteReply(Connection conn, int replyNo) {
		String sql = prop.getProperty("deleteReply");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[ERROR] Failed to delete reply");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateReply(Connection conn, int replyNo, String replyContent) {
		String sql = prop.getProperty("updateReply");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, replyContent);
			pstmt.setInt(2, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[ERROR] Failed to update reply");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
