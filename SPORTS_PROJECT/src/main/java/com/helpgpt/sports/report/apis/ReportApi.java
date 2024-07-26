package com.helpgpt.sports.report.apis;

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
import com.helpgpt.sports.login.model.vo.User;
import com.helpgpt.sports.report.model.service.ReportService;
import com.helpgpt.sports.report.model.vo.Report;

/**
 * Servlet implementation class ReportApi
 */
@WebServlet("/api/report/*")
public class ReportApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReportService service = new ReportService();
      
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		User loginUser = null;

		// Path 지정
		String reqPath = req.getPathInfo();
		String path = "";

		if (reqPath != null) {
			path = reqPath.split("/")[1];
		}
		
		// Admin 권한 확인
		HttpSession session = req.getSession(false);
		loginUser = (User)session.getAttribute("loginUser");
		String adminAuthority = loginUser.getUserAuthority();
		
		Map<String, Object> result = new HashMap<>();
		
		// 권한 있다면 실행
		if (adminAuthority.equals("A")) {
			// 경로에 따라 필요한 기능을 사용
			switch (path) {
				case "getReportAll" : {
					List<Report> reportList = service.getReportAll();
					
					if (reportList.size() > 0) {
						result.put("message", "success get all report");
						result.put("data", reportList);
						new Gson().toJson(result, out);
					}else {
						result.put("message", "failed to get all report");
						new Gson().toJson(result, out);
					}
				};break;
			}
		}

		// 권한 없다면
		else {
			result.put("message", "You do not have permission");
			
			new Gson().toJson(result, out);
			return;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		User loginUser = null;
		// Path 지정
		String reqPath = req.getPathInfo();
		String path = "";

		if (reqPath != null) {
			path = reqPath.split("/")[1];
		}
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 유저 확인
		HttpSession session = req.getSession(false);
		if (session != null) {
			loginUser = (User)session.getAttribute("loginUser");
		}else {
			result.put("message", "로그인된 사용자만 이용가능합니다.");
			new Gson().toJson(result, out);
			
			return;
		}

		// 경로에 따라 필요한 기능을 사용
		switch (path) {
			case "insertReply" : {
			};break;
		}
	}
}