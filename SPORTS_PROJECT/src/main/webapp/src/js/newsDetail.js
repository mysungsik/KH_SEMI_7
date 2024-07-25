let replyData = [
	{ author: "[ 작성자 ]", comments: "야구 룰이 너무 어려움", date: "2024-07-06 22:49:31", like: 3 },
	{ author: "[ 작성자 ]", comments: "야구 룰이 너무 어려움", date: "2024-07-06 22:49:31", like: 3 },
]

$(document).ready(function() {
	
	// 페이지네이션 실행
	// paginationActive("reply", replyData, replyPaginationTemplate);
	
	// 댓글 및 좋아요 가져오는 함수 실행
	getReplies();
	getLikes();
});


// 댓글 데이터 가져오는 함수
function getReplies(){
	const request_url = `${contextPath}/api/reply/getReplyAll`;
	$.ajax({
		type: "GET",
		url: request_url,
		data : {
			typeNo : 4,
			targetNo : $("input[name='newsNum']").eq(0).val()
		},
		dataType: "json",
		success: function (res) {
			let isGetData = res.hasOwnProperty("data");

			if (isGetData){
				paginationActive("reply", res.data, replyPaginationTemplate)
				
				$(".reply-cnt").html(res.data.length)
			}
		}
	});
}

// 좋아요 데이터 가져오는 함수
function getLikes(){
	const request_url = `${contextPath}/api/like/getLikeAll`;
	$.ajax({
		type: "GET",
		url: request_url,
		data : {
			typeNo : 5,
			targetNo : $("input[name='newsNum']").eq(0).val()
		},
		dataType: "json",
		success: function (res) {
			let isGetData = res.hasOwnProperty("data");

			if (isGetData){
				$(".like-cnt").html(res.data.length)
			}
		}
	});
}


// 페이지네이션 실행 함수
function paginationActive(id, datas, template) {
	let page_size = 4;

	if ($(`#${id}-pagination`).length > 0) {

		$(`#${id}-pagination`).pagination({
			dataSource: datas,
			pageSize: page_size,
			callback: function(data, pagination) {
				var html = template(data);

				$(`#${id}-data`).html(html);	// 데이터 페이지네이션

				var currentPage = pagination.pageNumber;	// 현재 페이지 번호

				// 페이지네이션 변경
				var pagingEl = $(`.paginationjs-page[data-num='${currentPage}'] a`);
				pagingEl.css({
					fontSize: "14px",
					textDecoration: "underline",
					color: "#458BE2"
				})
			}
		})
	}
}

// 댓글 페이지네이션 템플릿 함수
function replyPaginationTemplate(data) {
	let item = "";
	
	$.each(data, function(index, d) {
		item +=
			`
				<hr class="hr__gray">
				<div class="reply">
					<input type="hidden" name="replyNo" value="${d.replyNo}">
					<input type="hidden" name="replyNo" value="${d.userNo}">
					<input type="hidden" name="replyNo" value="${d.replyTypeNo}">
					<input type="hidden" name="replyNo" value="${d.replyTargetNo}">
					<div class="reply-author-info d-flex">
						<div class="reply-author">
							<img class="author-profile" 
								src="${d.userProfileImg != '' ? d.userProfileImg : contextPath + '/public/images/profile/user_img1.jpg'}"/> 
							<p class="author-name fs-14__b ml-8">${d.userName}</p>
						</div>
					</div>
					<div class="reply-content">
						<p class="fs-12">${d.replyContent}</p>
					</div>
					<div class="reply-extra-info">
						<div>
							<span class="fs-10 fc__gray">좋아요 0:todo ♥</span>
							<span class="fs-10 fc__gray"> | </span>
							<span class="fs-10 fc__gray" onclick="updateReply()">수정</span>
							<span class="fs-10 fc__gray"> | </span>
							<span class="fs-10 fc__gray" data-type="reply-delete" onclick="showModal(this)">삭제</span>
							<span class="fs-10 fc__gray"> | </span>
							<span class="fs-10 fc__gray" data-type="reply-report" onclick="showModal(this)">신고</span>
						</div>           
						<div><span class="fs-10 fc__gray" class="fs-10">${d.replyDt}</span></div>
					</div>
				</div>
			`
	})
	return item;
}

// 모달 함수
function showModal(el){
	let modalEl = $('#communityModal');
	
	let modalType = $(el).data("type");
	
	console.log(modalType);
	
	let item = "";
	switch(modalType){
		case "board-delete" : case "board-report" : item = "게시글"; break;
		case "reply-delete" : case "reply-report" : item = "댓글"; break;
	}
	
	if(modalType == "board-delete" || modalType == "reply-delete"){
			modalEl.find(".modal-title").html(`<p class="fs-14 fc__white">${item} 삭제</p>`)
					
			modalEl.find(".modal-body").html(` 
			
				<div class="modal-row">정말 삭제하시겠습니까?</div>
				
				<div class="modal-btns">
					<button class="btn-medium__blue acceptBtn"> 확인 </button>
					<button class="btn-medium__gray cancelBtn" data-bs-dismiss="modal"> 취소 </button>
				</div>
				`
			);
	}else if(modalType == "board-report" || modalType == "reply-report"){
		modalEl.find(".modal-title").html(`<p class="fs-14 fc__white">${item} 신고</p>`)
		
		modalEl.find(".modal-body").html(` 
			<form>
				<div class="modal-row">
					<div class="select-wrapper">
						<select name="team" id="team" style="border: none; outline: none;">
					         <option value="kia">욕설 및 비하발언</option>
					         <option value="dusan">허위사실 유포</option>
					         <option value="la">사행성 ${item}</option>
					    </select>
				    </div>
				    <textarea rows="5" cols="30" placeholder="상세 내용" ></textarea>
				</div>
				<div class="modal-btns">
					<button class="btn-medium__blue acceptBtn"> 확인 </button>
					<button class="btn-medium__gray cancelBtn" data-bs-dismiss="modal"> 취소 </button>
				</div>
			</form>	
				`
		);
	}
		
	modalEl.modal('show');
}




