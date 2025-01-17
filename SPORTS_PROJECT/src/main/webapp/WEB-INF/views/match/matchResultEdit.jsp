<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/WEB-INF/views/layouts/header-dependencies.jsp"/>
	<link rel="stylesheet" href="${contextPath}/src/css/matchResultPlus.css">
	<script src="${contextPath}/src/js/matchResultPlus.js" defer></script>
	
	<title>Match Result Plus</title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<main>
		<div class=cardBackground>
			<div class="matchEnroll card__lblue ">
				<div class="matchEnroll">
					<div class="matchEnroll_Top">
						<div>경기 등록</div>
					</div>
					<div class="matchEnroll_Mid">
						<div class="dateSelectBox">
							<div class="dateSelect">
								<div>날짜 선택</div>
							</div>
							<div class="dateSelectDetail">
								<input type="date">
							</div>
						</div>
						<div class="winTeamBox">
							<div class="winTeam">
								<div>승리 팀 이름</div>
							</div>
							<div class="winTeamDetail">
								<select name="teamName" id="teamName">
									<option>----선택하세요----</option>
									<option value="KIA">KIA</option>
									<option value="LOTTE">LOTTE</option>
									<option value="SAMSUNG">SAMSUNG</option>
									<option value="HANWHA">HANWHA</option>
									<option value="KIUM">KIUM</option>
								</select>
							</div>
						</div>
						<div class="loseTeamBox">
							<div class="loseTeam">
								<div>패배 팀 이름</div>
							</div>
							<div class="loseTeamDetail">
								<select name="teamName" id="teamName">
									<option>----선택하세요----</option>
									<option value="KIA">KIA</option>
									<option value="LOTTE">LOTTE</option>
									<option value="SAMSUNG">SAMSUNG</option>
									<option value="HANWHA">HANWHA</option>
									<option value="KIUM">KIUM</option>
								</select>
							</div>
						</div>
						<div class="matchPlaceBox">
							<div class="matchPlace">
								<div>경기장 이름</div>
							</div>
							<div class="matchPlaceDetail">
								<select name="matchPlaceName" id="matchPlaceName">
									<option>----선택하세요----</option>
									<option value="창원NC파크">창원NC파크</option>
									<option value="대구삼성라이온즈파크">대구삼성라이온즈파크</option>
									<option value="고척스카이돔">고척스카이돔</option>
									<option value="광주기아챔피언스필드">광주기아챔피언스필드</option>
									<option value="인천SSG랜더스필드">인천SSG랜더스필드</option>
									<option value="수원KT위즈파크">수원KT위즈파크</option>
									<option value="사직야구장">사직야구장</option>
									<option value="서울종합운동장야구장">서울종합운동장야구장</option>
									<option value="대전한화생명이글스파크">대전한화생명이글스파크</option>
								</select>
							</div>
						</div>
						<div class="winTeamScoreBox">
							<div class="winTeamScore">
								<div>승리 팀 스코어</div>
							</div>
							<div class="winTeamScoreDetail">
								<input type="number" id="winnerScore" min="0">
							</div>
						</div>
						<div class="loseTeamScoreBox">
							<div class="loseTeamScore">
								<div>패배 팀 스코어</div>
							</div>
							<div class="loseTeamScoreDetail">
								<input type="number" id="loserScore" min="0">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class=cardBackground>
			<div class="matchDetail card__lblue ">
				<div class="matchDetail">
					<div class="matchDetail_Top">
					<div>경기 상세</div>
					</div>
					<div class="matchDetail_Mid">
						<div class="winPitcherBox">
							<div class="winPitcher">
								<div>승리 투수</div>
							</div>
							<div class="winPitcherDetail">
								<input type="text">
							</div>
						</div>
						<div class="losePitcherBox">
							<div class="losePitcher">
								<div>패배 투수</div>
							</div>
							<div class="losePitcherDetail">
								<input type="text">
							</div>
						</div>
						<div class="hitBox">
							<div class="hit">
								<div>안타	</div>
							</div>
							<div class="hitDetail">
								<div>승리 팀</div>
								<input type="number" id="hitsWinner">
								<div>패배 팀</div>
								<input type="number" id="hitsLoser">
							</div>
						</div>
						<div class="homeRunBox">
							<div class="homeRun">
								<div>홈런</div>
							</div>
							<div class="homeRunDetail">
								<div>승리 팀</div>
								<input type="number" id="hrWinner">
								<div>패배 팀</div>
								<input type="number" id="hrLoser">
							</div>
						</div>
						<div class="threeStrikeBox">
							<div class="threeStrike">
								<div>삼진</div>
							</div>
							<div class="threeStrikeDetail">
								<div>승리 팀</div>
								<input type="number" id="soWinner">
								<div>패배 팀</div>
								<input type="number" id="soLoser">
							</div>
						</div>
						<div class="stoleBaseBox">
							<div class="stoleBase">
								<div>도루</div>
							</div>
							<div class="stoleBaseDetail">
								<div>승리 팀</div>
								<input type="number" id="sbWinner">
								<div>패배 팀</div>
								<input type="number" id="sbLoser">
							</div>
						</div>
						<div class="doublePlayBox">
							<div class="doublePlay">
								<div>병살</div>
							</div>
							<div class="doublePlayDetail">
								<div>승리 팀</div>
								<input type="number" id="dpWinner">
								<div>패배 팀</div>
								<input type="number" id="dpLoser">
							</div>
						</div>
						<div class="errorBox">
							<div class="error">
								<div>실책</div>
							</div>
							<div class="errorDetail">
								<div>승리 팀</div>
								<input type="number" id="erWinner">
								<div>패배 팀</div>
								<input type="number" id="erLoser">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<button onclick ="calculateResults()">결과 계산</button>
		<div class=cardBackground>
			<div class="matchDetail card__lblue ">
				<div class="matchDetail">
					<div class="matchDetail_Top">
							<div>승리 팀 투수 기록</div>
						<div class="buttons">
							<button onclick="addRow()">+</button>
							<button onclick="removeRow()">-</button>
						</div>
					</div>
					<table id=statsTableWin>
						<thead>
							<tr>
								<th>선수이름</th>
								<th>이닝</th>
								<th>투구 수</th>
								<th>피안타</th>
								<th>피홈런</th>
								<th>탈삼진</th>
								<th>사사구</th>
								<th>실점</th>
								<th>자책</th>
								<th>ERA</th>
								<th>whip</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<select>
										<option>--선택해보셈--</option>
										<option value=김김김>김김김</option>
										<option value=동동동>동동동</option>
									</select>
								
								</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
							<tr>
								<td>김동준</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
							<tr>
								<td>김동준</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class=cardBackground>
			<div class="matchDetail card__lblue ">
				<div class="matchDetail">
					<div class="matchDetail_Top">
							<div>패배 팀 투수 기록</div>
						<div class="buttons">
							<button onclick="addRow2()">+</button>
							<button onclick="removeRow2()">-</button>
						</div>
					</div>
					<table id=statsTableLose>
						<tr>
							<th>선수이름</th>
							<th>이닝</th>
							<th>투구 수</th>
							<th>피안타</th>
							<th>피홈런</th>
							<th>탈삼진</th>
							<th>사사구</th>
							<th>실점</th>
							<th>자책</th>
							<th>ERA</th>
							<th>whip</th>
						</tr>
						<tr>
							<td>김동준</td>
							<td>6</td>
							<td>83</td>
							<td>7</td>
							<td>1</td>
							<td>5</td>
							<td>0</td>
							<td>3</td>
							<td>3</td>
							<td>3.02</td>
							<td>1.20</td>
						</tr>
						<tr>
							<td>김동준</td>
							<td>6</td>
							<td>83</td>
							<td>7</td>
							<td>1</td>
							<td>5</td>
							<td>0</td>
							<td>3</td>
							<td>3</td>
							<td>3.02</td>
							<td>1.20</td>
						</tr>
						<tr>
							<td>김동준</td>
							<td>6</td>
							<td>83</td>
							<td>7</td>
							<td>1</td>
							<td>5</td>
							<td>0</td>
							<td>3</td>
							<td>3</td>
							<td>3.02</td>
							<td>1.20</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class=cardBackground>
			<div class="matchDetail card__lblue ">
				<div class="matchDetail">
					<div class="matchDetail_Top">
							<div>승리 팀 타자 기록</div>
						<div class="buttons">
							<button onclick="addRow3()">+</button>
							<button onclick="removeRow3()">-</button>
						</div>
					</div>
					<table id=statsTableWinHit>
						<tr>
							<th>선수이름</th>
							<th>타수</th>
							<th>안타</th>
							<th>2타</th>
							<th>3타</th>
							<th>홈런</th>
							<th>득점</th>
							<th>타점</th>
							<th>삼진</th>
							<th>사사구</th>
							<th>타율</th>
						</tr>
						<tr>
							<td>김동준</td>
							<td>6</td>
							<td>83</td>
							<td>7</td>
							<td>1</td>
							<td>5</td>
							<td>0</td>
							<td>3</td>
							<td>3</td>
							<td>3.02</td>
							<td>1.20</td>
						</tr>
						<tr>
							<td>김동준</td>
							<td>6</td>
							<td>83</td>
							<td>7</td>
							<td>1</td>
							<td>5</td>
							<td>0</td>
							<td>3</td>
							<td>3</td>
							<td>3.02</td>
							<td>1.20</td>
						</tr>
						<tr>
							<td>김동준</td>
							<td>6</td>
							<td>83</td>
							<td>7</td>
							<td>1</td>
							<td>5</td>
							<td>0</td>
							<td>3</td>
							<td>3</td>
							<td>3.02</td>
							<td>1.20</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class=cardBackgroundLast>
			<div class="matchDetail card__lblue ">
				<div class="matchDetail">
					<div class="matchDetail_Top">
							<div>패배 팀 타자 기록</div>
						<div class="buttons">
							<button onclick="addRow4()">+</button>
							<button onclick="removeRow4()">-</button>
						</div>
					</div>
					<table id=statsTableLoseHit>
						<tr>
							<th>선수이름</th>
							<th>타수</th>
							<th>안타</th>
							<th>2타</th>
							<th>3타</th>
							<th>홈런</th>
							<th>득점</th>
							<th>타점</th>
							<th>삼진</th>
							<th>사사구</th>
							<th>타율</th>
						</tr>
						<tr>
							<td>김동준</td>
							<td>6</td>
							<td>83</td>
							<td>7</td>
							<td>1</td>
							<td>5</td>
							<td>0</td>
							<td>3</td>
							<td>3</td>
							<td>3.02</td>
							<td>1.20</td>
						</tr>
						<tr>
							<td>김동준</td>
							<td>6</td>
							<td>83</td>
							<td>7</td>
							<td>1</td>
							<td>5</td>
							<td>0</td>
							<td>3</td>
							<td>3</td>
							<td>3.02</td>
							<td>1.20</td>
						</tr>
						<tr>
							<td>김동준</td>
							<td>6</td>
							<td>83</td>
							<td>7</td>
							<td>1</td>
							<td>5</td>
							<td>0</td>
							<td>3</td>
							<td>3</td>
							<td>3.02</td>
							<td>1.20</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	<div class=editButton>	
		<button class=btn-medium__dblue>수정</button>
		<button class=btn-medium__dblue>삭제</button>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>

</html>