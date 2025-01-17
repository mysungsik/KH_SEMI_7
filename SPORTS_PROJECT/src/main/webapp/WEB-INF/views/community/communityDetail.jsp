<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/WEB-INF/views/layouts/header-dependencies.jsp"/>
<link rel="stylesheet" href="${contextPath}/src/css/communityDetail.css">
<script src="${contextPath}/src/js/communityDetail.js" defer></script>
<script src="${contextPath}/src/util/pagination.js" defer></script>
<script src="https://kit.fontawesome.com/e245e5bbb1.js"
	crossorigin="anonymous"></script>


<title>COMMUNITY</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

	<input type="hidden" name="sub" value="${requestScope.sub}">
	<!-- Write Main Content -->
	<main class="container">
	<section class="board">
		<!-- 게시글 제목 -->
		<section class="title-area base__lblue">
			<div class="title"> 
				<span class="fs-12 fc__gray">[ ${board.boardCategory} ]</span>
				<span class="fs-14__b">${board.boardTitle}</span> 
			</div>
			<div class="info"> 
				<span class="fs-10">${board.boardAuthor}</span>
				<span class="fs-10"> | </span>
				<span class="fs-10">${board.boardCreateDate}</span> 
			</div>
		</section>
		<!-- 게시글 내용 -->
		<section class="content-area">
			<div class="content">
				<c:if test="${!empty image}">
					<img src="${contextPath}/public/images/community/${image}">
				</c:if>
				<pre>
${board.boardContent}
				</pre>
			</div>
		</section>
		
		<section class="info-area">
			<div class="info">
				<span>조회수 ${board.boardViews}</span>
				<span> | </span>
				<span>댓글 <span class="reply-cnt">0</span></span>
				<span> | </span>
				<span class="pointer board-like" onclick="modifyLike()">좋아요 <span class="like-cnt">0</span> ♥</span>
				<span> | </span>
				<span class="pointer" data-type="board-report" onclick="showReportModal(this)">신고</span>
			</div>
			<c:if test="${loginUserNo == board.userNo}">
				<div class="update-area">
					<span class="pointer" onclick="loginCheck(), location.href='${contextPath}/community/communityPosting/update?no=${requestScope.sub}'">수정</span>
					<span> | </span>
					<span class="delete pointer" data-type="board-delete" onclick="showModal()">삭제</span>
				</div>
			</c:if>
		</section>
		
		<section class="input-area">
			<form action="insertReply">
				<textarea rows="3" cols="100" style="resize: none" placeholder="댓글을 입력해주세요." name="reply-content"></textarea>
				<button onclick="insertReply()" type="button">댓글</button>
			</form>
		</section>
		
		<section class="reply-container">
			<div id="reply-data">
			</div>
		</section>
		
		<section class="page">
			<div id="reply-pagination"></div>
		</section>
		
	</section>
	


	</main>
	<!-- Modal -->
	<jsp:include page="/WEB-INF/views/modals/deleteModal.jsp" />
	<jsp:include page="/WEB-INF/views/modals/reportModal.jsp" />
	<jsp:include page="/WEB-INF/views/modals/replyUpdateModal.jsp" />
	<div class="modal" id="communityModal" tabindex="-1" aria-hidden="true">
		<input type="hidden" name="modalType" value=""/>
		<div class="modal-dialog">
		  <div class="modal-content">
			<div class="modal-header base__blue">
			  <h1 class="modal-title" id="commonModalLabel"></h1>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
		  </div>
		</div>
	  </div>

	<!-- Be sure to include this TAG -->
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />


</body>
</html>