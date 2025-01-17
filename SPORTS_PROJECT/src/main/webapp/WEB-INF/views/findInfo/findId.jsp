<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/WEB-INF/views/layouts/header-dependencies.jsp"/>
	<link rel="stylesheet" href="${contextPath}/src/css/login.css">
	<script src="${contextPath}/src/js/findInfo.js" defer></script>
	<title>MLB - findId</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
	<main>
		<input type="hidden" id="resultMessage" value="${message}"/>
        <section class="container">
            <p class="header-text"> 아이디 찾기 </p>
            <hr class="hr__gray">
            <form name="findIdForm" class="login-form base__lblue br-15 box-shadow" action="${contextPath}/api/findUser/findId" method="post" onsubmit="return findId()">
                <div class="login-essential mt-20">
                    <div>
                        <input class="box-shadow" type="text" name="find_email" placeholder="EMAIL : *가입에 사용하신 이메일을 입력해주세요">
                    </div>
                    <div>
                        <input class="box-shadow"  type="text" name="find_name" placeholder="NAME : *가입에 사용하신 이름을 입력해주세요">
                    </div>
                </div>
                <button class="btn-big__blue">
                    아이디 찾기
                </button>
                <div class="login-sub">
                    <div>
						<a class="fc__gray text-hover__gray" href="${contextPath}/findInfo/findPw">비밀번호 찾기</a>
						|<a class="fc__gray text-hover__gray" href="${contextPath}/login">로그인</a>
                    </div>
                    <img src="${contextPath}/public/images/mlb_logo2.jpg">
                </div>
            </form>
        </section>
    </main>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
</body>
</html>