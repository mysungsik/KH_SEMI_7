<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/WEB-INF/views/layouts/header-dependencies.jsp"/>
	<link rel="stylesheet" href="${contextPath}/src/css/signup.css">
	<script src="${contextPath}/src/js/signup.js" defer></script>
	<title>MLB - Signup</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
	<main>
        <section class="container">
            <p class="header-text"> 회원가입 </p>
            <hr class="hr__gray">
            <form name="signupForm" class="signup-form base__lblue br-15 box-shadow" action="post">
                <p class="fs-20__b"> 필수 정보</p>
                <div class="signup-essential mt-10">
                    <div>
                        <input class="box-shadow" type="text" name="signup_id" placeholder="ID : *소문자를 포함 5~13 글자 / 대문자 및 숫자 사용가능">
                    </div>
                    <div>
                        <input class="box-shadow"  type="password" name="signup_pw" placeholder="PW : *최소 한개의 소문자, 대문자, 숫자를 포함 10~20 글자 / 특수문자 사용가능">
                        <img class="password-eye" src="${contextPath}/public/icons/eye-closed.png">
                    </div>
                    <div>
                        <input class="box-shadow" type="text" name="signup_email" placeholder="EMAIL : 이메일 형식">
                    </div>
                    <div>
                        <input class="box-shadow" type="text" name="signup_name" placeholder="NAME : 2~4글자의 한글">
                    </div>
                </div>
                <p class="fs-20__b"> 추가 정보</p>
                <div class="signup-unnecessary mt-10">
                    <input class="box-shadow" type="text" name="signup_bd" placeholder="생년원일 : YYYYMMDD 형식 입력">
                    <input class="box-shadow" type="text" name="signup_phone" placeholder="전화번호 : ( - 없이 입력)">
                    <input class="box-shadow" type="text" name="signup_address" placeholder="주소 : OO시, OO동 형식 입력">
                    <div class="radio-box-container">
                        <div class="radio-box">
                            <input type="radio" name="signup_gender" id="gender-m" value="m"><label for="gender-m">남자</label>
                            <input type="radio" name="signup_gender" id="gender-f" value="f"><label for="gender-f">여자</label>
                        </div>
                        <div class="radio-box">
                            <input type="radio" name="signup_nation" id="region-ko" value="ko"><label for="region-ko">내국인</label>
                            <input type="radio" name="signup_nation" id="region-fo" value="fo"><label for="region-fo">외국인</label>
                        </div>
                    </div>
                </div>
	            <button class="btn-big__blue">    
	                회원가입
	            </button>
            </form>
        </section>
    </main>
    
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
</body>
</html>