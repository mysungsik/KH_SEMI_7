<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>matchMain</title>
<link rel="stylesheet" href="${contextPath}/src/css/matchMain.css">
<link rel="stylesheet" href="${contextPath}/src/css/dashboard.css">
<jsp:include page="/WEB-INF/views/layouts/header-dependencies.jsp" />
<script src="${contextPath}/src/js/matchMain.js" defer></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/layouts/header.jsp" />
    <main>
        <section class="container">
            <div class="main">
                <div class="main-top card__lblue">
                    <div class="main-top-bar fs-20__b base__mblue">
                        <p>KBO 순위</p>
                        <div class="more">
                            <a href="${contextPath}/match/teamRanking">더보기</a>
                        </div>
                    </div>

                    <div>
                        <table class="teamRanking">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>팀명</th>
                                    <th>경기</th>
                                    <th>승</th>
                                    <th>패</th>
                                    <th>게임차</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="matchschedule">
                    <video class="main-video" autoplay muted loop>
                        <source src="${contextPath}/public/video/backgroundVideo.mp4"
                            id=backgroundVideo>
                    </video>
                    <div class="videoText">
                        <a href="${contextPath}/match/matchDate">경기일정</a>
                    </div>
                </div>
                <div class="player-ranking card__lblue">
                    <div class="player-ranking-top fs-20__b base__mblue" >
                        <p>선수 순위</p>
                    </div>
                    <div class=player_record>
                        <div class="box-ranking">
                            <strong class="rankingCategory">다승</strong>
                            <div class="profileImage">
                                <img src="${contextPath}/public/images/user_img1.jpg" alt="#"
                                    id="playerImage">
                            </div>
                            <ol class="list_ranking">
                                
                            </ol>
                        </div>
                        <div class="box-ranking">
                            <strong class="rankingCategory">평균자책</strong>
                            <div class="profileImage">
                                <img src="${contextPath}/public/images/user_img1.jpg" alt="#"
                                    id="playerImage">
                            </div>
                            <ol class="list_ranking">
                                
                            </ol>
                        </div>
                        <div class="box-ranking">
                            <strong class="rankingCategory">탈삼진</strong>
                            <div class="profileImage">
                                <img src="${contextPath}/public/images/user_img1.jpg" alt="#"
                                    id="playerImage">
                            </div>
                            <ol class="list_ranking">
                                
                            </ol>
                        </div>
                        <div class="box-ranking">
                            <strong class="rankingCategory">안타</strong>
                            <div class="profileImage">
                                <img src="${contextPath}/public/images/user_img1.jpg" alt="#"
                                    id="playerImage">
                            </div>
                            <ol class="list_ranking">
                               
                            </ol>
                        </div>
                        <div class="box-ranking">
                            <strong class="rankingCategory">WHIP</strong>
                            <div class="profileImage">
                                <img src="${contextPath}/public/images/user_img1.jpg" alt="#"
                                    id="playerImage">
                            </div>
                            <ol class="list_ranking">
                                
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>

</html>
