<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>




<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/company.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

/* 모달 내용 스타일 */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 500px;
    height: 500px;
}

/* 모달 닫기 버튼 스타일 */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

/* 이미지 미리보기 스타일 */
.preview-image {
    max-width: 100%;
    max-height: 100%;
}
</style>
</head>
<body>
    <div class="create-post detail_title_box">
        <div class="detail_no">${comment.fcNo }</div>
        <div class="detail_Nick">${comment.mnNickName }</div>
        <div class="detail_date">
            <fmt:formatDate value="${comment.fcRegdate }" pattern="yyyy-MM-dd hh:mm"/>
        </div>
    </div>
    <div class="bottom_box">
        <div class="about-chnl detail_content_box">
            <div class="detail_content" id="commentContent">
                ${comment.fcContent }
            </div>
        </div>
        <div class="detail_bottom_line">
            <div class="detail_button">
                <div class="detail_left_btn">
                    <!-- 수정 버튼 -->
                    <a href="#" title="수정" class="main-btn btn_update" data-ripple="" onclick="openModal()">수정</a>
                    <a href="#" title="이전" class="main-btn btn_pre">
                        <i class="fa fa-chevron-left" aria-hidden="true"></i>
                    </a> 
                    <a href="#" title="다음" class="main-btn btn_next">
                        <i class="fa fa-chevron-right" aria-hidden="true"></i>
                    </a>
                </div>
                <div class="detail_right_btn">
                    <a href="/entertain/audition/scheduleList.do" title="목록" class="main-btn go_list" data-ripple="">목록</a>
                </div>
            </div>
        </div>
    </div>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <form id="updateForm" action="/community/feed/comment/update.do" method="post" enctype="multipart/form-data">
                <!-- 수정 가능한 내용 입력창 -->
                <textarea id="updateComment" name="updateComment" rows="10" cols="50"></textarea>
            </form>
                <button type="submit" id="updateBtn">수정</button>
        </div>
    </div>

<script>
	$(function(){
		
		var updateBtn=$("#updateBtn");
			updateBtn.on("click",function(){
				var fcNo = $(".detail_no").text();
				var fcContent = $("#updateComment").val();
				console.log("fcContent",fcContent);
				console.log("fcNo",fcNo);
				$.ajax({
					type:"POST",
					url:"/community/feed/comment/update.do",
					contentType: "application/json",
		            data: JSON.stringify({
		            	fcNo: fcNo ,
		            	fcContent: fcContent
		            }),
		            success: function(response) {
		                Swal.fire({
		                    icon: "success",
		                    title: "수정이 완료되었습니다!",
		                    showConfirmButton: false,
		                    timer: 1500
		                });
		                setTimeout(function() {
		                    window.location.href = "/community/feed/admin/comList.do";
		                }, 2000);
		            },
		            error: function(xhr, status, error) {
		                console.error(xhr.responseText);
		            }
				});
			});
	})
	


    function openModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "block";
        var content = document.getElementById("commentContent").innerText;
        document.getElementById("updateComment").value = content;
    }

    function closeModal() {
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
    }


</script>
</body>
</html>
