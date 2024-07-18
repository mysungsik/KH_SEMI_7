package com.helpgpt.sports.admin.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static com.helpgpt.sports.common.util.JDBCTemplate.*;
import com.helpgpt.sports.login.model.vo.User;

public class ProfileAdminDAO {
	Properties p;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ProfileAdminDAO() {
		try {
			p = new Properties();
			String defaultpath = "/com/helpgpt/sports/common/sqls/";
			String filepath = ProfileAdminDAO.class.getResource(defaultpath + "profileAdmin-sql.xml").getPath();
			FileInputStream fis = new FileInputStream(filepath);
			p.loadFromXML(fis);
		} catch (Exception e) {
			System.err.println("[ERROR] Load to sql");
			e.printStackTrace();
		}
	}
	
	public List<User> getAllUserInfo(Connection conn) {
		List<User> userList = new ArrayList<>();
		
		try {
			String sql = p.getProperty("selectAllUser");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int userNo = rs.getInt("USER_NO");
				int favoriteTeamNo = rs.getInt("TEAM_NO");
				String userId = rs.getString("USER_ID");
				String userEmail = rs.getString("USER_EMAIL");
				String userName = rs.getString("USER_NAME");
				String userPhone = rs.getString("USER_PHONE") != null ? rs.getString("USER_PHONE") : "";
				String userSns = rs.getString("USER_SNS") != null ? rs.getString("USER_SNS") : "";
				String userBd = rs.getString("USER_BD") != null ? rs.getString("USER_BD") : "";
				String userAddress = rs.getString("USER_ADDRESS") != null ? rs.getString("USER_ADDRESS") : "";
				String userGender = rs.getString("USER_GENDER")  != null ? rs.getString("USER_GENDER") : "";
				String userNation = rs.getString("USER_NATION")  != null ? rs.getString("USER_NATION") : "";
				String userProfileImg = rs.getString("USER_IMG_RENAME")  != null ? rs.getString("USER_IMG_RENAME") : "";;
				String userAuthority = rs.getString("USER_AUTHORITY");
				String userState = rs.getString("USER_ST");
				String createdDate = rs.getString("CREATE_DT");
				String deletedDate = rs.getString("DELETE_DT") != null ? rs.getString("DELETE_DT") : "";
				String agreeAddress = rs.getString("AGREE_ADDRESS");
				String agreeEmail = rs.getString("AGREE_EMAIL");
				String agreePhone = rs.getString("AGREE_PHONE");
				
				User user = new User(userNo, favoriteTeamNo, userId, 
						userProfileImg, userEmail, 
						userName, userPhone, userSns, userBd, 
						userAddress, userGender, userNation, 
						userProfileImg, userAuthority, userState, 
						createdDate, deletedDate,
						agreeAddress, agreeEmail, agreePhone);
				
				userList.add(user);
			}
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to getAllUSerInfo ");
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return userList;
	}
}