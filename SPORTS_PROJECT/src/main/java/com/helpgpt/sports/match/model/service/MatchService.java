package com.helpgpt.sports.match.model.service;

import static com.helpgpt.sports.common.util.JDBCTemplate.close;
import static com.helpgpt.sports.common.util.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.helpgpt.sports.match.model.dao.MatchDao;
import com.helpgpt.sports.match.model.vo.Match;

public class MatchService {
    MatchDao dao = new MatchDao();

    public List<Match> getMatchesByDay(String day) {
        Connection conn = getConnection();
        List<Match> matchList = dao.getMatchesByDay(conn, day);
        close(conn);
        return matchList;
    }

    public List<Match> getTeamRankings() {
        Connection conn = getConnection();
        List<Match> teamRankings = dao.getTeamRankings(conn);
        close(conn);
        return teamRankings;
    }
}
