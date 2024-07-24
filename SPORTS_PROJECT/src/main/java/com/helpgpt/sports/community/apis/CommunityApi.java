package com.helpgpt.sports.community.apis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.helpgpt.sports.community.model.service.CommunityService;
import com.helpgpt.sports.community.model.vo.Board;
import com.helpgpt.sports.teams.model.vo.Teams;

/**
 * Servlet implementation class Login
 */
@WebServlet("/api/community/*")
public class CommunityApi extends HttpServlet {
	CommunityService service = new CommunityService();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Path 지정
		PrintWriter out = res.getWriter();
		String reqPath = req.getPathInfo();
		String path = "";
		
		if(reqPath != null) {
			path = reqPath.split("/")[1];
		}
		
		Map<String, Object> result = new HashMap<>();
		
		// 경로에 따라 필요한 기능을 사용 ("*" 이후 들어갈 첫번째 값이 해당 기능)
		switch (path) {
			case "communityBoard": {
				
				int type = Integer.parseInt(req.getParameter("type"));
				int teamNo = 1;
				
                // 팀 선택이 있는 경우 teamNo 파라미터 수집
                if(type == 3) {
                    String teamNoParam = req.getParameter("teamNo");
                    if(teamNoParam != null) {
                        teamNo = Integer.parseInt(teamNoParam);
                    }
                }
				List<Board> boardList = service.selectBoardList(type, teamNo);
				List<Teams> teams = service.selectTeams();
				
				
				if (boardList.size() > 0) {
					result.put("teams", teams);
					result.put("data", boardList);
					result.put("message", "success to get BoardList");
				} else {
					result.put("message", "failed to get BoardList");
				}
			
				new Gson().toJson(result, out);
				
			};break;
				
		default:System.out.println("[ERROR] COMMUNUNITY API");}
	}
	
}
