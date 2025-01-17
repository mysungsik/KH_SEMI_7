package com.helpgpt.sports.reply.model.service;

import static com.helpgpt.sports.common.util.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.helpgpt.sports.login.model.vo.User;
import com.helpgpt.sports.reply.model.dao.ReplyDAO;
import com.helpgpt.sports.reply.model.vo.Reply;

public class ReplyService {
	ReplyDAO dao = new ReplyDAO();

	public List<Reply> getReplyAllByOneTarget(int targetTypeNo, int targetNo) {
		Connection conn = getConnection();
		List<Reply> replyList = dao.getReplies(conn, targetTypeNo, targetNo);

		close(conn);

		return replyList;
	}

	public Reply insertReply(int targetTypeNo, User loginUser, int targetNo, String replyContent) {
		Connection conn = getConnection();
		int insertResult = dao.insertReply(conn, targetTypeNo, loginUser.getUserNo(), targetNo, replyContent);
		Reply returnReply = null;

		if (insertResult > 0) {

			// USER 에게 돌려주고 데이터를 바로 확인하기 위한 임시 데이터
			returnReply = dao.getReturnReply(conn);
			returnReply.setReplyContent(replyContent);
			returnReply.setReplyStatus("N");
			returnReply.setReplyTargetNo(targetNo);
			returnReply.setReplyTypeNo(targetTypeNo);
			returnReply.setUserNo(loginUser.getUserNo());
			returnReply.setUserName(loginUser.getUserName());
			returnReply.setUserProfileImg(loginUser.getUserProfileImg() != null ? loginUser.getUserProfileImg() : "");

			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return returnReply;
	}

	public int deleteReply(int replyNo) {
		Connection conn = getConnection();
		int deleteResult = dao.deleteReply(conn, replyNo);

		if (deleteResult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return deleteResult;
	}

	public int updateReply(int replyNo, String replyContent) {
		Connection conn = getConnection();
		int updateResult = dao.updateReply(conn, replyNo, replyContent);

		if (updateResult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return updateResult;
	}

	public int deleteMyReplyMany(List<Integer> parsedReplyNo) {
		Connection conn = getConnection();
		int result = 0;
		for (int replyNo : parsedReplyNo) {
			int deleteResult = dao.deleteReply(conn, replyNo);
			
			if (deleteResult > 0 ) {
				result = deleteResult;
			}else {
				result = 0;
				break;
			}
		}
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
