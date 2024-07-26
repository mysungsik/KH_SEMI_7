<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal" id="reportModal" tabindex="-1" aria-hidden="true">
    <input type="hidden" name="modalType" value=""/>
  	<div class="modal-dialog">
	    <div class="modal-content">
	      	<div class="modal-header base__blue">
		        <h1 class="modal-title"></h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
      		<div class="modal-body">
      			<form>
					<div class="modal-row">
						<div class="select-wrapper">
							<select name="reportType" id="reportType" style="border: none; outline: none;">
						    </select>
					    </div>
					    <textarea rows="5" cols="30" placeholder="신고 내용을 입력해주세요" ></textarea>
					</div>
					<div class="modal-btns">
						<button class="btn-medium__blue acceptBtn"> 확인 </button>
						<button class="btn-medium__gray cancelBtn" data-bs-dismiss="modal"> 취소 </button>
					</div>
				</form>	
      		</div>
	    </div>
  	</div>
</div>