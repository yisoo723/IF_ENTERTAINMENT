<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<c:set value="등록" var="name" />
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="name" />
</c:if>
<div class="gap no-gap">
	<div class="inner-bg">
		<div class="element-title">
			<h4>📢 기업공지 ${name }</h4>
		</div>
		<form method="post" action="/entertain/company/notice/insert.do"
			id="CompanyNoticeForm">
			<c:if test="${status eq 'u' }">
				<input type="hidden" name="bfNo" value="${companyNotice.bfNo }" />
			</c:if>
			<div class="add-prod-from">
				<div class="row">
					<div class="col-md-12">
						<label>제목</label> <input type="text" id="bfTitle" name="bfTitle"
							value="${companyNotice.bfTitle }" placeholder="제목을 입력해주세요">
					</div>
					<div class="col-md-12">
						<label>내용 입력</label>
						<textarea id="bfContent" name="bfContent">${companyNotice.bfContent }</textarea>
					</div>
					<div class="col-md-12">
						<div class="buttonz">
							<button type="button" id="addBtn">${name }</button>
							<c:if test="${status ne 'u' }">
								<button type="button" id="listBtn">목록</button>
							</c:if>
							<c:if test="${status eq 'u' }">
								<button type="button" id="cancelBtn">취소</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<sec:csrfInput />
		</form>
	</div>
</div>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR
				.replace(
						"bfContent",
						{
							filebrowserUploadUrl : '/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
						});

		var CompanyNoticeForm = $("#CompanyNoticeForm");
		var listBtn = $("#listBtn");
		var addBtn = $("#addBtn");
		var cancelBtn = $("#cancelBtn");
		var deleteBtn = $("#deleteBtn");

		listBtn.on("click", function() {
			
			swal(
					"등록을 취소 하시겠습니까?", 
					"작성중인 내용은 저장되지 않습니다.", 
					'등록 취소',
					'계속 작성',
					"/entertain/company/notice/list.do"
			);
			
		});

		addBtn.on("click", function() {
			var title = $("#bfTitle").val();
			// ckeditor를 이용한 데이터를 가져오는 방법
			var content = CKEDITOR.instances.bfContent.getData();

			if (title == null || title == "") {
				Swal.fire({
		            icon: 'error',
		            title: '제목을 입력해주세요!'
		        });
				$("#bfTitle").focus();
				return false;
			}

			if (content == null || content == "") {
				Swal.fire({
		            icon: 'error',
		            title: '내용을 입력해주세요!'
		        });
				$("#bfContent").focus();
				return false;
			}
			
			if ($(this).text() == "수정") {
				CompanyNoticeForm.attr("action",
						"/entertain/company/notice/update.do");
			}
			
			var actionUrl = "/entertain/company/notice/insert.do";
		    var successMessage = "게시물 등록 성공!";
		    
		    if ($(this).text() == "수정") {
		        actionUrl = "/entertain/company/notice/update.do";
		        successMessage = "게시물 수정 성공!";
		    }
		    
		    CompanyNoticeForm.attr("action", actionUrl);
		    
		    Swal.fire( 
		        successMessage, 
		        '', 
		        'success' 
		    );
			
			 setTimeout(() => {
				 CompanyNoticeForm.submit();
			    }, 2001);
		});
		

		cancelBtn.on("click", function () {
			swal(
					"수정을 취소 하시겠습니까?", 
					"기록중인 내용은 저장되지 않습니다.", 
					'수정 취소',
					'계속 작성',
					"/entertain/company/notice/list.do"
			);
		});
		
		// 삭제만 동작 X
		deleteBtn.on("click", function () {
			swal(
					"게시글을 삭제 하시겠습니까?", 
					"", 
					'삭제',
					'취소',
					"/entertain/company/notice/delete.do?bfNo=${bfNo}"
			);
		});
	});
	
	function swal(title, text, confirmMsg, cancelMsg, requestUrl){
	    // 경고창 띄우기
	    Swal.fire({
	        title: title, 
	        text: text, 
	        icon: 'warning', 
	        showCancelButton: true, // 취소 버튼 보이도록 설정
	        confirmButtonColor: '#d33', // 삭제 버튼 색상 설정
	        cancelButtonColor: '#3085d6', // 취소 버튼 색상 설정
	        confirmButtonText: confirmMsg, // 삭제 버튼 텍스트 설정
	        cancelButtonText: cancelMsg // 취소 버튼 텍스트 설정
	    }).then((result) => {
	        setTimeout(() => {
	            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
	        }, 20000); // 2000ms(2초) 후에 경고창 닫기
	        if (result.isConfirmed) { 
	        	// 삭제 버튼을 눌렀을 때
	        	location.href = requestUrl;
	        } 
	    });
	}	
</script>