<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>matchMain</title>
<link rel="stylesheet" href="${contextPath}/src/css/matchMain.css">
<link rel="stylesheet" href="${contextPath}/src/css/dashboard.css">
<jsp:include page="/WEB-INF/views/layouts/header-dependencies.jsp" />
<script src="${contextPath}/src/js/dashboard.js" defer></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<main>
		<section class="container">
			<div class="main">
				<div class="main-top card__lblue">
					<div class="main-top-bar fs-20__b fc__blue">
						<p >MLB 순위</p>
						<div class="more">
							<a href="${contextPath}/match/teamRanking">더보기</a>
						</div>
					</div>
					<hr class="hr__gray mt-10 mb-16">
					<div class="ranking-tab">
						<div>
							<span>AL</span> <a href=""> 동부 </a> <a href=""> 중부 </a> <a
								href=""> 서부 </a>
						</div>
						<div>
							<span>NL</span> <a href=""> 동부 </a> <a href=""> 중부 </a> <a
								href=""> 서부 </a>
						</div>
					</div>
					<div>
						<table class="teamRanking">
							<tr>
								<th></th>
								<th>팀명</th>
								<th>경기</th>
								<th>승</th>
								<th>패</th>
								<th>게임차</th>
							</tr>
							<tr>
								<td>1</td>
								<td>뉴욕 Y</td>
								<td>81</td>
								<td>52</td>
								<td>29</td>
								<td>-</td>
							</tr>
							<tr>
								<td>2</td>
								<td>볼티모어</td>
								<td>79</td>
								<td>49</td>
								<td>30</td>
								<td>2</td>
							</tr>
							<tr>
								<td>3</td>
								<td>보스턴</td>
								<td>80</td>
								<td>43</td>
								<td>37</td>
								<td>8.5</td>
							</tr>
							<tr>
								<td>4</td>
								<td>탬파베이</td>
								<td>80</td>
								<td>40</td>
								<td>40</td>
								<td>11.5</td>
							</tr>
							<tr>
								<td>5</td>
								<td>토론토</td>
								<td>79</td>
								<td>36</td>
								<td>43</td>
								<td>15</td>
							</tr>
						</table>
					</div>
				</div>
				<div>
					<a href="${contextPath}/match/matchResult">경기결과</a>
				</div>
				<div class="matchschedule">
					<video class="main-video" autoplay muted loop>
						<source src="/SPORTS_PROJECT/public/video/backgroundVideo.mp4"
							id=backgroundVideo>
					</video>
					<div class="videoText">
						<a href="${contextPath}/match/matchDate">경기일정</a>
					</div>
				</div>
				<div class="player-ranking card__lblue">
					<div class="player-ranking-top fs-20__b fc__blue">
						<p>선수 순위</p>
					</div>
					<hr class="hr__gray mt-10 mb-16">
					<div class=player_record>
						<div class="box-ranking">
							<strong class="rankingCategory">다승</strong>
							<div class="profileImage">
								<img src="/SPORTS_PROJECT/public/images/user_img1.jpg" alt="#"
									id="playerImage">
							</div>
							<ol class="list_ranking">
								<li><span>1 헤이수스(키움)</span> <span class="count">10승</span></li>
								<li><span>2 엔스(LG)</span> <span class="count">9승</span></li>
								<li><span>3 원커슨(롯데)</span> <span class="count">8승</span></li>
								<li><span>4 후라도(키움)</span> <span class="count">7승</span></li>
								<li><span>5 네일(KIA)</span> <span class="count">6승</span></li>
							</ol>
						</div>
						<div class="box-ranking">
							<strong class="rankingCategory">평균자책</strong>
							<div class="profileImage">
								<img src="/SPORTS_PROJECT/public/images/user_img1.jpg" alt="#"
									id="playerImage">
							</div>
							<ol class="list_ranking">
								<li>네일(KIA)</li>
								<li>하트(NC)</li>
								<li>원태인(삼성)</li>
								<li>후라도(키움)</li>
								<li>헤이수스(키움)</li>
							</ol>
						</div>
						<div class="box-ranking">
							<strong class="rankingCategory">탈삼진</strong>
							<div class="profileImage">
								<img src="/SPORTS_PROJECT/public/images/user_img1.jpg" alt="#"
									id="playerImage">
							</div>
							<ol class="list_ranking">
								<li>하트(NC)</li>
								<li>네일(KIA)</li>
								<li>코너(삼성)</li>
								<li>엄상백(KT)</li>
								<li>쿠에바스(KT)</li>
							</ol>
						</div>
						<div class="box-ranking">
							<strong class="rankingCategory">세이브</strong>
							<div class="profileImage">
								<img src="/SPORTS_PROJECT/public/images/user_img1.jpg" alt="#"
									id="playerImage">
							</div>
							<ol class="list_ranking">
								<li>오승환(삼성)</li>
								<li>정해영(KIA)</li>
								<li>문승원(SSG)</li>
								<li>유영찬(LG)</li>
								<li>김원중(롯데)</li>
							</ol>
						</div>
						<div class="box-ranking">
							<strong class="rankingCategory">WHIP</strong>
							<div class="profileImage">
								<img src="/SPORTS_PROJECT/public/images/user_img1.jpg" alt="#"
									id="playerImage">
							</div>
							<ol class="list_ranking">
								<li>월커슨(롯데)</li>
								<li>하트(NC)</li>
								<li>헤이수스(키움)</li>
								<li>네일(KIA)</li>
								<li>쿠에바스(KT)</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="container-bot" style="width:1024px">
					<div class="hightlight-clip card__lblue swiper swiper-highlight">
						<p class="content-header fs-20__b fc__blue">HIGHTLIGHT CLIP</p>
						<p class="content-all fc__blue fs-10 text-hover__blue">See All
							Clips</p>
						<hr class="hr__gray mt-10 mb-16">
						<!-- 하단 하이라이트 클립 작성 -->
						<div class="news-content-top d-flex swiper-wrapper">
							<div class="card-thumbnail swiper-slide">
								<img class="card-thumbnail-img"
									src="${contextPath}/public/images/news_example.jpg">
								<div class="card-thumbnail-infos">
									<div class="card-thumbnail-title">'9실점 악몽' 준 키움과 2달 만에
										ㅁㅁㅁㅁㅁㅁaaaaaaaㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>
									<div class="card-thumbnail-content">
										<p>일반영상</p>
										<p>
											▷ <span> 9995 </span>
										</p>
										<p>2024.06.18</p>
									</div>
								</div>
							</div>
							<div class="card-thumbnail swiper-slide">
								<img class="card-thumbnail-img"
									src="${contextPath}/public/images/news_example.jpg">
								<div class="card-thumbnail-infos">
									<div class="card-thumbnail-title">'9실점 악몽' 준 키움과 2달 만에
										ㅁㅁㅁㅁㅁㅁaaaaaaaㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>
									<div class="card-thumbnail-content">
										<p>일반영상</p>
										<p>
											▷ <span> 9995 </span>
										</p>
										<p>2024.06.18</p>
									</div>
								</div>
							</div>
							<div class="card-thumbnail swiper-slide">
								<img class="card-thumbnail-img"
									src="${contextPath}/public/images/news_example.jpg">
								<div class="card-thumbnail-infos">
									<div class="card-thumbnail-title">'9실점 악몽' 준 키움과 2달 만에
										ㅁㅁㅁㅁㅁㅁaaaaaaaㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>
									<div class="card-thumbnail-content">
										<p>일반영상</p>
										<p>
											▷ <span> 9995 </span>
										</p>
										<p>2024.06.18</p>
									</div>
								</div>
							</div>
							<div class="card-thumbnail swiper-slide">
								<img class="card-thumbnail-img"
									src="${contextPath}/public/images/news_example.jpg">
								<div class="card-thumbnail-infos">
									<div class="card-thumbnail-title">'9실점 악몽' 준 키움과 2달 만에
										ㅁㅁㅁㅁㅁㅁaaaaaaaㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>
									<div class="card-thumbnail-content">
										<p>일반영상</p>
										<p>
											▷ <span> 9995 </span>
										</p>
										<p>2024.06.18</p>
									</div>
								</div>
							</div>
							<div class="card-thumbnail swiper-slide">
								<img class="card-thumbnail-img"
									src="${contextPath}/public/images/news_example.jpg">
								<div class="card-thumbnail-infos">
									<div class="card-thumbnail-title">'9실점 악몽' 준 키움과 2달 만에
										ㅁㅁㅁㅁㅁㅁaaaaaaaㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>
									<div class="card-thumbnail-content">
										<p>일반영상</p>
										<p>
											▷ <span> 9995 </span>
										</p>
										<p>2024.06.18</p>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>


</html>