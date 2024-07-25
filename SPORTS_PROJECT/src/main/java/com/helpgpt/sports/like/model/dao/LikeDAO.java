package com.helpgpt.sports.like.model.dao;

import static com.helpgpt.sports.common.util.JDBCTemplate.close;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.helpgpt.sports.like.model.vo.Like;

public class LikeDAO {
	Properties prop;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public LikeDAO() {
		try {
			prop = new Properties();
			String defaultpath = "/com/helpgpt/sports/common/sqls/";
			String filepath = LikeDAO.class.getResource(defaultpath + "like-sql.xml").getPath();
			FileInputStream fis = new FileInputStream(filepath);
			prop.loadFromXML(fis);
		} catch (Exception e) {
			System.err.println("[ERROR] Load to like-sql.xml");
			e.printStackTrace();
		}
	}
	
	public List<Like> getLikes(Connection conn, int likeType, int targetNum) {
		List<Like> likeList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("getLikeAllByOneTarget");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, likeType);	// 좋아요의 타입 넘버 (1:  커뮤니티,..., 5 : 뉴스)
			pstmt.setInt(2, targetNum);	// 타겟(뉴스, 게시글 등 ...) 의 넘버 (PK)
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int userNo = rs.getInt("USER_NO");
				String userName = rs.getString("USER_NAME");
				int likeTypeNo = rs.getInt("LIKE_TYPE_NO");
				String likeTypeName = rs.getString("LIKE_TYPE");
				int likeTargetNo = rs.getInt("LIKE_TARGET_NO");
				
				Like like = new Like(userNo, userName, likeTypeNo, likeTypeName, likeTargetNo);
				
				likeList.add(like);
			}
			
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to get likes");
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return likeList;
	}

}