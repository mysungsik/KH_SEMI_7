<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="${contextPath}/src/css/profile.css">
    <script src="${contextPath}/src/js/profile.js" defer></script>
    
    <title>MLB - Na</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/layouts/header.jsp"/>

    <main>
        <section class="container">
        	<!-- 사이드바 -->
            <jsp:include page="/WEB-INF/views/profile/profileSidebar.jsp"></jsp:include>
            
            <!-- 메인컨텐츠 -->
            <div class="profile-content">
            	<!-- 컨텐츠 > 헤더 -->
                <p class="content-title fs-28__b"> 내 정보 관리</p>
                <hr class="hr__gray mt-20">
                
                <!-- 컨텐츠 > 메인 -->
                <div class="profile-info">
                	<p class="info-header fs-20__b"> 로그인 정보 </p>
                	<div class="info-contents card__lblue">
                		<div>
                			<p class="fs-12__b"> E-mail </p>
                			<p class="fc__blue fs-12__b text-hover__blue"> test_email@test.com <span> > </span></p>
                		</div>
                		<div>
                			<p class="fs-12__b"> Phone Number </p>
                			<p class="fc__blue fs-12__b text-hover__blue"> 010-0101-0101 <span> > </span></p>
                		</div>
                		<div>
                			<p class="fs-12__b"> SNS Address </p>
                			<p class="fc__blue fs-12__b text-hover__blue"> instagram@insta.com <span> > </span></p>
                		</div>
                	</div>
                </div>
                
                <!-- Button trigger modal -->
                <div class="profile-info">
                	<p class="info-header fs-20__b"> 정보 제공 동의 </p>
                	<div class="info-contents card__lblue">
                		<div>
                			<p class="fs-12__b"> E-mail </p>
                			<div class="form-check form-switch" data-type="email">
							  <input class="form-check-input" type="checkbox" role="switch" id="emailAgree" name="emailAgree">
							  <label class="form-check-label" for="emailAgree">OFF</label>
							</div>
                		</div>
                		<div>
                			<p class="fs-12__b"> Phone Number </p>
               				<div class="form-check form-switch" data-type="phone">
							  <input class="form-check-input" type="checkbox" role="switch" id="phoneAgree" name="phoneAgree">
							  <label class="form-check-label" for="phoneAgree">OFF</label>
							</div>
                		</div>
                		<div>
                			<p class="fs-12__b"> SNS Address </p>
               				<div class="form-check form-switch" data-type="sns">
							  <input class="form-check-input" type="checkbox" role="switch" id="snsAgree" name="snsAgree">
							  <label class="form-check-label" for="snsAgree">OFF</label>
							</div>
                		</div>
                	</div>
                </div>
                <div class="profile-info">
                	<p class="info-header fs-20__b"> 추가 정보 </p>
                	<div class="info-contents card__lblue">
                		<div>
                			<p class="fs-12__b"> BirthDay </p>
                			<p class="fc__blue fs-12__b text-hover__blue"> EDIT <span> > </span></p>
                		</div>
                		<div>
                			<p class="fs-12__b"> Local Address </p>
                			<p class="fc__blue fs-12__b text-hover__blue"> EDIT <span> > </span></p>
                		</div>
                		<div>
                			<p class="fs-12__b"> Login History </p>
                			<p class="fc__blue fs-12__b text-hover__blue"> VIEW <span> > </span></p>
                		</div>
                	</div>
                </div>
            </div>
        </section>
    </main>
    <!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">동의 하시겠습니까?</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        모달 내용입니다.
	      </div>
	      <div class="modal-footer">
	        <button id="cancelButton" type="button" class="btn btn-secondary" data-bs-dismiss="modal" > 취소 </button>
	        <button id="confirmButton" type="button" class="btn btn-primary" data-bs-dismiss="modal"> 확인 </button>
	      </div>
	    </div>
	  </div>
	</div>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
</body>
</html>