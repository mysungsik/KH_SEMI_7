package com.helpgpt.sports.teams.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpgpt.sports.teams.model.service.TeamsService;
import com.helpgpt.sports.teams.model.vo.Teams;


@WebServlet(name = "teamsController",
			urlPatterns = {
				"/teams",	
				"/teams/*"}
)
public class TeamsController extends HttpServlet {

	RequestDispatcher dispatcher;
	final String defaultURLPath = "/WEB-INF/views/teams/";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Path 지정
		String reqPath = req.getPathInfo();
		String team = "";
		
		String[] teams={"KIA", "HANWHA", "LG", "LOTTE", "KT", "COFFEE", "PHONE", 
				"BONBON", "DETOX", "TOBACCO","teamAdd"};

		List<String> teamList = Arrays.asList(teams);
		
		
		if(reqPath != null) {
			team = reqPath.split("/")[1];
		}
		
		// 경로에 따라 필요한 페이지로 추가 이동
		if(team.equals("")) {	// team이 없는 경우
			dispatcher = req.getRequestDispatcher(defaultURLPath + "teams.jsp");
			dispatcher.forward(req, resp);
			return;
		}else {
			if(teamList.contains(team)){	// teamList에 team이 포함되어있는 경우
				req.setAttribute("team", team);
				
				if(team.equals("teamAdd")){
					dispatcher=req.getRequestDispatcher(defaultURLPath + "teamAdd.jsp");
				}else{
					TeamsService service = new TeamsService();
					Teams oneTeam = null;
					
					try {
						// Team
						oneTeam = service.getOneTeam(team);
						
					}catch(Exception e) {
						e.printStackTrace();
					}
					
					if(oneTeam!= null ) {
						req.setAttribute("oneTeam", oneTeam);
					}
					
					dispatcher = req.getRequestDispatcher(defaultURLPath + "teamsEachMain.jsp");
				}
				
				dispatcher.forward(req, resp);
				return;
			}else {
				System.out.println("======================================");
				System.out.println("--404 페이지로 이동--");
			}
			
		}
		
	}

}
