package com.helpgpt.sports.match.model.vo;

import java.util.List;

public class MatchResult {
    private String matchDate;
    private String winTeam;
    private String loseTeam;
    private String matchPlace;
    private int winnerScore;
    private int loserScore;
    private String winPitcher;
    private String losePitcher;
    private int hitsWinner;
    private int hrWinner;
    private int soWinner;
    private int sbWinner;
    private int dpWinner;
    private int erWinner;
    private int hitsLoser;
    private int hrLoser;
    private int soLoser;
    private int sbLoser;
    private int dpLoser;
    private int erLoser;
    
    private List<PitcherRecord> winPitcherRecords;
    private List<PitcherRecord> losePitcherRecords;
    private List<HitterRecord> winHitterRecords;
    private List<HitterRecord> loseHitterRecords;

    // Getters and Setters

    public String getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(String matchDate) {
        this.matchDate = matchDate;
    }

    public String getWinTeam() {
        return winTeam;
    }

    public void setWinTeam(String winTeam) {
        this.winTeam = winTeam;
    }

    public String getLoseTeam() {
        return loseTeam;
    }

    public void setLoseTeam(String loseTeam) {
        this.loseTeam = loseTeam;
    }

    public String getMatchPlace() {
        return matchPlace;
    }

    public void setMatchPlace(String matchPlace) {
        this.matchPlace = matchPlace;
    }

    public int getWinnerScore() {
        return winnerScore;
    }

    public void setWinnerScore(int winnerScore) {
        this.winnerScore = winnerScore;
    }

    public int getLoserScore() {
        return loserScore;
    }

    public void setLoserScore(int loserScore) {
        this.loserScore = loserScore;
    }

    public String getWinPitcher() {
        return winPitcher;
    }

    public void setWinPitcher(String winPitcher) {
        this.winPitcher = winPitcher;
    }

    public String getLosePitcher() {
        return losePitcher;
    }

    public void setLosePitcher(String losePitcher) {
        this.losePitcher = losePitcher;
    }

    public int getHitsWinner() {
        return hitsWinner;
    }

    public void setHitsWinner(int hitsWinner) {
        this.hitsWinner = hitsWinner;
    }

    public int getHrWinner() {
        return hrWinner;
    }

    public void setHrWinner(int hrWinner) {
        this.hrWinner = hrWinner;
    }

    public int getSoWinner() {
        return soWinner;
    }

    public void setSoWinner(int soWinner) {
        this.soWinner = soWinner;
    }

    public int getSbWinner() {
        return sbWinner;
    }

    public void setSbWinner(int sbWinner) {
        this.sbWinner = sbWinner;
    }

    public int getDpWinner() {
        return dpWinner;
    }

    public void setDpWinner(int dpWinner) {
        this.dpWinner = dpWinner;
    }

    public int getErWinner() {
        return erWinner;
    }

    public void setErWinner(int erWinner) {
        this.erWinner = erWinner;
    }

    public int getHitsLoser() {
        return hitsLoser;
    }

    public void setHitsLoser(int hitsLoser) {
        this.hitsLoser = hitsLoser;
    }

    public int getHrLoser() {
        return hrLoser;
    }

    public void setHrLoser(int hrLoser) {
        this.hrLoser = hrLoser;
    }

    public int getSoLoser() {
        return soLoser;
    }

    public void setSoLoser(int soLoser) {
        this.soLoser = soLoser;
    }

    public int getSbLoser() {
        return sbLoser;
    }

    public void setSbLoser(int sbLoser) {
        this.sbLoser = sbLoser;
    }

    public int getDpLoser() {
        return dpLoser;
    }

    public void setDpLoser(int dpLoser) {
        this.dpLoser = dpLoser;
    }

    public int getErLoser() {
        return erLoser;
    }

    public void setErLoser(int erLoser) {
        this.erLoser = erLoser;
    }

    public List<PitcherRecord> getWinPitcherRecords() {
        return winPitcherRecords;
    }

    public void setWinPitcherRecords(List<PitcherRecord> winPitcherRecords) {
        this.winPitcherRecords = winPitcherRecords;
    }

    public List<PitcherRecord> getLosePitcherRecords() {
        return losePitcherRecords;
    }

    public void setLosePitcherRecords(List<PitcherRecord> losePitcherRecords) {
        this.losePitcherRecords = losePitcherRecords;
    }

    public List<HitterRecord> getWinHitterRecords() {
        return winHitterRecords;
    }

    public void setWinHitterRecords(List<HitterRecord> winHitterRecords) {
        this.winHitterRecords = winHitterRecords;
    }

    public List<HitterRecord> getLoseHitterRecords() {
        return loseHitterRecords;
    }

    public void setLoseHitterRecords(List<HitterRecord> loseHitterRecords) {
        this.loseHitterRecords = loseHitterRecords;
    }

	@Override
	public String toString() {
		return "MatchResult [matchDate=" + matchDate + ", winTeam=" + winTeam + ", loseTeam=" + loseTeam
				+ ", matchPlace=" + matchPlace + ", winnerScore=" + winnerScore + ", loserScore=" + loserScore
				+ ", winPitcher=" + winPitcher + ", losePitcher=" + losePitcher + ", hitsWinner=" + hitsWinner
				+ ", hrWinner=" + hrWinner + ", soWinner=" + soWinner + ", sbWinner=" + sbWinner + ", dpWinner="
				+ dpWinner + ", erWinner=" + erWinner + ", hitsLoser=" + hitsLoser + ", hrLoser=" + hrLoser
				+ ", soLoser=" + soLoser + ", sbLoser=" + sbLoser + ", dpLoser=" + dpLoser + ", erLoser=" + erLoser
				+ ", winPitcherRecords=" + winPitcherRecords + ", losePitcherRecords=" + losePitcherRecords
				+ ", winHitterRecords=" + winHitterRecords + ", loseHitterRecords=" + loseHitterRecords
				+ ", getMatchDate()=" + getMatchDate() + ", getWinTeam()=" + getWinTeam() + ", getLoseTeam()="
				+ getLoseTeam() + ", getMatchPlace()=" + getMatchPlace() + ", getWinnerScore()=" + getWinnerScore()
				+ ", getLoserScore()=" + getLoserScore() + ", getWinPitcher()=" + getWinPitcher()
				+ ", getLosePitcher()=" + getLosePitcher() + ", getHitsWinner()=" + getHitsWinner() + ", getHrWinner()="
				+ getHrWinner() + ", getSoWinner()=" + getSoWinner() + ", getSbWinner()=" + getSbWinner()
				+ ", getDpWinner()=" + getDpWinner() + ", getErWinner()=" + getErWinner() + ", getHitsLoser()="
				+ getHitsLoser() + ", getHrLoser()=" + getHrLoser() + ", getSoLoser()=" + getSoLoser()
				+ ", getSbLoser()=" + getSbLoser() + ", getDpLoser()=" + getDpLoser() + ", getErLoser()=" + getErLoser()
				+ ", getWinPitcherRecords()=" + getWinPitcherRecords() + ", getLosePitcherRecords()="
				+ getLosePitcherRecords() + ", getWinHitterRecords()=" + getWinHitterRecords()
				+ ", getLoseHitterRecords()=" + getLoseHitterRecords() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
    
    
}

