package com.helpgpt.sports.findInfo.model.dao;

import static com.helpgpt.sports.common.util.JDBCTemplate.close;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import com.helpgpt.sports.login.model.dao.UserDAO;

public class FindInfoDAO {
	Properties prop = new Properties();
	ResultSet rs;
	PreparedStatement pstmt;

	
	public FindInfoDAO() {
		String defaultpath = "/com/helpgpt/sports/common/sqls/";
		String filePath = UserDAO.class.getResource(defaultpath + "findinfo-sql.xml").getPath();
		
		try {
			prop = new Properties();
			FileInputStream fis = new FileInputStream(filePath);
			prop.loadFromXML(fis);
			
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to Load findinfo-sql file");
			e.printStackTrace();
		}		
	}
	public String findUserId(Connection conn, String inputEmail, String inputName) {
		String userId = null;
		String sql = prop.getProperty("findUserId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputEmail);
			pstmt.setString(2, inputName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userId = rs.getString("USER_ID");
			}
			
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to Find UserId");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return userId;
	}
	public int findUserPw(Connection conn, String inputId, String inputEmail) {
		int foundUserNo = 0;
		String sql = prop.getProperty("findUserPw");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			pstmt.setString(2, inputEmail);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				foundUserNo = rs.getInt("USER_NO");
			}
			
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to Find UserPw");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return foundUserNo;
	}
	public int updateMailUUID(Connection conn, int foundUserNo, String mailCheckUUID) {
		String sql = prop.getProperty("updateMailUUID");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mailCheckUUID);
			pstmt.setInt(2, foundUserNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to update Mail UUID");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
