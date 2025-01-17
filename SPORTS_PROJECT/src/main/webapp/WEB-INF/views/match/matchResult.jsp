<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="${contextPath}/src/css/matchResult.css">
<jsp:include page="/WEB-INF/views/layouts/header-dependencies.jsp" />
<script src="${contextPath}/src/js/matchResult.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>MLB Match</title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<main>
		<div class="main-content">
			<div class="scoreboard">
				<div class="team">
					<span class="team-name">기아 타이거즈</span>
					<div class="score">11</div>
				</div>
				<div class="inning-scores">
					<table>
						<thead>
							<tr>
								<th></th>
								<th>1</th>
								<th>2</th>
								<th>3</th>
								<th>4</th>
								<th>5</th>
								<th>6</th>
								<th>7</th>
								<th>8</th>
								<th>9</th>
								<th>R</th>
								<th>H</th>
								<th>E</th>
								<th>B</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>기아 타이거즈</td>
								<td>3</td>
								<td>3</td>
								<td>1</td>
								<td>4</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>11</td>
								<td>14</td>
								<td>1</td>
								<td>6</td>
							</tr>
							<tr>
								<td>한화 이글스</td>
								<td>1</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>1</td>
								<td>6</td>
								<td>0</td>
								<td>3</td>
							</tr>
						</tbody>
					</table>
					<div class="game-info">
						<span>06.22 (토) 03:20 기아 챔피언스 필드 </span>
					</div>
				</div>
				<div class="team">
					<div class="score">1</div>
					<span class="team-name">한화 이글스</span>
				</div>


			</div>
			<div class="game-summary card__lblue ">
				<div class="game-summary">
					<div class="team-score">
						<div class="team-logo">팀 1 로고 이미지</div>
						<div class="score-box">11 : 1</div>
						<div class="team-logo">팀 2 로고 이미지</div>
					</div>
				</div>
				<div class="game-summary-bot">
					<button type="button" class="btn-medium__dblue"
						onclick="location.href='matchStadiumInfo'">경기장 정보</button>
				</div>
			</div>
			<br> <br>
			<div class="result-section card__lblue ">
				<div class="result-section">
					<div class="result-sectionTop fs-20__b base__mblue">
						<p>경기 결과</p>
					</div>
					<div class="team-results">
						<div class="team-result">
							<div class="team-image"></div>
							<div class="player-name">퀸 타나</div>
							<div class="result-win">승리</div>
						</div>
						<div class="team-result">
							<div class="team-image"></div>
							<div class="player-name">이마나가</div>
							<div class="result-lose">패배</div>
						</div>
					</div>
				</div>
			</div>
			<br> <br>
			<div class="game-records card__lblue ">
				<div class="game-records">
					<div class="game-recordsTop fs-20__b base__mblue">
						<p>경기 기록</p>
					</div>
					<div class="team-logos">
						<div class="team-logo">팀 로고 이미지</div>
						<div class="score-box">11 : 1</div>
						<div class="team-logo">팀 로고 이미지</div>
					</div>
					<div class='chart-container'>
						<canvas id="teamStatsChart" class="w-100"></canvas>
					</div>
				</div>
			</div>
			<br> <br>
			<div class="pitching-records card__lblue ">
				<div class="pitching-records">
					<div class="result-sectionTop fs-20__b base__mblue">
						<p>투수 기록</p>
					</div>
					<table class=record_detail>
						<thead>
							<tr>
								<th>시카고C</th>
								<th>이닝</th>
								<th>투구수</th>
								<th>피안타</th>
								<th>피홈런</th>
								<th>탈삼진</th>
								<th>볼넷</th>
								<th>사사구</th>
								<th>실점</th>
								<th>자책</th>
								<th>ERA</th>
								<th>WHIP</th>
							</tr>
						</thead>
						<tbody>
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
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
							<tr>
								<td>동동동</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
							<tr>
								<td>김김김</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
							<tr>
								<td>준준준</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
							<tr>
								<td>djkim</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
						</tbody>
					</table>
					<table>
						<thead>
							<tr>
								<th>뉴욕메츠</th>
								<th>이닝</th>
								<th>투구수</th>
								<th>피안타</th>
								<th>피홈런</th>
								<th>탈삼진</th>
								<th>볼넷</th>
								<th>사사구</th>
								<th>실점</th>
								<th>자책</th>
								<th>ERA</th>
								<th>WHIP</th>
							</tr>
						</thead>
						<tbody>
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
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
							<tr>
								<td>동동동</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
							<tr>
								<td>김김김</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
							<tr>
								<td>준준준</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
							<tr>
								<td>djkim</td>
								<td>6</td>
								<td>83</td>
								<td>7</td>
								<td>1</td>
								<td>5</td>
								<td>0</td>
								<td>3</td>
								<td>3</td>
								<td>3</td>
								<td>3.02</td>
								<td>1.20</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br> <br>
			<div class="batting-records card__lblue ">
				<div class="batting-records">
					<div class="result-sectionTop fs-20__b base__mblue">
						<p>타자 기록</p>
					</div>
					<table class=record_detail>
						<thead>
							<tr>
								<th>시카고C</th>
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
						</thead>
						<tbody>
							<tr>
								<td>호너</td>
								<td>3</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>1</td>
								<td>0</td>
								<td>2</td>
								<td>1</td>
								<td>0.236</td>
							</tr>
							<tr>
								<td>호너</td>
								<td>3</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>1</td>
								<td>0</td>
								<td>2</td>
								<td>1</td>
								<td>0.236</td>
							</tr>
							<tr>
								<td>호너</td>
								<td>3</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>1</td>
								<td>0</td>
								<td>2</td>
								<td>1</td>
								<td>0.236</td>
							</tr>
							<tr>
								<td>호너</td>
								<td>3</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>1</td>
								<td>0</td>
								<td>2</td>
								<td>1</td>
								<td>0.236</td>
							</tr>
						<thead>
					</table>
					<table class=record_detail>
						<tr>
							<th>시카고C</th>
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
							<td>호너</td>
							<td>3</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>1</td>
							<td>0</td>
							<td>2</td>
							<td>1</td>
							<td>0.236</td>
						</tr>
						<tr>
							<td>호너</td>
							<td>3</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>1</td>
							<td>0</td>
							<td>2</td>
							<td>1</td>
							<td>0.236</td>
						</tr>
						<tr>
							<td>호너</td>
							<td>3</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>1</td>
							<td>0</td>
							<td>2</td>
							<td>1</td>
							<td>0.236</td>
						</tr>
						<tr>
							<td>호너</td>
							<td>3</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>1</td>
							<td>0</td>
							<td>2</td>
							<td>1</td>
							<td>0.236</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div>
			<a href="${contextPath}/match/matchResultPlus">경기결과 추가</a>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>

</html>