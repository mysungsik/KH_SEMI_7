package com.helpgpt.sports.findInfo.model.service;

import static com.helpgpt.sports.common.util.JDBCTemplate.*;

import java.sql.Connection;

import com.helpgpt.sports.findInfo.model.dao.FindInfoDAO;

public class FindInfoService {
	FindInfoDAO dao = new FindInfoDAO();
	
	public String findUserId(String inputEmail, String inputName) {
		Connection conn = getConnection();

		String userID = dao.findUserId(conn, inputEmail, inputName);
		
		close(conn);
		
		return userID;
	}

	public int findUserPw(String inputId, String inputEmail) {
		Connection conn = getConnection();

		int foundUserNo = dao.findUserPw(conn, inputId, inputEmail);
		
		close(conn);
		
		return foundUserNo;
	}


	public void updateMailUUID(int foundUserNo, String mailCheckUUID) {
		Connection conn = getConnection();

		int updateReulst = dao.updateMailUUID(conn, foundUserNo, mailCheckUUID);
		
		
		if (updateReulst > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);

		return;
	}

}
