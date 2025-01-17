package com.helpgpt.sports.admin.model.dao;

import java.io.FileInputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static com.helpgpt.sports.common.util.JDBCTemplate.*;
import com.helpgpt.sports.login.model.vo.User;
import com.helpgpt.sports.report.model.vo.Report;

import oracle.jdbc.OracleTypes;

public class ProfileAdminDAO {
	Properties p;
	PreparedStatement pstmt;
	CallableStatement cstmt;
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
	
	// 관리자용 모든 유저 데이터 출력
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
				String userNation = rs.getString("USER_NATION") != null ? rs.getString("USER_NATION") : "";
				String userProfileImg = rs.getString("USER_IMG_RENAME")  != null ? rs.getString("USER_IMG_RENAME") : "";;
				String userAuthority = rs.getString("USER_AUTHORITY");
				String userState = rs.getString("USER_ST");
				String createdDate = rs.getString("CREATE_DT");
				String deletedDate = rs.getString("DELETE_DT") != null ? rs.getString("DELETE_DT") : "";
				String agreeAddress = rs.getString("AGREE_ADDRESS");
				String agreeEmail = rs.getString("AGREE_EMAIL");
				String agreePhone = rs.getString("AGREE_PHONE");
				String lastLogin = rs.getTimestamp("LAST_LOGIN_DT") != null ? rs.getTimestamp("LAST_LOGIN_DT").toString() : "";
				
				User user = new User(userNo, favoriteTeamNo, userId, 
						userProfileImg, userEmail, 
						userName, userPhone, userSns, userBd, 
						userAddress, userGender, userNation, 
						userProfileImg, userAuthority, userState, 
						createdDate, deletedDate, lastLogin,
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

	// 관리자용 유저 권한 업데이트
	public int updateUserInfo(Connection conn, User user) {
		int result = 0;
		
		try {
			if (user.getUserState().equals("G")) {
				String sql = p.getProperty("updateUserInfoWithFailCnt");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getUserAuthority());
				pstmt.setString(2, user.getUserState());
				pstmt.setInt(3, user.getUserNo());
				
				result = pstmt.executeUpdate();
				
			}else {
				String sql = p.getProperty("updateUserInfo");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getUserAuthority());
				pstmt.setString(2, user.getUserState());
				pstmt.setInt(3, user.getUserNo());
				
				result = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[ERROR] Failed to update user authority & state");
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<User> searchUsersData(Connection conn, String category, String serachInput) {
		List<User> userList = new ArrayList<>();
		
		String sql = String.format("SELECT"
				+ " I.USER_NO,"
				+ "	I.TEAM_NO,"
				+ "	I.USER_ID,"
				+ "	I.USER_EMAIL,"
				+ "	I.USER_NAME,"
				+ "	I.USER_PHONE,"
				+ "	I.USER_SNS,"
				+ "	I.USER_BD,"
				+ "	I.USER_ADDRESS,"
				+ "	I.USER_GENDER,"
				+ "	I.USER_NATION,"
				+ "	I.USER_IMG_ORIGIN,"
				+ "	I.USER_IMG_RENAME,"
				+ "	I.USER_AUTHORITY,"
				+ "	I.USER_ST,"
				+ "	TO_CHAR(I.CREATE_DT, 'YYYY-MM-DD HH24:MM:SS') AS CREATE_DT,"
				+ "	TO_CHAR(I.DELETE_DT, 'YYYY-MM-DD HH24:MM:SS') AS DELETE_DT,"
				+ "	P.AGREE_ADDRESS,"
				+ "	P.AGREE_EMAIL,"
				+ "	P.AGREE_PHONE,"
				+ "	(SELECT MAX(H.LOGIN_DT)"
				+ "	 FROM USER_HISTORY H"
				+ "	 WHERE H.USER_NO = I.USER_NO) AS LAST_LOGIN_DT"
				+ " FROM USER_INFO I"
				+ " JOIN USER_POLICY P ON (I.USER_NO = P.USER_NO)"
				+ " WHERE %s LIKE '%%%s%%'"
				+ " ORDER BY I.USER_NO ASC", category, serachInput);
		 
		try {
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
				String userNation = rs.getString("USER_NATION") != null ? rs.getString("USER_NATION") : "";
				String userProfileImg = rs.getString("USER_IMG_RENAME")  != null ? rs.getString("USER_IMG_RENAME") : "";;
				String userAuthority = rs.getString("USER_AUTHORITY");
				String userState = rs.getString("USER_ST");
				String createdDate = rs.getString("CREATE_DT");
				String deletedDate = rs.getString("DELETE_DT") != null ? rs.getString("DELETE_DT") : "";
				String agreeAddress = rs.getString("AGREE_ADDRESS");
				String agreeEmail = rs.getString("AGREE_EMAIL");
				String agreePhone = rs.getString("AGREE_PHONE");
				String lastLogin = rs.getTimestamp("LAST_LOGIN_DT") != null ? rs.getTimestamp("LAST_LOGIN_DT").toString() : "";
				
				User user = new User(userNo, favoriteTeamNo, userId, 
						userProfileImg, userEmail, 
						userName, userPhone, userSns, userBd, 
						userAddress, userGender, userNation, 
						userProfileImg, userAuthority, userState, 
						createdDate, deletedDate, lastLogin,
						agreeAddress, agreeEmail, agreePhone);
				
				userList.add(user);
			}
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to Searching User ");
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return userList;
	}

	public int acceptReport(Connection conn, int reportNo) {
		String sql = p.getProperty("acceptReport");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to Accept Report");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int searchAuthor(Connection conn, int reportTypeNo, int reportTargetNo) {
		int authorNo = 0;
		String reportType ="";
		String targetColunm = "";
		
		switch (reportTypeNo) {
			case 1: {
				reportType = "COMM";
				targetColunm = "COMM_NO";
			}break;
			case 2:{ 
				reportType = "REPLY";
				targetColunm = "REPLY_NO";
			}break;
			case 3:{ 
				reportType = "NEWS";
				targetColunm = "NEWS_NO";
			}break;
		}
		
		String sql = String.format("SELECT USER_NO"
				+ " FROM %s"
				+ " WHERE %s = ?" , reportType, targetColunm);
		 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportTargetNo);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				authorNo = rs.getInt("USER_NO");
			}
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to Searching Reported Author ");
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return authorNo;
	}

	public int updateUserWarn(Connection conn, int authorNo) {
		String sql = p.getProperty("updateUserWarn");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, authorNo);
       
			result = pstmt.executeUpdate();    
            
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to update User Warn");
			e.printStackTrace();
		} finally {
			close(cstmt);
		}
		
		return result;
	}
	
	public int selectUserWarnCnt(Connection conn, int authorNo) {
		int warnCnt = 0;
		
		try {
			String sql = p.getProperty("selectUserWarnCnt");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, authorNo);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				warnCnt = rs.getInt("WARN_CNT");
			}
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to selectUserWarnCnt ");
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return warnCnt;
	}

	public void setUserLock(Connection conn, int authorNo) {
		String sql = p.getProperty("setUserLock");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, authorNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to User Lock");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return;
		
	}

	public int cancelReport(Connection conn, int reportNo) {
		String sql = p.getProperty("cancelReport");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to cancel Report");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<Report> searchReportsData(Connection conn, String category, String serachInput) {
		List<Report> reportList = new ArrayList<>();
		
		String sql = "";
		
		try {
			// 기본 SQL 생성
			String sqlBefore = p.getProperty("searchReportBefore");
			
			// 카테고리에 따라 SQL 추가하여 검색 기능 생성
			if (category.equals("TARGET_CONTENT")) {
				sql = sqlBefore + String.format("AND ("
					+ " (R.REPORT_TYPE_NO = 1 AND C.COMM_CONTENT LIKE '%%%s%%') OR"
					+ "	(R.REPORT_TYPE_NO = 2 AND RP.REPLY_CONTENT LIKE '%%%s%%') OR"
					+ "	(R.REPORT_TYPE_NO = 3 AND N.NEWS_CONTENT LIKE '%%%s%%')"
					+ "	)"
					+ "	ORDER BY "
					+ "	R.REPORT_NO DESC", serachInput, serachInput, serachInput);
			} else {
				sql = sqlBefore + String.format("AND %s  LIKE '%%%s%%'"
					+ " ORDER BY "
					+ " R.REPORT_NO DESC",category, serachInput);
			}
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int reportNo = rs.getInt("REPORT_NO");
				int userNo = rs.getInt("USER_NO");
				String userName = rs.getString("USER_NAME");
				String userId = rs.getString("USER_ID");
				int reportTypeNo = rs.getInt("REPORT_TYPE_NO");
				String reportTypeName = rs.getString("REPORT_TYPE");
				int reportTargetNo = rs.getInt("TARGET_NO");
				String reportTargetTitle  = rs.getString("TARGET_TITLE");
				String reportTargetContent = rs.getString("TARGET_CONTENT") != null ? rs.getString("TARGET_CONTENT") : "";
				int violationTypeNo = rs.getInt("VIO_TYPE_NO");
				String violationTypeName = rs.getString("VIO_TYPE");
				String reportContent = rs.getString("REPORT_CONTENT");
				String reportDt = rs.getDate("REPORT_DT").toString();
				String reportStatus = rs.getString("REPORT_ST");
				
				Report report = new Report(reportNo, userNo, userName, userId, 
						reportTypeNo, reportTypeName, reportTargetNo, reportTargetTitle, reportTargetContent, violationTypeNo, 
						violationTypeName, reportContent, reportDt, reportStatus);
				
				reportList.add(report);
			}
		} catch (Exception e) {
			System.out.println("[ERROR] Failed to Searching Reported Author ");
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return reportList;
	}
}
