<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${contextPath}/src/css/teamsEachHeader.css">
	<link rel="stylesheet" href="${contextPath}/src/css/teamPlayers.css">
	 
    <jsp:include page="/WEB-INF/views/layouts/header-teams-dependencies.jsp"/>
    <jsp:include page="/WEB-INF/views/layouts/header-dependencies.jsp"/>

    <script src="${contextPath}/src/js/teamPlayers.js" defer></script>	
    <title>TeamPlayers</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header-teams.jsp"/>
	
	<input type="hidden" value="${type}" name="type">
	<!-- 페이지 커버 -->
	<div class="pagecover">
		<div class="pagecover-img">
			<div class="fc__white"><a href="players?type=0" class="fs-28__b">선수 소개</a></div>
			
			<div class="fc__white">
				<i class="fa-solid fa-house"></i>
				 > PLAYERS > 선수 소개
			</div>
		</div>
		<!-- 소개띠 -->
			
		<!-- 소개띠 끝 -->
	</div>
	<!-- 페이지 커버 끝 -->
	<!-- 메인 시작 -->
	<main>
		<!-- 플레이어 시작 -->
		<div class="team-players">
			<div class="button-area">
				
			</div>
			<div class="team-player-table">
			</div>
		</div>
	
	</main>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
</body>
</html>