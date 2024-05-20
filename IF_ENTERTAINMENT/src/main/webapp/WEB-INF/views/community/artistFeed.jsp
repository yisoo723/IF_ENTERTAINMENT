<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<meta id="_csrf" name="_csrf" content=${_csrf.token }>
<meta id="_csrf_header" name="_csrf_header" content=${_csrf.headerName }>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css1/bootstrap.min.css"> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js1/bootstrap.min.js"></script> --%>
    <title>Artist Group Information</title>
    
    <!-- CSS 스타일링 -->
     <style>
    .dropUpbtn:hover .fa-paper-plane {
        animation: fly 1s ease-in-out forwards;
    }
    
    @keyframes fly {
        0% { transform: translateY(0); }
        50% { transform: translateY(-10px); }
        100% { transform: translateY(0); }
    }
    .dropUp {
        position: relative;
        display: inline-block;
    }

    .dropUp-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
        bottom: 100%;
        padding: 10px;
        height: 500px; 
        overflow-y: auto; 
/*         transition: width 0.7s ease, height 0.7s ease; */
        transition: opacity 0.5s ease, height 0.5s ease;
    }

    .dropUp-content a {
        color: black;
        padding: 8px 16px;
        text-decoration: none;
        display: block;
        text-align: left;
    }

    .dropUp-content a:hover {
        background-color: #f1f1f1;
    }

	    .expandIcon {
	    transform: translateX(50%);
	    cursor: pointer;
	    /* 아이콘 스타일링 추가 */
	    font-size: 24px;
	}

    /* 스타일링을 위한 추가적인 CSS */
    .search-box {
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
    }

    .search-input {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }

    .alphabet-section {
        padding: 10px 0;
    }

    .alphabet {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .artist-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .artist-container {
    display: flex;
    flex-wrap: wrap; /* 넘치면 다음 줄로 내려가게 설정 */
}

.artist-item {
    flex: 0 0 calc(25% - 10px); /* 가로로 4개씩 배치하고 간격을 조절합니다. */
    margin: 5px; /* 각 아티스트 간격 조절 */
    text-align: center; /* 아티스트 아이템 가운데 정렬 */
}

.artist-item img {
    width: 100%; /* 이미지 너비 100%로 조정하여 부모 요소에 맞게 표시 */
}

 /* 흑백 필터 */
    .black-and-white {
        filter: grayscale(100%);
    }

    /* 뽀샤시 필터 */
    .brightness {
        filter: brightness(150%);
    }

    /* 흔들림 필터 */
    .shake {
        position: relative;
        animation: shake 0.5s;
    }

    /* 그림자톤 필터 */
    .invert {
        filter: invert(100%);
    }

    /* 세피아 필터 */
    .sepia {
        filter: sepia(100%);
    }

    /* 채도 조절 필터 */
    .saturate {
        filter: saturate(200%);
    }

    /* 흐릿한 효과 필터 */
    .blur {
        filter: blur(5px);
    }

.like-button {
	cursor: pointer;
}   

.swal2-container {
    z-index: 9999999999 !important;
}    
.modal-header {
      cursor: move;
  }
.post_button {
	width: 800px;
	height: 60px;
	border: 1px solid #eaeaea;
	border-radius: 50px;
	display: flex;
	justify-content: center;
	background-color: #fff;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
}
.post_button1 {
	width: 800px;
	height: 60px;
	border: 1px solid #eaeaea;
	border-radius: 50px;
	display: flex;
	justify-content: center;
	background-color: #fff;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
}
.post_button2 {
	width: 800px;
	height: 60px;
	border: 1px solid #eaeaea;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	background-color: #fff;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
}
.post_left {
    width: 85%;
    height: auto;
    display: flex;
    justify-content: left;
    align-items: center;
    padding-left: 20px;
    cursor: pointer;
    object-fit: cover;
}
.post_left img {
    width: 50px;
    height: 50px;
    margin-right: 15px;
    object-fit: cover;
}
.file_btn {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 15px;
}
.file_btn .post_image {
    cursor: pointer;
    font-size: 25px;
    justify-content: center;
    align-items: center;
    display: flex;
    margin-right: 10px;
    margin-top: 10px;
}
.file_btn .post_video {
    cursor: pointer;
    font-size: 25px;
    justify-content: center;
    align-items: center;
    display: flex;
    margin-top: 10px;
}
.file_btn .file_image .fil_video[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
}
.file_btn i {
    font-size: 25px;
}
.file_btn i:nth-child(1) {
    margin-right: 10px;
}
.file_image {
    display: none;
}
.fil_video {
    display: none;
}
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 800px;
    margin: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th,
td {
    border: 1px solid #dddddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

/* 수정 */

.feed_box {
	border-bottom: 1px solid #ede9e9;
	border-left: none;
	border-right: none;
	border-top: none;
	border-radius: 0 !important;
}

.commentBtn {
	border-top: none;
}

.profileArea {
	width: 100%;
	display: flex;
    justify-content: center;
    align-items: center;
}

.profileBox {
	width: 60px;
	height: 50px;
}

.profileBox img {
	width: 50px;
	height: 50px;
	border-radius: 50px;
	background-color: aliceblue;
	object-fit: cover;
}

.date_line {
	display: inline;
	padding: 0;
}

.profileContent {
	width: 100%;
	margin-left: 10px;
/* 	display: flex; */
}

.artistPro {
	position: relative;
	width: 100%;
	padding: 0;
}

.artistPro img {
	width: 100%;
	height: 100%;
	border-radius: 10px;
	margin-right: 0;
	object-fit: cover;
/* 	background-color: olive; */
}

.artistPro span {
	position: absolute;
	font-size: 20px;
	font-weight: bold;
	bottom: 2%;
	right: 50%;
    transform: translateX(50%);
}

.userPro {
	width: 100%;
	border-radius: 10px; 
}

.userPro:hover {
	background-color: #EDEDF0;
}

.userPro img {
	object-fit: cover;
}

.dropUp {
	position: fixed;
	left: 10%;
	top: 85%;
	z-index: 999999;
}

.recommendArea {
/* 	height: 30px; */
	background-color: transparent;
	border: none;
	padding: 0;
/* 	시연용 추가 */
	margin-top: 20px;
}

.recommendBox {
	width: 100%;
	height: 100%; 
}

.recommendBox a {
	width: 100%; 
	height: 100%; 
}


.recommendItem {
	width: 95%;
	height: 100%;
/* 	background: linear-gradient(90deg, rgb(204, 229, 255) 0%, rgb(250, 216, 246) 100%); */
/* 	margin-right: 10px; */
	padding: 0;
	display: flex;
	align-items: center;
	flex-direction: column;
    align-items: center;
}

.recommendItem img {
	border-radius: 10px;
    width: auto;
    height: 100%;
}

.recommendItem span{
	font-size: 13px;
	margin-bottom: 10px;
	text-align: left;
}

.recommendItem p {
	font-weight: bold;
	font-size: 16px;
}

.recommendItem a:last-child {
	margin: 0;
}

.recommendTitle {
	font-size: 24px;
	font-weight: bold;
	margin-left: 1%;
	margin-top: 1rem;
}

.recommendText {
	min-height: 120px;
}

.recommendPro {
/* 	min-height: 90px; */
/* 	시연용 추가 */
	min-height: 75px;
	width: 100%;
}

.recommendPrice {
	text-align: right;
	cursor: pointer;
}
.dropUpBtn {
    background: linear-gradient(121deg, #07d8e2 43.71%, #35e99d 85.64%);
    border-radius: 50%;
    box-shadow: 0 3px 20px 0 #00000014;
    padding: 15px;
    border: none;
}
.dropUpBtn:before {
    background: no-repeat url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADgAAAA4CAYAAACohjseAAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAALASURBVHgB7ZqBcZswFIYfmYANygb1CGSDbFA2qDewO0HpBM4G9QawQdoJcCZwNvgjHcqdLT2EJCQCF7477AMk8X7x9KQHEG1sbGxsbHxdMttJALn4yym1EVl2oTkRwiqxNVgHV7GdxLZzEZZjPcI4DmMCn7F+7kRmt24p/k6M7ldKzzeKy6MY1+3dEZiu2YmtoIUjbCyVrbfUXEGdglaCEnl3c/QCuVbgSiuCsR8f5x7kj/DXN61OvqY7KCi0/TejBDMGX9BP9IuHsf3MFarMYbh8kQN2V0OFmzWJlMMIZgQ92yrkTAVJQwlRhja+HQpzYSKXbYXLxTpG5Ikiozr0N3Oto0NdzjX35EJqkUrYQfU4Rx1gX+drRBKRI8IkLUbcDPyauQgxJppI9C7VWYTJc6VDO09M3SOFMlUk+mVUYxEm76bT2AEfBP1cc6Bhb5GOwo7wmILAB6SCYuAqUpUbyyu9hN20a7RDMbGJxHhklPwN7XHmuh1SLEAsIm3IyFhSIKrjdEpKhYfIScJurqUTfdExdOFuQJg8XlEEwLtmQXOgROpjrkaksSHa2TOdV9GcwJwKKorAQOeld03GEL2Xa4oA+oj7Oa6pGVJqhrzQROCTxKYGzAMfTBiD4INXS5+JMOCiGVRSIAhJYi08UBxabX/8RQiDcsMf2uE/s7990mECzTmgjelJbCqEITvdrcgTxEpiUwFzzio86paMuCMtCQRO+EiVxCpiBRnJf23fNdD8JPPR+yMtDZjPSkafpYLPFKKshKLDGDsaaDBXEhsLmBP+zlL2wNy9J1oyMEP9fqDcbElszCAj+aftfx8op4/Pi9h+0dKBOZ8Z60gsIYmdAswJv0Of/pQD427+JHYK6J95utJhXa/Ke+D+tdSyo+YQ6JdftUXYdS5xGSVEuZ+cKj7mQ/n1Qyu2Z+bLjo0Q3gFpT1sAexcBCAAAAABJRU5ErkJggg==) 0 0 / contain;
    content: "";
    display: block;
    height: 28px;
    width: 28px;
}
.memberUser {
	background: linear-gradient(90deg, rgb(218, 208, 255) 0%, rgb(193, 154, 255) 100%);
	color: #fff;
	border: none;
}

.memberUser img {
    width: 120px;
    height: 30px;
    padding-left: 2%;
}

.user figure img {
	border: none !important;
	width: 55px !important;
	height: 55px !important;
	object-fit: cover;
}

.modalPostArea {
	position: relative;
    top: 50%;
    transform: translateY(-50%) !important;
}

.modalPostIcon {
	font-size: 25px !important;
}

.fa-image {
	margin-right: 10px !important;
}

.modalFeedWUser {
/* 	border-bottom: 1px solid #ede9e9; */
	border-top: none;
}

.modalFeedUser {
	width: 100%;
	height: 55px;;
	margin-bottom: 3%; 
}

.modalFeedBody {
	width: 100%;
	height: 100%;
}

.modalFeedIcon {
	width: 100%;
    position: absolute;
    bottom: 20px;
/*     시연용 */
/*     bottom: -17%; */
/*     bottom: 1%; */
/*     left: 3%; */
    height: 55px;
}

.feedCommentArea li {
	border-bottom: 1px solid #ede9e9;
}

.feedCommentArea li:last-child {
	border: none;
}

.feedCommentContent {
	border: none;
}

.modalArtistCommentArea {
	position: relative;
	top: 100px;
}

/* 피드 모달 시작 */

.modalFullArea {
    position: relative;
    top: 47%;
    transform: translateY(-50%) !important;
/* 	시연용 */
	max-height: 70%;
/*     max-height: 90%; */
    width: 100%;
    height: 100%;
/*     overflow: hidden; */
}

.modalFullBox {
/* 	수정 */
/* 	position: absolute; */
	width: 60%; 
/* 	margin-right: 3%;  */
	padding-right: 3%; 
/* 	border-right: 1px solid #ede9e9; */
/* 	overflow-y: auto;  */
}

.modalFullBox::after {
    content: "";
    position: absolute;
    top: 4%;
    left: 60%;
    transform: translateX(-60%);
    bottom: 0;
    width: 1px;
/*     시연용 */
	height: 870px;
/*     height: 800px; */
    background-color: #ede9e9; 
}

.modalFullBoxContent {
	width: 100%;
	height: 100%;
    max-height: 100%;
    overflow-y: auto;
}

.modalFullBody {
	width: 100%;
    overflow-y: auto;
/*     시연용 */
    max-height: 760px;
    min-height: 82%;
/*     max-height: 680px; */
/*     min-height: 82%; */
}

.modalFeedBox {
	width: 400px;
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    top: 40%;
    padding: 20px;
    border-radius: 10px;
/* 	border: 1px solid #9551fc; */
}

.modalFeedBtn {
	position: absolute;
	right: 20px;
	top: 20px;
	font-size: 35px;
}

.modalFeedsubmit {
	position: absolute;
	right: 20px;
	bottom: 20px;
	background-color: #9551fc;
	border: none;
	color: #fff;
	border-radius: 10px;
	font-weight: normal;
	width: 50px;
	height: 40px;
	padding: 12px 0;
}

.modalFeedsubmit:hover {
	font-weight: bold;
}

.modalFeedReason {
	margin-bottom: 45px;
}

.modalFeedContentBox {
	padding: 0;
}

.modalFeedContent {
	margin-bottom: 45px;
}

.modalFeedTextarea {
	margin-bottom: 25px;
}

.modalFeedWrite {
	position: absolute;
	right: 0px;
	bottom: 0px;
	width: 100px;
}

.modalCommentReportBtn {
	width: 100px;
}

.modalFeedEdit {
	position: absolute;
	right: 0px;
	bottom: 0px;
	width: 100px;
}

/* 피드 모달 끝 */


/* 피드 모달 댓글 시작 */

.modalFeedCommentArea {
	margin-bottom: 20px;
}

.modalFeedCommentTop {
	border: none;
}

.modalFeedCommentProfile {
    max-width: 100%;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

.modalFeedCommentProfile img {
	width: 35px;
	height: 35px;
}

.modalFeedCommentCon {
	margin-top: 10px;
	margin-bottom: 10px;
}

.modalFeedCommentBtns {
	display: flex;
	justify-content: flex-start;
	align-items: center;
    border-bottom: 1px solid #ede9e9;
    padding-bottom: 10px;
}

.modalFeedCommentLike {
	margin-right: 12px;
	display: flex;
	align-items: center;
}

.modalFeedCommentLikeBtn {
	margin-right: 5px;
/* 	시연용 추가 */
	font-size: 16px;
}

.modalFeedCommentDate {
	margin-bottom: 10px;
}

.feedPostForm {
	margin: 20px 0;
}

.feedPostForm label {
	margin-bottom: 20px;
}

.mediaContainer img {
    max-height: 450px;
    max-width: 300px;
    object-fit: cover;
    margin-bottom: 20px;
}

.myfeedBox li:nth-child(1) .myfeedProfile {
	margin-top: 0 !important;
	margin-bottom: 15px;
}

.myfeedBox li:last-child(1) .myfeedProfile {
	margin-bottom: 0 !important;
}

.moreContentIcon {
	display: flex;
	justify-content: flex-start;
	align-items: center;
}

.moreContentIcon svg {
	margin-left: 0;
}

.moreContentIcon span {
	margin-top: 5px;
}

.moreContentIcon:hover svg {
	color: #9551fc;
	transform: scale(1.1);
	transition: all 0.2s linear 0s;
}

/* 추천아티스트 */
.dropArea {
	transition: opacity 0.5s ease 0s;
    opacity: 1;
    width: 400px;
    height: 400px;
    background-color: #fff; 
    border-radius: 10px
}

.dropTitle {
	font-weight: bold;
    font-size: 23px;
    margin: 5% 2%;
    transition: font-size 0.5s ease;
}

.fa-up-right-and-down-left-from-center:before, .fa-down-left-and-up-right-to-center:before {
    font-size: 30px;
    float: right;
}

.dropSearchBox {
	margin-bottom: 5%;
	padding: 12px;
	transition: font-size 0.5s ease;
}

.filterSelectBox {
	width: 100% !important;
}

.dropSection {
	margin-top: 5%;
    padding: 0 2%;
}

.dropGroupArea {
	margin-bottom: 7%;
}

.dropGroupName {
	font-size: 25px;
	font-weight: bold;
	transition: font-size 0.5s ease;
}

.dropGroupContainer a {
	color: black;
    padding: 1.5%;
    text-decoration: none;
    text-align: center;
}

.dropGroupBox {
	width: 100%;
	height: 100%;
}

.dropGroupBox img {
	margin-bottom: 10%;
	border-radius: 10px;
	transition: font-size 0.5s ease;
}

.dropGroupBox span {
	font-size: 18px;
	transition: font-size 0.5s ease;
}

.dropUpExpand .dropTitle {
	font-size: 35px;
	margin: 3% 3%;
/* 	여기부터 2024-05-10 */
}

.dropUpExpand .dropSearchBox {
	height: 70px;
	font-size: 20px;
	margin-bottom: 4%;
}

.dropUpExpand .dropGroupName {
	font-size: 30px;
}

.dropUpExpand .dropGroupBox span {
	font-size: 25px;
}

.dropUpExpand .fa-down-left-and-up-right-to-center:before {
	font-size: 45px;
}

/* 시연용 추가  css*/
.commentScroll {
	overflow: visible !important;
}

.modalnick {
	margin-right: 6px;
}

/* 피드 모달 댓글 끝 */


.VIpgJd-ZVi9od-ORHb {
    display: none;
} 
.goog-te-gadget {
/* 텍스트 숨기기 */
color: transparent !important;
}
.VIpgJd-ZVi9od-l4eHX-hSRGPd {
    display: none;
}
.goog-te-combo {
/*     background: red; */
    border: none;
}


</style>

</head>

<body>
<c:if test="${param.userType ne '3'}">
		<%@ include file="/include/artistInclude.jsp" %>
</c:if>
<c:if test="${param.userType eq '3'}">
		<%@ include file="/include/artistMember.jsp" %>
</c:if>            
<div class="modal" id="myModal" data-ban="${ban }" data-loginuser="${loginUser }" data-userno="${UserInfo.userNo}" data-usertype="${UserInfo.userType}"data-agId="${UserInfo.agId}">
    <div class="modal-dialog modalPostArea">
        <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h4 class="modal-title">포스트 추가</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 모달 바디 -->
            <div class="modal-body" style=" z-index: 100;">
                <!-- 포스트 내용 입력 폼 -->
                <div>
				    <textarea id="postContent" rows="4" cols="50" max="1000" onkeyup="updateCharCount()"></textarea>
				    <div id="charCount">0/1000</div>
				</div>
<!-- 				<div id="previewContainer" style=""> -->
				<div id="previewContainer" style="margin-bottom: 20px;">
				
				</div>
				<div class="selectFilter" hidden="">
				<select id="selectFilterBox" onchange="applyFilter()">
				    <option value="option1">필터 선택</option>
				    <option value="option2">흑백</option>
				    <option value="option3">뽀샤시</option>
				    <option value="option4">흔들림효과</option>
				    <option value="option5">반전효과</option>
				    <option value="option6">세피아 효과</option>
					<option value="option7">채도 조절</option>
					<option value="option8">투명도 조절</option>
					<option value="option9">흐릿한 효과</option>
				</select>
				</div>
                <div class="file_btn">
                    <label for="imageInput" class="post_image modalPostIcon" style="position: absolute; top: 30px; left: 1px;">
                        <i class="far fa-image" style="color: #585888 !important;"></i>
                        <i class="fa fa-video-camera" style="color: #585888 !important;"></i>
                    </label>
                    <input type="file" class="file_image" id="imageInput" name="">
                </div>
                
                <!-- 멤버십 전용 포스트 체크박스 -->
               <c:if test="${UserInfo.userType == 3}">
				    <div class="form-check">
				        <input class="form-check-input" type="checkbox" id="membershipPost">
				        <label class="form-check-label" for="membershipPost">멤버십 전용 포스트</label>
				    </div>
				</c:if>

            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <!-- 포스트 버튼 -->
                <button type="button" id="postBtn" class="btn btn-primary">포스트</button>
                <!-- 모달 닫기 버튼 -->
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
	<div class="post_button2" style="margin-bottom: 50px; width: 350px; height: 500px; margin-right:45px; position: absolute;right: 0px;top: 220px; background: linear-gradient(90deg, rgb(204, 229, 255) 0%, rgb(250, 216, 246) 100%);border: none; margin-top: 6%;"data-agId="${UserInfo.agId}" onclick="goArtist()">
        <div class="post_left artistPro">
            <img src="${pageContext.request.contextPath }/resources/artImg/${UserInfo.agProfile}" alt="">
       		 <span>${UserInfo.agId }</span>

        </div>
    </div>

	<div class="post_button1 " style="margin-bottom: 50px;width: 350px;height: 200px; margin-right:45px; position: absolute;right: 0px;top: 745px; border-radius:10px; margin-top: 75px; background-color: #F7F7FA" data-user="${UserInfo}" data-userno="${UserInfo.userNo}" data-agId="${UserInfo.agId}"  onclick="goMyFeed()">
        <div class="post_left userPro myFeed">
            <img src="${pageContext.request.contextPath }${UserInfo.userProfile}" alt="" style="border-radius: 10px; position: relative;width: 70px;height: 70px; margin-right: 15px; left: 120px;bottom: 30px; ">
            <span style="LEFT: 50%;TOP: 120PX; transform: translateX(-50%); FONT-WEIGHT: BOLD;POSITION: ABSOLUTE;FONT-SIZE: 20PX;">${UserInfo.mnNickName }
            <c:if test="${UserInfo.userType == 3}">
			    <img src="${pageContext.request.contextPath}/resources/images/mark.png" alt="" style="width: 12px; height: 12px; margin: 0; position: relative; bottom: 1px;">
			</c:if>
            </span>

        </div>
    </div>
    

	<c:if test="${param.userType ne '3'}">
		<%@ include file="/include/postIncludeFan.jsp" %>
	</c:if>  

	<c:if test="${param.userType eq '3' and UserInfo.userType eq '3'}">
	    <%@ include file="/include/postIncludeArtist.jsp" %>
	</c:if> 
    


<!-- <div class="loadMore"> -->
<%--     <c:forEach items="${feedList}" var="feed"  varStatus="loop"> --%>
<!--         <div class="central-meta item" style="width: 800px;border-radius: 15px; display: flex;" > -->
<!--             <div class="user-post"> -->
<!--                 <div class="friend-info"> -->
<!--                     <figure> -->
<%--                         <img src="${pageContext.request.contextPath}${feed.userProfile}" alt=""> --%>
<!--                     </figure> -->
<!--                     <ins> -->
<%--                         <a href="time-line.html" title="" >${feed.mnNickName}</a> --%>
<!--                     </ins>  -->
<!--                     <div class="friend-name"> -->
<!--                         <div class="more"> -->
<!--                             <div class="more-post-optns"> -->
<!--                                 <i class="ti-more-alt"></i> -->
<!--                                 <ul> -->
<%--                                 	<li onclick="openEditModal(${feed.feedNo}, '${feed.feedContent}', '${feed.faMime}', '${feed.faSavedname}', ${feed.feedMembership},'${UserInfo.agId }')"><i class="fa-sharp fa-regular fa-edit"></i> 수정하기</li> --%>
<%--                                 	<li onclick="deleteFeed(${feed.feedNo}, ${UserInfo.userNo}, ${feed.userNo})"><i class="fa-sharp fa-regular fa-trash"></i> 삭제하기</li> --%>
<%--                                 	<li onclick="openReportModal(${feed.feedNo}, ${UserInfo.userNo}, ${feed.userNo})"><i class="fa-sharp fa-regular fa-bell"></i> 신고하기</li> --%>

<!--                                 </ul> -->
<!--                             </div> -->
<!--                         </div> -->
<%--                         <span><i class="fa fa-globe"></i> <fmt:formatDate value="${feed.feedRegdate}" pattern="yyyy-MM-dd hh:mm"/></span> --%>
<!--                     </div> -->
<!--                     <div class="post-meta"> -->
<!--                         <figure> -->
<!--                             <div class="img-bunch"> -->
<!--                                 <div class="row"> -->
<!--                                     <div class="col-lg-12" style="height: 700px;"> -->
<!--                                         <figure> -->
<!--                                                 <div id="editableContent" style="    height: 100px;border-radius: 10px;background-image: linear-gradient(90deg, rgb(204, 229, 255) 0%, rgb(250, 216, 246) 100%);"> -->
<!-- 		                                                    <a href="#" title="" onclick="detail()" data-toggle="modal" data-target="#img-comt" style="position: absolute; top: 10px;left: 10px"> -->
<%-- 															    ${feed.feedContent} --%>
<!-- 															</a> -->
<!--                                                 </div> -->
<%--                                             <div id="mediaContainer_${feed.feedNo}" class="about-chnl detail_content_box feeds" data-idx="${feed.feedNo}"> --%>
<!--                                             </div> -->
<!--                                         </figure> -->
<!-- <!--                                         <script type="text/javascript"> --> 
<%-- //                                             var mediaContainer_${feed.feedNo} = document.getElementById("mediaContainer_${feed.feedNo}"); --%>
<%-- //                                             var faMime_${feed.feedNo} = "${feed.faMime}"; --%>
<%-- //                                             if (faMime_${feed.feedNo}.includes("image")) { --%>
<!-- //                                                 // 이미지 파일인 경우 -->
<%-- //                                                 var image_${feed.feedNo} = document.createElement("img"); --%>
<%-- //                                                 image_${feed.feedNo}.src = "${pageContext.request.contextPath}/resources/feed/${feed.faSavedname}"; --%>
<%-- //                                                 image_${feed.feedNo}.alt = "이미지"; --%>
<%-- //                                                 image_${feed.feedNo}.style.height = "550px";  --%>
<%-- //                                                 image_${feed.feedNo}.style.width = "100%";  --%>
<%-- //                                                 image_${feed.feedNo}.style.marginBottom = "25px";  --%>
<%-- //                                                 image_${feed.feedNo}.style.marginTop = "20px"; --%>
<%-- //                                                 image_${feed.feedNo}.style.borderRadius = "10px"; --%>
<%-- //                                                 mediaContainer_${feed.feedNo}.insertBefore(image_${feed.feedNo}, mediaContainer_${feed.feedNo}.firstChild); --%>
<%-- //                                             } else if (faMime_${feed.feedNo}.includes("video")) { --%>
<!-- //                                                 // 비디오 파일인 경우 -->
<%-- //                                                 var video_${feed.feedNo} = document.createElement("video"); --%>
<%-- //                                                 video_${feed.feedNo}.controls = true; // 비디오 컨트롤러 표시 --%>
<%-- //                                                 video_${feed.feedNo}.style.height = "600px"; // 비디오의 높이 조절 --%>
<%-- //                                                 video_${feed.feedNo}.style.width = "755px"; // 비디오의 높이 조절 --%>
<%-- //                                                 var source_${feed.feedNo} = document.createElement("source"); --%>
<%-- //                                                 source_${feed.feedNo}.src = "${pageContext.request.contextPath}/resources/feed/${feed.faSavedname}"; --%>
<%-- //                                                 source_${feed.feedNo}.type = faMime_${feed.feedNo}; // 비디오 파일의 MIME 타입 설정 --%>
<%-- //                                                 video_${feed.feedNo}.appendChild(source_${feed.feedNo}); --%>
<%-- //                                                 mediaContainer_${feed.feedNo}.insertBefore(video_${feed.feedNo}, mediaContainer_${feed.feedNo}.firstChild); --%>
<!-- //                                             } else { -->
<!-- //                                                 // 이미지나 비디오가 아닌 경우 -->
<!-- //                                                 console.error("지원되지 않는 파일 형식입니다."); -->
<!-- //                                             } -->
<!-- <!--                                         </script> --> 
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </figure> -->
<!--                         <div class="we-video-info"> -->
<!--                             <ul> -->
<!--                                 <li> -->
<!--                                     <div class="likes heart" title="Like/Dislike"> -->
<!--                                         ❤ <span>좋아요 수증가</span> -->
<!--                                     </div> -->
<!--                                 </li> -->
<%--                                 <li><span class="comment" title="Comments" > <i class="fa fa-commenting"></i> <ins>${commentMap[feed.feedNo].size()}</ins></span></li> --%>
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="coment-area"> -->
<!--                         <ul class="we-comet"> -->
<%--                             <c:forEach items="${commentMap[feed.feedNo]}" var="comment"> --%>
<!--                                 <li> -->
<!--                                     <div class="comet-avatar"> -->
<%--                                         <img src="${pageContext.request.contextPath}${comment.userProfile}" alt=""> --%>
<!--                                     </div> -->
<!--                                     <div class="we-comment"> -->
<!--                                         <h5> -->
<%--                                             <a href="time-line.html" title="">${comment.mnNickName}</a> --%>
<!--                                         </h5> -->
                                        
<%--                                         <p >${comment.fcContent}</p> --%>
<!--                                         <div class="inline-itms"> -->
<%--                                             <span> <fmt:formatDate value="${comment.fcRegdate}" pattern="yyyy-MM-dd hh:mm"/></span><a href="#" title=""><i class="fa fa-heart"></i><span> --%>
<!-- <!--                                             		내 댓글 좋아요 갯수 --> 
<!--                                           	</span></a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </li> -->
<%--                             </c:forEach> --%>
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<%--     </c:forEach> --%>
<!-- </div> -->
<div class="loadMore">
    <c:forEach items="${feedList}" var="feed"  varStatus="loop">


        <div class="central-meta item feed_box" style="width: 800px; display: flex;" > 
            <div class="user-post">
                <div class="friend-info">

                    <c:choose>
                        <c:when test="${feed.feedMembership == 1 && !member &&UserInfo.userType == 2}">
                    <div class="profileArea">
                        <div class="profileBox">
                            <img src="${pageContext.request.contextPath}${feed.userProfile}" alt="">
                        </div>
                        <div class="profileContent">
                        	<div>
                               <a href="/community/feed/myFeed.do?userNo=${feed.userNo}&agId=${feed.agId}"
                                   title="">${feed.mnNickName}</a>
                                   <c:if test="${feed.userType == 3}">
                                       	<img src="${pageContext.request.contextPath}/resources/images/mark.png"
                                           alt="" style="width: 12px; height: 12px; position: relative; bottom: 1px;">
                                   </c:if>
						    
							</div>
						</div>
						</div>
						    <div class="alert alert-info memberUser" role="alert" style="margin-top: 30px;/* max-height: 100px; */height: 100px;">
							    <a href="/goods/shopDetail.do?goodsNo=${goodsList1[0].goodsNo}" id="membershipLink" target="_blank">
							    	<img src="${pageContext.request.contextPath}/resources/images/membershiponly.png" alt="" style="margin: 25px 0;">
							    </a>
						    </div>
						</c:when>
                        <c:otherwise>
                            <div class="profileArea">
                                    <div class="profileBox">
                                        <img src="${pageContext.request.contextPath}${feed.userProfile}" alt="">
                                    </div>
                                    <div class="profileContent">
                                        <div>
                                            <a href="/community/feed/myFeed.do?userNo=${feed.userNo}&agId=${feed.agId}"
                                                title="">${feed.mnNickName}</a>
                                            <c:forEach items="${memberShipYn}" var="feed1">
                                                <c:if test="${feed1.cjNo eq feed.cjNo && feed.userType == 2}">
                                                    <img src="${pageContext.request.contextPath}/resources/images/membershipicon.png"
                                                        alt="" style="width: 12px; height: 12px; position: relative; bottom: 1px;">
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${feed.userType == 3}">
                                                <img src="${pageContext.request.contextPath}/resources/images/mark.png"
                                                    alt="" style="width: 12px; height: 12px; position: relative; bottom: 1px;">
                                            </c:if>
                                            
                                        </div>
                                        <div class="friend-name date_line">
                                        	 <!-- 번역부분 -->
                                        	 <div>
<!-- 							 					<div id="google_translate_element" class="hd_lang"></div> -->
	                                            <div class="more">
	                                                <div class="more-post-optns">
	                                                    <i class="ti-more-alt"></i>
	                                                    <ul>
	                                                        <li onclick="openEditModal(${feed.feedNo}, '${feed.feedContent}', '${feed.faMime}', '${feed.faSavedname}', ${feed.feedMembership},'${UserInfo.agId}', '${feed.faFilter}')"
	                                                            class="edit-feed" data-feed-no="${feed.feedNo}"
	                                                            data-feed-content="${feed.feedContent}"
	                                                            data-feed-mime="${feed.faMime}"
	                                                            data-feed-savedname="${feed.faSavedname}"
	                                                            data-feed-membership="${feed.feedMembership}"
	                                                            style="${UserInfo.userNo eq feed.userNo ? '' : 'display:none;'}">
	                                                            <div class="moreContentIcon">
		                                                            <i class="fas fa-edit"></i> 
		                                                            <span>수정하기</span>	
	                                                            </div>
	                                                        </li>
	                                                        <li onclick="deleteFeed(${feed.feedNo}, ${UserInfo.userNo}, ${feed.userNo})"
	                                                            class="delete-feed" data-feed-no="${feed.feedNo}"
	                                                            data-user-no="${UserInfo.userNo}"
	                                                            data-feed-owner="${feed.userNo}"
	                                                            style="${UserInfo.userNo eq feed.userNo ? '' : 'display:none;'}">
	                                                            <div class="moreContentIcon">
		                                                            <i class="fa-sharp fa-regular fa-trash"></i> 
		                                                            <span>삭제하기</span>	
	                                                            </div>
	                                                        </li>
	                                                        <li onclick="openReportModal(${feed.feedNo}, ${UserInfo.userNo}, ${feed.userNo})"
	                                                            style="${UserInfo.userNo eq feed.userNo ? 'display:none;' : ''}">
	                                                            <div class="moreContentIcon">
		                                                            <i class="fa-sharp fa-regular fa-bell" "></i> 
		                                                            <span>신고하기</span>	
	                                                            </div>
	                                                        </li>
	                                                </ul>
	                                            </div>
	                                        </div>
	                                       </div>
                                        <span><i class="fa-solid fa-globe"></i>
                                                            <fmt:formatDate value="${feed.feedRegdate}"
                                                                pattern="yyyy-MM-dd hh:mm" /></span>
                                                </div>
                                            </div>
                                        </div>

                            <div class="post-meta">
                                <figure>
                                    <div class="img-bunch">
                                        <div class="row">
                                            <div id="realfeedList"class="col-lg-12">
                                                <figure>

                                                    <div class="editableContent feeds" data-idx="${feed.feedNo}" id="editableContent" style="cursor: pointer; height: auto;">
													   <p style="font-size: 20px;font-weight: 300; font-size: 15px; padding: 2%; line-break: anywhere; white-space: pre-line; word-break: break-all; "> ${feed.feedContent}</p>

													</div>

                                                    <div id="mediaContainer_${feed.feedNo}" class="about-chnl detail_content_box feeds" data-idx="${feed.feedNo}" style="cursor: pointer;">
                                                    </div>
                                                </figure>
                                                <script type="text/javascript">
                                                    var mediaContainer_${feed.feedNo} = document.getElementById("mediaContainer_${feed.feedNo}");
                                                    var faMime_${feed.feedNo} = "${feed.faMime}";
                                                    var feedFilter = "${feed.faFilter}";
                                                    console.log("feedFilter 값:", feedFilter);
                                                    console.log("faMime_${feed.feedNo} 값:", faMime_${feed.feedNo});
                                                    
                                                    if (faMime_${feed.feedNo}) {
                                                    	
                                                    if (faMime_${feed.feedNo}.includes("image")) {
                                                        // 이미지 파일인 경우
                                                        var image_${feed.feedNo} = document.createElement("img");
                                                        image_${feed.feedNo}.src = "${pageContext.request.contextPath}/resources/feed/${feed.faSavedname}";
                                                        image_${feed.feedNo}.alt = "이미지";
                                                        image_${feed.feedNo}.style.objectFit = "contain"; 
                                                        image_${feed.feedNo}.style.objectPosition = "left"; 
                                                        image_${feed.feedNo}.style.height = "550px"; 
                                                        image_${feed.feedNo}.style.width = "100%"; 
                                                        image_${feed.feedNo}.style.marginBottom = "25px"; 
//                                                         image_${feed.feedNo}.style.marginTop = "20px";
                                                        image_${feed.feedNo}.style.borderRadius = "10px";
                                                        if ("${feed.faFilter}" === "black-and-white") {
                                                            image_${feed.feedNo}.style.filter = "grayscale(100%)";
                                                        } else if ("${feed.faFilter}" === "brightness") { 
                                                            image_${feed.feedNo}.style.filter = "brightness(150%)"; 
                                                        } else if ("${feed.faFilter}" === "shake") { 
                                                            image_${feed.feedNo}.style.position = "relative"; 
                                                            image_${feed.feedNo}.style.animation = "shake 0.5s"; 
                                                        } else if ("${feed.faFilter}" === "invert") { 
                                                            image_${feed.feedNo}.style.filter = "invert(100%)";
                                                        } else if ("${feed.faFilter}" === "sepia") { 
                                                            image_${feed.feedNo}.style.filter = "sepia(100%)"; 
                                                        } else if ("${feed.faFilter}" === "saturate") { 
                                                            image_${feed.feedNo}.style.filter = "saturate(200%)"; 
                                                        } else if ("${feed.faFilter}" === "opacity") { 
                                                            image_${feed.feedNo}.style.opacity = "0.5"; 
                                                        } else if ("${feed.faFilter}" === "blur") { 
                                                            image_${feed.feedNo}.style.filter = "blur(5px)"; 
                                                        }

                                                        mediaContainer_${feed.feedNo}.insertBefore(image_${feed.feedNo}, mediaContainer_${feed.feedNo}.firstChild);
                                                    } else if (faMime_${feed.feedNo}.includes("video")) {
                                                        // 비디오 파일인 경우
                                                        var video_${feed.feedNo} = document.createElement("video");
                                                        video_${feed.feedNo}.controls = true; // 비디오 컨트롤러 표시
                                                        video_${feed.feedNo}.style.height = "600px"; // 비디오의 높이 조절
                                                        video_${feed.feedNo}.style.width = "755px"; // 비디오의 높이 조절
                                                        var source_${feed.feedNo} = document.createElement("source");
                                                        source_${feed.feedNo}.src = "${pageContext.request.contextPath}/resources/feed/${feed.faSavedname}";
                                                        source_${feed.feedNo}.type = faMime_${feed.feedNo}; // 비디오 파일의 MIME 타입 설정
                                                        video_${feed.feedNo}.appendChild(source_${feed.feedNo});
                                                        if ("${feed.faFilter}" === "black-and-white") {
                                                        	video_${feed.feedNo}.style.filter = "grayscale(100%)";
                                                        } else if ("${feed.faFilter}" === "brightness") { 
                                                        	video_${feed.feedNo}.style.filter = "brightness(150%)"; 
                                                        } else if ("${feed.faFilter}" === "shake") { 
                                                        	video_${feed.feedNo}.style.position = "relative"; 
                                                        	video_${feed.feedNo}.style.animation = "shake 0.5s"; 
                                                        } else if ("${feed.faFilter}" === "invert") { 
                                                        	video_${feed.feedNo}.style.filter = "invert(100%)";
                                                        }else if ("${feed.faFilter}" === "sepia") { 
                                                        	video_${feed.feedNo}.style.filter = "sepia(100%)"; 
                                                        } else if ("${feed.faFilter}" === "saturate") { 
                                                        	video_${feed.feedNo}.style.filter = "saturate(200%)"; 
                                                        } else if ("${feed.faFilter}" === "opacity") { 
                                                        	video_${feed.feedNo}.style.opacity = "0.5"; 
                                                        } else if ("${feed.faFilter}" === "blur") { 
                                                        	video_${feed.feedNo}.style.filter = "blur(5px)"; 
                                                        }

                                                        mediaContainer_${feed.feedNo}.insertBefore(video_${feed.feedNo}, mediaContainer_${feed.feedNo}.firstChild);
                                                    } else {
                                                        // 이미지나 비디오가 아닌 경우
                                                        console.error("지원되지 않는 파일 형식입니다.");
                                                    }
                                                    }else {
                                                        console.log("파일이 존재하지않습니다.");
                                         			} 
                                                    
                                                    var editableContent = document.getElementById('editableContent');
                                                    if (!editableContent.textContent.trim()) {
                                                        editableContent.style.display = 'none';
                                                    }
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                </figure>
                                <div class="we-video-info commentBtn">
                                    <ul>
                                         <li style="position: relative; top: 2px;">
                                            <div id="likeFeed" class="like-button" title="Like/Dislike"
                                                data-feedno="${feed.feedNo}"
                                                data-userno="${UserInfo.userNo}"
                                                style="cursor: pointer; display: flex; align-items: center; justify-content: center;">
                                                <span class="heartBtn"
                                                    style=" font-size: 30px; margin-right: 5px;">❤</span>
                                                <span class="like-count" style=" font-size: 15px; padding-bottom: 10px; ">0</span>
                                            </div>
                                        </li>
                                        <li>
                                            <span class="comment" title="Comments">
                                                <i class="fa-solid fa-comment" style="font-size: 25px;"></i>
                                                <ins
                                                    style=" font-size: 15px; margin-left: 11px; margin-top: 1px; ">${commentMap[feed.feedNo].size()}</ins>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="coment-area">
                                <ul class="we-comet feedCommentArea">
                                    <c:forEach items="${commentMap[feed.feedNo]}" var="comment">
                                        <li>
                                            <div class="comet-avatar">
                                                <img src="${pageContext.request.contextPath}${comment.userProfile}" alt="" style="width: 35px; height: 35px; object-fit: cover;">
                                            </div>
                                            <div class="we-comment feedCommentContent">
                                                <h5 style="display: block; margin-top: 5px;">
                                                    <a href="/community/feed/myFeed.do?userNo=${comment.userNo}&agId=${UserInfo.agId}" title="">${comment.mnNickName}</a>
													 <c:forEach items="${memberShipYn}" var="feed1">
                                                	 <c:if test="${feed1.cjNo eq comment.cjNo && comment.userType == 2}">
												    	<img src="${pageContext.request.contextPath}/resources/images/membershipicon.png" alt="" style="width: 12px; height: 12px; position: relative; bottom: 2px;">
													</c:if>
													</c:forEach>
	                                
					                                <c:if test="${comment.userType == 3}">
													    <img src="${pageContext.request.contextPath}/resources/images/mark.png" alt="" style="width: 12px; height: 12px; position: relative; bottom: 1px;">
													</c:if>
                                                </h5>
                                                
                                                <p style="display: inline-block; margin: 10px 0;">${comment.fcContent}</p>
                                                <div class="inline-itms">
                                                    <span> <fmt:formatDate value="${comment.fcRegdate}" pattern="yyyy-MM-dd hh:mm"/></span><a href="#" title=""><span>
<!--                                             		내 댓글 좋아요 갯수 -->
                                                </span></a>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


<button type="button" id="modalBtn" style="display:none;" data-toggle="modal" data-target="#img-comt"></button>


	<!-- 모달 시작 -->
<div class="modal fade" id="img-comt">
    <div class="modal-dialog modalFullArea">
        <div class="modal-content" style="height: 100%; border-radius: 10px;">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" style="font-size: 35px;">×</button>
                
            </div>
            
			
			
            <!-- Modal body -->
            <div class="modal-body" style="width: 100%; height: 100%; padding: 3% !important; position: relative;">
                <div class="row" style="margin: 0 !important;">
	                	<div class="modalFullBox">
		                    <div class="user modalFeedUser">
			                    <figure id="modalProfile" style="width: 55px; height: 55px;">
			                        <img class="modalprofileBox" src="${pageContext.request.contextPath}${userProfile}" alt="">
			                    </figure>
			                    <div class="user-information">
			                        <h4>
			                            <a href="" title="" id="modalnick" class="modalnick">${mnNickName}</a>
				
			                       		<a id="modalmemberShip"></a>
			                        </h4>
			                        <span id="modalFeedRegdate"><fmt:formatDate value="${feedRegdate}" pattern="yyyy-MM-dd hh:mm"/></span>
			                	</div>
		                    </div>
		                    <div class="modalFullBody" style="overflow-y: auto;">
		                    	<div style="width: 100%; height: 100%;">
				               		<div class="modalFeedBody">
				                        <div id="modalMedia">
				   
				                        </div>
				                        
				                        <div id="modalContent" style="width:550px; height: auto; padding: 2%; line-height: 1.6;">
				                            ${feedContent}
				                       	</div>
				                      </div>
		                       </div>
	                       </div>
	                       
	                       <div class="modalFeedIcon">
		           		   		<div class="we-video-info modalFeedWUser">
				               		<ul>
				                   		<li>
											<div id="likeFeed" class="like-button1" title="Like/Dislike" data-feedno="" data-userno="${UserInfo.userNo}" style="cursor: pointer; font-size: 22px;">
												❤ <span class="like-count1" style="position: absolute; bottom: 0px; margin-left: 5px; margin-bottom: 3px;">0</span>
											</div>
										</li>
				
				                        <li>
				                           <span title="Comments" class="comment" id="modalCommentBtn" data-userno="${UserInfo.userNo}" data-feedno="" >
				               					<i class="fa-solid fa-comment" style="font-size: 20px;"></i>
				              			</span>
				          				</li>
				      				</ul>
							  	</div>
							</div>
	                    </div>
<!-- 	                    	시연용 -->
		                    <div class="modalFullComment" style="width: 37%; position: absolute; right: 2.5%; height: 94%; overflow: hidden;">
<!-- 		                    <div class="modalFullComment" style="width: 37%;"> -->
		                       	 
<!-- 	                    	시연용 -->
		                        <div style="display: block; height: 94%; overflow: auto;" class="coment-area">
<!-- 		                        <div style="display: block;" class="coment-area"> -->
		                            <ul id="ulCommentArea" style="list-style: none; padding: 0 10%;">
<!-- 	                    	시연용 -->
<!-- 		                            <ul class="we-comet" id="ulCommentArea"> -->
		                            </ul>
		                        </div>
			                    
							</div>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- 유저 신고 모달 -->
<div id="commentReportModal" class="modal modalFeedArea">
    <div class="modal-content modalFeedBox">
        <button type="button" class="close modalFeedBtn" onclick="closeCommentReportModal()">&times;</button>
        <h5>유저 신고하기</h5>
        <form id="commentReportForm">
            <input type="hidden" id="commentReportFeedNo" name="reportFeedNo">
            <input type="hidden" id="commentReportUserNo" name="reportUserNo">
            <div class="form-group">
                <label for="commentReportReason">신고 사유:</label>
                <select id="commentReportReason" class="form-control">
                    <option value="1">부적절한 닉네임</option>
                    <option value="2">선정/폭력성</option>
                    <option value="3">스팸/광고/도배글</option>
                    <option value="4">기타</option>
                </select>
            </div>
            <div class="form-group modalFeedReason">
                <label for="commentReportCustomReason">상세내용(선택):</label>
                <input type="text" id="commentReportCustomReason" class="form-control" placeholder="기타 신고 사유를 입력하세요">
            </div>
            <input type="button" id="commentReportBtn" class="modalFeedsubmit modalCommentReportBtn" value="유저 신고">
         <sec:csrfInput/>
        </form>
    </div>
</div>



<!-- 피드 신고 모달 -->
<div id="reportModal" class="modal modalFeedArea">
    <div class="modal-content modalFeedBox">
        <button type="button" class="close modalFeedBtn" data-dismiss="modal">&times;</button>
        <h5>신고하기</h5>
        <form id="reportForm">
        	<input type="hidden" id="reportFeedNo" name="refortFeedNo">
        	<input type="hidden" id="reportUserNo" name="refortUserNo">
            <div class="form-group">
                <label for="reason">신고 사유:</label>
                <select id="reason" class="form-control">
                    <option value="1">이용 가이드 위반</option>
                    <option value="2">선정/폭력성</option>
                    <option value="3">스팸/광고/도배글</option>
                </select>
            </div>
            <div class="form-group modalFeedReason">
                <label for="customReason">상세내용(선택):</label>
                <input type="text" id="customReason1" class="form-control" placeholder="기타 신고 사유를 입력하세요">
            </div>
            <input type="button" id="reportBtn" class="modalFeedsubmit" value="신고">
            <sec:csrfInput/>
        </form>
    </div>
</div>



<!-- 댓글수정 -->
<div id="editCommentModal" class="modal modalFeedArea">
    <!-- 모달 내용 -->
    <div class="modal-content modalFeedBox">
        <!-- 모달 헤더 -->
        <div class="modal-header">
            <h5>댓글 수정</h5>
            <!-- 모달 닫기 버튼 -->
            <button type="button" class="close modalFeedBtn" data-dismiss="modal">&times;</button>
        </div>
        <!-- 모달 바디 -->
        <div class="modal-body">
            <!-- 댓글 작성 폼 -->
            <form id="editCommentForm">
                <input type="hidden" name="commentNo" id="commentNo">
                <div class="form-group">
                    <label for="editCommentContent">댓글 내용:</label>
                    <textarea class="form-control" id="editCommentContent" rows="3"></textarea>
                </div>
                <sec:csrfInput/>
            </form>
            <input type="button" id ="editCommentButton" class="modalFeedsubmit modalFeedEdit" value="댓글 수정">
        </div>
    </div>
</div>

<!-- 댓글 작성 -->
<div id="commentModal" class="modal modalFeedArea">
    <!-- 모달 내용 -->
    <div class="modal-content modalFeedBox">
        <!-- 모달 헤더 -->
        <div class="modal-header">
            <h5>댓글 작성</h5>
            <!-- 모달 닫기 버튼 -->
            <button type="button" class="close modalFeedBtn" data-dismiss="modal">&times;</button>
        </div>
        <!-- 모달 바디 -->
        <div class="modal-body modalFeedContentBox">
            <!-- 댓글 작성 폼 -->
            <form id="commentForm">
            	<input type="hidden" name="feedNo" id="feedRealNo">
                <div class="form-group modalFeedContent">
                    <label for="commentContent">댓글 내용:</label>
                    <textarea class="form-control modalFeedTextarea" id="commentContent" rows="3"></textarea>
                </div>
                <!-- 댓글 작성 버튼 -->
                <sec:csrfInput/>
            </form>
            	<input type="button" id ="commentButton" class="modalFeedsubmit modalFeedWrite" value="댓글쓰기">
        </div>
    </div>
</div>

<!-- 수정 -->
<div id="postModal" class="modal fade modalFeedArea" role="dialog" data-userno="${UserInfo.userNo}" data-agId="${UserInfo.agId}">
    <div class="modal-dialog">
        <!-- 모달 내용 -->
        <div class="modal-content modalFeedBox">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title">피드 수정</h5>
                <button type="button" class="close modalFeedBtn" data-dismiss="modal">&times;</button>
            </div>
            <input type="hidden" id="feedUpdateNo" name="feedUpdateNo">
            <input type="hidden" id="feedAgId" name="feedAgId">
            <!-- 모달 바디 -->
            <div class="modal-body modalFeedContentBox">
                <!-- 포스트 내용 입력 폼 -->
                <div class="form-group feedPostForm modalFeedContent">
                    <label for="postContent">내용</label>
                    <textarea class="form-control modalFeedTextarea" id="postContent1" name="postContent" rows="3" cols="50"></textarea>
                </div>
                
                <!-- 파일 업로드 -->
                <div id="mediaContainer" class="mediaContainer"></div>
                <div class="selectFilter1">
                <select id="selectFilterBox1">
				    <option value="option1">필터 선택</option>
				    <option value="option2">흑백</option>
				    <option value="option3">뽀샤시</option>
				    <option value="option4">흔들림효과</option>
				    <option value="option5">반전효과</option>
				    <option value="option6">세피아 효과</option>
					<option value="option7">채도 조절</option>
					<option value="option8">투명도 조절</option>
					<option value="option9">흐릿한 효과</option>
				</select>	
                </div>
                <div class="form-group" style="margin: 20px 0;">
                    <label for="imageInput">이미지 또는 비디오 업로드</label>
                    <input type="file" class="form-control-file" id="imageInput1">
                </div>
                
                <!-- 멤버십 전용 포스트 체크박스 -->
                <c:if test="${UserInfo.userType == 3}">
				    <div class="form-check">
				        <input class="form-check-input" type="checkbox" id="membershipPost">
				        <label class="form-check-label" for="membershipPost">멤버십 전용 포스트</label>
				    </div>
				</c:if>
                
                <!-- 미디어 컨테이너 -->
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <!-- 포스트 버튼 -->
                <button type="button" id="feedUpdateBtn" class="btn btn-primary">포스트</button>
                <!-- 모달 닫기 버튼 -->
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<div class="dropUp">
<!--    <button class="dropUpbtn" style="background-color: transparent;border-radius: 50px; width: 50px; height: 50px;font-size: 20px;margin-top: 2px;"> -->
<!--         <i class="fa-solid fa-paper-plane"></i> -->
<!--     </button>  -->
    <div class="FloatingDirectMessageLayout_dm_icon__ghCFa" data-is-icon-mode="true">
  		<button type="button" class="dm_icon DirectMessageIconModeView_dm_icon__JLWcg dropUpBtn" data-animate="false"></button>
    </div>
    <div class="dropUp-content dropArea">
        <div class="search-box">
            <div class="alphabet dropTitle">추천아티스트<i class="expandIcon fa-solid fa-up-right-and-down-left-from-center"></i></div>
            <input type="text" class="search-input searchBox dropSearchBox" placeholder="아티스트 검색...">
        </div>
        <div class="alphabet-section dropSection">
            <ul class="artist-list">
                <c:forEach items="${getArtist}" var="artistGroup">
                    <li class="group-item dropGroupArea">
                        <div class="group-name dropGroupName">${artistGroup.agId}</div>
                        <div class="artist-container dropGroupContainer">
                            <c:set var="getartistList" value="${artistGroup.artistList}" />
                            <c:forEach items="${getartistList}" var="getartist">
                                <a href="/community/artist?agId=${artistGroup.agId}" title="Artist" class="artist-item">
                                	<div class="dropGroupBox">
	                                    <img src="${pageContext.request.contextPath}${getartist.userProfile}" alt="">
	                                    <span>${getartist.artistFakename}</span>
                                	</div>
                                    
                                </a>
                            </c:forEach>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>        





<!--     <div class="container"> -->
<!--         <h2>Artist Group Information</h2> -->
<!--         <table> -->
<!--             <tr> -->
<!--                 <th>Artist Group ID</th> -->
<!--                 <th>Artist Group Name</th> -->
<!--                 <th>Artist Group Introduction</th> -->
<!--                 <th>Artist ID</th> -->
<!--                 <th>Artist Name</th> -->
<!--                 <th>Artist Introduction</th> -->
<!--             </tr> -->
<%-- 			<c:forEach items="${artistGroup}" var="group"> --%>
<!-- 			    <tr> -->
<%-- 			        <td>${group.agId}</td> --%>
<%-- 			        <td>${group.agName}</td> --%>
<%-- 			        <td>${group.agIntro}</td> --%>
<!-- 			    </tr> -->
<%-- 			    <c:forEach items="${group.artistList}" var="artist"> --%>
<!-- 			        <tr> -->
<%-- 			            <td>${artist.agId}</td> --%>
<%-- 			            <td>${artist.userNo}</td> --%>
<%-- 			            <td>${artist.artistBirth}</td> --%>
<%-- 			            <td>${artist.artistFakename}</td> --%>
<%-- 			            <td>${artist.artistIntro}</td> --%>
<!-- 			        </tr> -->
<%-- 			    </c:forEach> --%>
<%-- 			</c:forEach> --%>


<!--         </table> -->
<!--     </div> -->


<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">

//번역부분
function hideGoogleTranslateToolbar() {
    var googleTranslateElement = document.querySelector('.goog-te-banner-frame.skiptranslate');
    if (googleTranslateElement) {
        googleTranslateElement.style.display = 'none';
    }
}
function googleTranslateElementInit() {
new google.translate.TranslateElement({
    pageLanguage: 'ko',
    includedLanguages: 'en,ja,ko,zh-CN,zh-TW',
    //layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
    autoDisplay: false
}, 'google_translate_element');
}


var header = "";
var token = ""; 
header = $("meta[name='_csrf_header']").attr("content");
token = $("meta[name='_csrf']").attr("content");

document.addEventListener('DOMContentLoaded', function() {
    var dropUpBtn = document.querySelector('.dropUpBtn');
    var dropUpContent = document.querySelector('.dropUp-content');
//     var dropUpContent2 = $('.dropUp-content');
    var expandIcon = document.querySelector('.expandIcon');
    var artistItems = document.querySelectorAll('.artist-item');
    var searchInput = document.querySelector('.search-input');
    var allSection = document.querySelector('.alphabet-section');
    var originalWidth = dropUpContent.style.width;
    var originalHeight = dropUpContent.style.height;

    dropUpBtn.addEventListener('click', function(event) {
        // 현재 요소의 표시 여부 확인
//         var isDisplayed = window.getComputedStyle(dropUpContent).display === 'block';
        var isDisplayed = window.getComputedStyle(dropUpContent).opacity === '1';

        // 요소의 transition 속성 설정
        dropUpContent.style.transition = 'opacity 0.5s ease';

        if (!isDisplayed) {
//             dropUpContent.style.opacity = '1';
//             dropUpContent.style.display = 'block';
            
           dropUpContent.style.display = 'block';

            // 요소를 서서히 나타나도록 설정
            setTimeout(function() {
                dropUpContent.style.opacity = '1';
            }, 10); // 약간의 지연을 줘서 효과를 부드럽게 만듦

		
        } else { 
//            	dropUpContent.style.opacity = '0';
//             dropUpContent.style.display = 'none';
            
         	dropUpContent.style.opacity = '0';

            // 요소를 숨깁니다.
            setTimeout(function() {
                dropUpContent.style.display = 'none';
            }, 500); // 0.5초 후에 투명도를 0으로 설정하여 사라지게 함
        }

        // 이벤트 전파 방지
        event.stopPropagation();
    });

    var isExpanded = false;

    expandIcon.addEventListener('click', function(event) {
        if (!isExpanded) {
            dropUpContent.style.transition = 'width 0.7s ease, height 0.7s ease';
            dropUpContent.style.display = 'block';
            dropUpContent.style.width = '800px';
            setTimeout(function() {
                dropUpContent.style.height = '900px';
            }, 100);
            dropUpContent.classList.add('dropUpExpand');
            expandIcon.classList.remove('fa-up-right-and-down-left-from-center'); // 기존 아이콘 클래스 제거
            expandIcon.classList.add('fa-down-left-and-up-right-to-center'); // 확장된 상태 아이콘 클래스 추가
            isExpanded = true;
        } else {
            dropUpContent.style.transition = 'width 0.7s ease, height 0.7s ease';
            dropUpContent.style.height = originalHeight;
            setTimeout(function() {
                dropUpContent.style.width = originalWidth;
            }, 300);
            dropUpContent.classList.remove('dropUpExpand');
            expandIcon.classList.remove('fa-down-left-and-up-right-to-center'); // 기존 아이콘 클래스 제거
            expandIcon.classList.add('fa-up-right-and-down-left-from-center'); // 축소된 상태 아이콘 클래스 추가
            isExpanded = false;
        }
    });

//     artistItems.forEach(function(item) {
//         item.addEventListener('click', function(event) {
//             dropUpContent.style.display = 'none';
//             event.stopPropagation();
//         });
//     });

searchInput.addEventListener('input', function() {
	var input = document.querySelector(".search-input.searchBox").value.toUpperCase();
    var artistGroups = document.querySelectorAll(".group-item");
    
    artistGroups.forEach(group => {
        // 아티스트 그룹 ID 검색
        var groupId = group.querySelector(".group-name").textContent.toUpperCase();
        var isGroupVisible = groupId.indexOf(input) > -1;
        
        // 아티스트 가명 검색
        var artistItems = group.querySelectorAll(".artist-item");
        var isArtistVisible = Array.from(artistItems).some(item => {
            let artistName = item.textContent.toUpperCase();
            return artistName.indexOf(input) > -1;
        });
        
        // 조건에 따라 그룹과 아티스트 표시
        if (isGroupVisible || isArtistVisible) {
            group.style.display = "";
            artistItems.forEach(item => {
                let artistName = item.textContent.toUpperCase();
                if (artistName.indexOf(input) > -1 || isGroupVisible) {
                    item.style.display = "";
                } else {
                    item.style.display = "none";
                }
            });
        } else {
            group.style.display = "none";
        }
    });
});

    // 모든 아티스트 섹션 보기
    allSection.addEventListener('click', function() {
        artistItems.forEach(function(item) {
            item.style.display = 'block';
        });
    });
});

$('.loadMore .item').each(function(index) {
    if ((index + 1) % 3 === 0) { 
        var agId = document.querySelector('.post_button1').getAttribute('data-agid');

        $.ajax({
            type: 'GET',
            url: '/community/feed/getProdList.do',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { agId: agId },
            success: function(response) {
                console.log("response", response);

                var productList = response.filter(function(product) {
                    return product.goodsThumbnail !== null;
                });

                productList.sort(function() {
                    return 0.5 - Math.random();
                });

                productList = productList.slice(0, 3);
                
                // 상품 슬라이드를 담을 부모 요소 추가
                var productSlideContainer = $('<div class="product-slide-container"></div>');

                    var productSlideHtml = '<div class="sliderz-slick">';
                    productSlideHtml += '<div class="row">';
                    productSlideHtml += '<div class="col-md-12">';
                    productSlideHtml += '<div class="central-meta recommendArea">';
                    productSlideHtml += '<p class="recommendTitle">' +  "추천상품" + '</p>';
                    productSlideHtml += '<div class="slick-multiple recommendBox" style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">';
                	productList.forEach(function(product) {
                    // 각각의 상품 슬라이드 요소 생성 및 추가
					var formattedPrice = product.goodsPrice.toLocaleString('ko-KR') + '원';
                    productSlideHtml += '<a href="/goods/shopDetail.do?goodsNo=' + product.goodsNo + '" title="' + product.goodsName + '" target="_blank">';
                    productSlideHtml += '<div class="slick-slide-item recommendItem">';
                    productSlideHtml += '<img src="' + product.goodsThumbnail + '" class="img-fluid" alt="" style="">';
                    productSlideHtml += '<div style="width:100%">';
//                     시연용
//                     productSlideHtml += '<div>';

					var slicedName = "";
					if(product.goodsName.length > 30) {
						slicedName = (product.goodsName.substr(0, 30)) +'...'
					} else {
						slicedName = product.goodsName;
					}
                    
                    productSlideHtml += '<div class="recommendText">';
                    productSlideHtml += '<div class="recommendPro">';
                    productSlideHtml += '<span>' + slicedName + '</span>';
                    productSlideHtml += '</div>';
                    productSlideHtml += '<p id="myFeedView" class="recommendPrice">' + formattedPrice + '</p>';
                    productSlideHtml += '</div>';
                    
                    productSlideHtml += '</div>';
                    productSlideHtml += '</div>';
                    productSlideHtml += '</a>';


                });
                    productSlideHtml += '</div>';
                    productSlideHtml += '</div>';
                    productSlideHtml += '</div>';
                    productSlideHtml += '</div>';
                    productSlideHtml += '</div>';
                    productSlideContainer.append(productSlideHtml);

                $(this).append(productSlideContainer); 
            }.bind(this),
            error: function(xhr, status, error) {
                console.error('상품 리스트를 가져오는데 실패했습니다.');
            }
        });
    }
});


function redirectToMyFeed(userNo, agId) {
    var url = '/community/feed/myFeed.do?userNo=' + userNo + '&agId=' + agId;
    window.location.href = url;
}

function updateCharCount() {
    var max = 1000; 
    var now = $('#postContent').val().length; 
    var charCountElement = $('#charCount');

    charCountElement.text(now + '/' + max);

    if (now > max) {
        charCountElement.css('color', 'red');
        $('#postBtn').prop('disabled', true);
//         alert("허용 글자수를 초과하셨습니다");
        Swal.fire({
            icon: "error",
            title: "허용 글자수를 초과하셨습니다",
            showConfirmButton: false,
            timer: 1500
        })
    } else {
        charCountElement.css('color', ''); 
        $('#postBtn').prop('disabled', false);
        $('#charLimitAlert').hide();
    }
}






//댓글 좋아요 처리
function updateLikeCounts() {
    $('.like-button2').each(function() {
        var $button = $(this);
        var fcNo = $button.data('fcno');
        $.ajax({
            type: 'GET',
            url: '/community/comment/like/count',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { fcNo: fcNo },
            success: function(response) {
                $button.find('.like-count').text(response);
                $('#likeFeed').find('.like-count').text(response);
            },
            error: function(xhr, status, error) {
                console.error('AJAX request failed:', error);
            }
        });
    });
}

$(document).on('click', '.like-button2', function() {
	
	var $button = $(this);
    var fcNo = $button.data('fcno'); 
    var userNo = $('#myModal').data('loginuser');
    
	
		    console.log("fcNofcNofcNofcNo", fcNo);
		    console.log("userNouserNo", userNo);
	  
	    $.ajax({
	        type: 'POST',
	        url: '/community/comment/like',
	        beforeSend: function(xhr){	
				xhr.setRequestHeader(header, token);
			},
	        data: { fcNo: fcNo, userNo: userNo },
	        success: function(response) {
	            if (response === 'already_liked') {
	                var likeCount = parseInt($button.find('.like-count').text());
	                $button.find('.like-count').text(likeCount - 1);
	                $button.removeClass('liked');
	            } else if (response === 'success') {
	                var likeCount = parseInt($button.find('.like-count').text());
	                $button.find('.like-count').text(likeCount + 1);
	                $button.addClass('liked');
	            } else {
	                alert('좋아요 처리에 실패했습니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	        },
	        complete: function() {
	            $button.prop('disabled', false);
	        }
	    });
	});


//좋아요기능
$(document).ready(function() {
// 	// 피드 수정 에디터 Ckeditor 적용
// 	CKEDITOR.replace("postContent1");
	
    $('.like-button').each(function() {
        var $button = $(this);
        var feedNo = $button.data('feedno');
        var userNo = $('#myModal').data('loginuser');
        console.log("feedNo",feedNo);
        console.log("userNo",userNo);

        $.ajax({
            type: 'GET',
            url: '/community/feed/like/count',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { feedNo: feedNo },
            success: function(response) {
                $button.find('.like-count').text(response);
            },
            error: function(xhr, status, error) {
            }
        });
    });

    $('.like-button').click(function() {
        var $button = $(this);
        var feedNo = $button.data('feedno');
        var userNo = $('#myModal').data('loginuser');

        if ($button.prop('disabled')) {
            return;
        }
        $button.prop('disabled', true);

        $.ajax({
            type: 'POST',
            url: '/community/feed/like',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { feedNo: feedNo, userNo: userNo },
            success: function(response) {
                if (response === 'already_liked') {
                    var likeCount = parseInt($button.find('.like-count').text());
                    $button.find('.like-count').text(likeCount - 1);
                    $button.removeClass('liked');
                } else if (response === 'success') {
                    // 좋아요 추가 성공
                    var likeCount = parseInt($button.find('.like-count').text());
                    $button.find('.like-count').text(likeCount + 1);
                    $button.addClass('liked');
                } else {
                    // 실패 시
                    alert('좋아요 처리에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                // 에러 발생 시
                alert('AJAX request failed: ' + error);
            },
            complete: function() {
                // 요청 완료 시 버튼 활성화
                $button.prop('disabled', false);
            }
        });
    });
});
function likeFeedNo(feedNo) {
	$('.like-button1').attr("data-feedno", feedNo);
   
	$('.like-button1').each(function() {
        var $button = $(this);
        var feedNo = $button.data('feedno');
        var userNo = $('#myModal').data('loginuser');
        console.log("feedNo",feedNo);
        console.log("userNo",userNo);

        // 좋아요 수 가져오기
        $.ajax({
            type: 'GET',
            url: '/community/feed/like/count',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { feedNo: feedNo },
            success: function(response) {
                // 좋아요 수를 버튼에 반영
                $button.find('.like-count1').text(response);
            },
            error: function(xhr, status, error) {
                console.error('AJAX request failed:', error);
            }
        });
    });

    $('.like-button1').click(function() {
        var $button = $(this);
        var feedNo = $button.data('feedno');
        var userNo = $('#myModal').data('loginuser');

        if ($button.prop('disabled')) {
            return;
        }
        $button.prop('disabled', true);

        $.ajax({
            type: 'POST',
            url: '/community/feed/like',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { feedNo: feedNo, userNo: userNo },
            success: function(response) {
                if (response === 'already_liked') {
                    var likeCount = parseInt($button.find('.like-count').text());
                    $button.find('.like-count').text(likeCount - 1);
                    $button.removeClass('liked');
                    var likeCount1 = parseInt($button.find('.like-count1').text());
                    $button.find('.like-count1').text(likeCount1 - 1);
                    $button.removeClass('liked');
                    
                } else if (response === 'success') {
                	var likeCount = parseInt($button.find('.like-count').text());
                    $button.find('.like-count').text(likeCount - 1);
                    $button.removeClass('liked');
                    var likeCount1 = parseInt($button.find('.like-count1').text());
                    $button.find('.like-count1').text(likeCount1 + 1);
                    $button.addClass('liked');
                } else {
                    alert('좋아요 처리에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                alert('AJAX request failed: ' + error);
            },
            complete: function() {
                $button.prop('disabled', false);
            }
        });
    });
    
    $('#img-comt').on('hidden.bs.modal', function() {
        $('.like-button').each(function() {
            var $button = $(this);
            var feedNo = $button.data('feedno');
            var userNo = $('#myModal').data('loginuser');

            $.ajax({
                type: 'GET',
                beforeSend: function(xhr){	
        			xhr.setRequestHeader(header, token);
        		},
                url: '/community/feed/like/count',
                data: { feedNo: feedNo },
                success: function(response) {
                    $button.find('.like-count').text(response);
                },
                error: function(xhr, status, error) {
                    console.error('AJAX request failed:', error);
                }
            });
        });
    });
};    





//마이피드
function goMyFeed() {
    var userNo = document.querySelector('.post_button1').getAttribute('data-userno');
    var agId = document.querySelector('.post_button1').getAttribute('data-agid');
    var user = document.querySelector('.post_button1').getAttribute('data-user');
    
    window.location.href = '/community/feed/myFeed.do?userNo=' + userNo + '&agId=' + agId;
}
function goArtist() {
    
    var agId = document.querySelector('.post_button2').getAttribute('data-agid');
   
    
    window.location.href = '/entertain/artist/profile/list.do?agId='+ agId;
}



//유저 신고 모달 열기
function reportComment(feedNo, reporterUserNo) {
    $('#commentReportModal').modal('show');
    $('#commentReportFeedNo').val(feedNo);
    $('#commentReportUserNo').val(reporterUserNo);
    
    $('#commentReportBtn').on('click', function() {
        var feedNo = $('#commentReportFeedNo').val();
        var userNo = $('#commentReportUserNo').val();
		var reportType = $('#commentReportReason').val();
		var reportReason=$("#commentReportCustomReason").val();
		console.log("feedNo",feedNo);
		console.log("userNo",userNo);
		console.log("reportType",reportType);
		console.log("reportReason",reportReason);

		$.ajax({
			type : "POST",
			url : "/community/feed/userReport.do",
			beforeSend: function(xhr){	
				xhr.setRequestHeader(header, token);
			},
			data : JSON.stringify({
				
				feedNo : feedNo,
				userNo : userNo,
				reportType : reportType,
				reportReason : reportReason
				
			}),
			 contentType: "application/json; charset=utf-8",
	         success: function(response) {
	             	 $('#commentReportModal').hide();
	            	 Swal.fire({
	                     icon: "success",
	                     title: "신고가 완료되었습니다.",
	                     showConfirmButton: false,
	                     timer: 1500
	                 });
	            },
	            error: function(xhr, status, error) {
	            	
	            }
			
			
			
		});
    });
}

// 유저 신고 모달 닫기
function closeCommentReportModal() {
    $('#commentReportModal').modal('hide');
}










//피드신고 
function openReportModal() {
    var modal = document.getElementById("reportModal");
    modal.style.display = "block";
}

function closeReportModal() {
    var modal = document.getElementById("reportModal");
    modal.style.display = "none";
}

function openReportModal(feedNo, reporterUserNo, reportedUserNo) {
   	console.log("feedNo",feedNo);
   	console.log("userNo",reporterUserNo);
	$('#reportModal').modal('show');
	var reportBtn=$("#reportBtn");
   
	
	$("#reportFeedNo").val(feedNo);
	$("#reportUserNo").val(reporterUserNo);
	
    
	
	reportBtn.on("click", function(){
		
		var feedNO =$('#reportFeedNo').val();
		var userNo=$('#reportUserNo').val();
		var reportType = $('#reason').val();
		var reportReason=$("#customReason1").val();
		console.log("feedNo",feedNo);
		console.log("userNo",userNo);
		console.log("reportReason",reportReason);
		
		$.ajax({
			type : "POST",
			url : "/community/feed/feedReport.do",
			beforeSend: function(xhr){	
				xhr.setRequestHeader(header, token);
			},
			data : JSON.stringify({
				
				feedNo : feedNo,
				userNo : userNo,
				reportType : reportType,
				reportReason : reportReason
				
			}),
			 contentType: "application/json; charset=utf-8",
	         success: function(response) {
	             	 $('#reportModal').hide();
	            	 Swal.fire({
	                     icon: "success",
	                     title: "신고가 완료되었습니다.",
	                     showConfirmButton: false,
	                     timer: 1500
	                 });
	            },
	            error: function(xhr, status, error) {
	            	
	            }
			
			
			
		});
		
					
		
		
	});
	

}




//댓글 수정
$('#editCommentModal').on('click', function() {
     $('#editCommentModal').show();
     
 });
    
$('#editCommentModal .close').on('click', function() {
    $('#editCommentModal').hide();
});
    
// function openEditCommentModal(fcNo, commentContent) {
//     $('#editCommentModal').modal('show');
    
//     $('#editCommentContent').val(commentContent);
    
//     $('#editCommentButton').click(function() {
//         var updatedContent = $('#editCommentContent').val();
// 		console.log("fcNo",fcNo);
//         $.ajax({
//             url: '/community/feed/comment/updateComment.do',
//             type: 'POST',
//             beforeSend: function(xhr){	
//     			xhr.setRequestHeader(header, token);
//     		},
//             data:JSON.stringify({fcNo: fcNo, fcContent: updatedContent }),
//             contentType: "application/json; charset=utf-8",
//             success: function(response) {
//              	 $('#editCommentModal').hide();
//             	 Swal.fire({
//                      icon: "success",
//                      title: "수정이 완료되었습니다.",
//                      showConfirmButton: false,
//                      timer: 1500
//                  }).then(() => {
//                      location.reload(); 
//                  });
//             },
//             error: function(xhr, status, error) {
            	
//             }
//         });
//     });
// }
function openEditCommentModal(fcNo, commentContent) {
    $('#editCommentModal').modal('show'); 
    $('#editCommentContent').val(commentContent); 
    
  
    $('#editCommentButton').off('click').on('click', function() {
        var updatedContent = $('#editCommentContent').val();
        $.ajax({
            url: '/community/feed/comment/updateComment.do',  
            type: 'POST',
            beforeSend: function(xhr){ 
                xhr.setRequestHeader(header, token);
            },
            data: JSON.stringify({fcNo: fcNo, fcContent: updatedContent}),  
            contentType: "application/json; charset=utf-8",
            success: function(response) {
                $('#editCommentModal').modal('hide');  
//                 Swal.fire({
//                     icon: "success",
//                     title: "수정이 완료되었습니다.",
//                     showConfirmButton: false,
//                     timer: 1500
//                 }).then(() => {
//                 });
                updateComments(response);
            },
            error: function(xhr, status, error) {
                // 에러 처리
                alert("댓글 수정에 실패하였습니다.");
            }
        });
    });
}

// 파일 선택 시 미리보기 
function previewImage() {
	
    console.log("파일 선택 시 미리보기 함수 호출됨");
    var preview = document.getElementById('previewContainer');
    var fileInput = document.getElementById('imageInput');
    var file = fileInput.files[0];
    var reader = new FileReader();
    console.log("preview",preview);
    console.log("fileInput",fileInput);
    console.log("file",file);
    console.log("reader",reader);

    reader.onloadend = function () {
        console.log("이미지 미리보기 업데이트");
        if (file.type.startsWith('image')) {
            // 이미지인 경우
            preview.innerHTML = '<img src="' + reader.result + '" alt="Preview Image">';
        } else if (file.type.startsWith('video')) {
            // 동영상인 경우
            preview.innerHTML = '<video width="100%" controls><source src="' + reader.result + '" type="' + file.type + '"></video>';
        }
    }

    if (file) {
        reader.readAsDataURL(file);
    } else {
        console.log("파일 없음");
        preview.innerHTML = '';
    }
}

document.getElementById('imageInput').addEventListener('change', function() {
    document.querySelector('.selectFilter').removeAttribute('hidden');
    previewImage();
});

document.getElementById('selectFilterBox').addEventListener('change', applyFilter);

function applyFilter() {
    console.log("필터 선택 시 applyFilter 함수 호출됨");
    var selectedFilter = document.getElementById('selectFilterBox').value;
    var previewImage = document.querySelector('#previewContainer');

    previewImage.classList.remove('black-and-white', 'brightness', 'shake', 'invert', 'sepia', 'saturate', 'opacity', 'blur');

    if (selectedFilter === 'option2') {
        console.log("흑백 필터 적용");
        previewImage.classList.add('black-and-white');
    } else if (selectedFilter === 'option3') {
        console.log("뽀샤시 필터 적용");
        previewImage.classList.add('brightness');
    } else if (selectedFilter === 'option4') {
        console.log("흔들림 필터 적용");
        previewImage.classList.add('shake');
    } else if (selectedFilter === 'option5') {
        console.log("그림자톤 필터 적용");
        previewImage.classList.add('invert');
    } else if (selectedFilter === 'option6') {
        console.log("세피아 필터 적용");
        previewImage.classList.add('sepia');
    } else if (selectedFilter === 'option7') {
        console.log("채도 조절 필터 적용");
        previewImage.classList.add('saturate');
    } else if (selectedFilter === 'option8') {
        console.log("투명도 조절 필터 적용");
        previewImage.style.opacity = '0.5';
    } else if (selectedFilter === 'option9') {
        console.log("흐릿한 효과 필터 적용");
        previewImage.classList.add('blur');
    }
}

function openEditModal(feedNo, feedContent, mime, savedName, membership, agId, faFilter) {
    console.log("feedNo", feedNo);
    console.log("feedContent", feedContent);
    console.log("membership", membership);
    console.log("agId", agId);
    console.log("savedName", savedName);
    console.log("fafilter수정", faFilter);
    
    $('#postModal').modal('show');
  
    $('#feedUpdateNo').val(feedNo);
    $('#feedAgId').val(agId);
    
    var postContent = $('#postContent1');
    postContent.val(feedContent); 
    
    
    
    var feedMembership = $('#membershipPost1');
    feedMembership.prop('checked', membership == 1);
    
    var mediaContainer = $('#mediaContainer');
    mediaContainer.empty(); 
    
    var mediaElement;
    if (mime.includes('image')) {
        mediaElement = $('<img>');
        mediaElement.attr('src', '${pageContext.request.contextPath}/resources/feed/' + savedName);
        mediaElement.attr('alt', '미디어');
//         mediaElement.css('max-height', '450px');
//         mediaElement.css('max-width', '300px');
//         mediaElement.css('object-fit', 'cover');
        
        
//         	시연용
		    mediaElement.css("width", "100%");
//          시연용 수정
		    mediaElement.css("max-height", "700px");
//	       	 시연용 추가
    		mediaElement.css("object-fit", "contain");
    		mediaElement.css("object-position", "left");
        
        if (faFilter === "black-and-white") {
        	mediaElement.css("filter", "grayscale(100%)");
			} else if (faFilter === "brightness") { 
				mediaElement.css("filter", "brightness(150%)"); 
			} else if (faFilter === "shake") { 
				mediaElement.css("position", "relative"); 
				mediaElement.css("animation", "shake 0.5s"); 
			} else if (faFilter === "invert") { 
				mediaElement.css("filter", "invert(100%)");
			} else if (faFilter === "sepia") { 
				mediaElement.css("filter", "sepia(100%)"); 
			} else if (faFilter === "saturate") { 
				mediaElement.css("filter", "saturate(200%)"); 
			} else if (faFilter === "opacity") { 
				mediaElement.css("opacity", "0.5"); 
			} else if (faFilter === "blur") { 
				mediaElement.css("filter", "blur(5px)"); 
			}

    } else if (mime.includes('video')) {
        mediaElement = $('<video controls>');
        mediaElement.attr('src', '${pageContext.request.contextPath}/resources/feed/' + savedName);
        mediaElement.attr('alt', '미디어');
//         mediaElement.css('height', '300px');
//         mediaElement.css('width', '360px');
        	
//         	시연용
		    video.css("width", "100%");
		    video.css("height", "auto");
//		        시연용 추가
		   	video.css("max-height", "760px");
		    
        
        if (faFilter === "black-and-white") {
        	mediaElement.css("filter", "grayscale(100%)");
			} else if (faFilter === "brightness") { 
				mediaElement.css("filter", "brightness(150%)"); 
			} else if (faFilter === "shake") { 
				mediaElement.css("position", "relative"); 
				mediaElement.css("animation", "shake 0.5s"); 
			} else if (faFilter === "invert") { 
				mediaElement.css("filter", "invert(100%)");
			} else if (faFilter === "sepia") { 
				mediaElement.css("filter", "sepia(100%)"); 
			} else if (faFilter === "saturate") { 
				mediaElement.css("filter", "saturate(200%)"); 
			} else if (faFilter === "opacity") { 
				mediaElement.css("opacity", "0.5"); 
			} else if (faFilter === "blur") { 
				mediaElement.css("filter", "blur(5px)"); 
			}
	
    }
    mediaContainer.append(mediaElement);
   
    var prevSelectedImage;
    
 // 파일 선택 시 미리보기 설정
    $('#imageInput1').on('change', function() {
        var file = this.files[0];

        if (!file) {
            return;
        }

        var reader = new FileReader();

        reader.onload = function(e) {
            var mediaContainer = $('#mediaContainer');
            mediaContainer.empty(); 

            var mime = file.type;
            var savedName = file.name;

            var mediaElement;
            if (mime.includes('image')) {
                mediaElement = $('<img>');
            } else if (mime.includes('video')) {
                mediaElement = $('<video controls>');
            }

            if (mediaElement) {
                mediaElement.attr('src', e.target.result); 
                mediaElement.attr('alt', '미디어');
                mediaElement.css('height', '300px');
                mediaElement.css('width', '360px');

                mediaContainer.append(mediaElement); 
                prevSelectedImage = {
                        file: file,
                        savedName: savedName
                    };
            }
        };
        reader.readAsDataURL(file);
    });

    // 필터 적용 함수
function applyFilter1() {
    	
    var selectedFilter = $('#selectFilterBox1').val();
    var previewImage = $('#mediaContainer');

    // 모든 필터 클래스를 제거
    previewImage.removeClass('black-and-white brightness shake invert sepia saturate opacity blur');

    if (selectedFilter === 'option1') {
        console.log("스타일 초기화");
    } else if (selectedFilter === 'option2') {
        console.log("흑백 필터 적용");
        previewImage.addClass('black-and-white');
    } else if (selectedFilter === 'option3') {
        console.log("뽀샤시 필터 적용");
        previewImage.addClass('brightness');
    } else if (selectedFilter === 'option4') {
        console.log("흔들림 필터 적용");
        previewImage.addClass('shake');
    } else if (selectedFilter === 'option5') {
        console.log("그림자톤 필터 적용");
        previewImage.addClass('invert');
    } else if (selectedFilter === 'option6') {
        console.log("세피아 필터 적용");
        previewImage.addClass('sepia');
    } else if (selectedFilter === 'option7') {
        console.log("채도 조절 필터 적용");
        previewImage.addClass('saturate');
    } else if (selectedFilter === 'option8') {
        console.log("투명도 조절 필터 적용");
        previewImage.css('opacity', '0.5');
    } else if (selectedFilter === 'option9') {
        console.log("흐릿한 효과 필터 적용");
        previewImage.addClass('blur');
    }
}

    // 필터 적용 이벤트 핸들러
    $('#selectFilterBox1').on('change', function() {
        applyFilter1();
    });

    
    $('#feedUpdateBtn').on('click', function() {
        var agId = $('#feedAgId').val();
        var feedNo = $('#feedUpdateNo').val();
        var feedContent = $('#postContent1').val();
        var feedMembership = $('#membershipPost1').prop('checked') ? 1 : 0; 

        var feedFile = $('#imageInput1').prop('files')[0];
        console.log("feedFile",feedFile);
        var prevSavedName = savedName; 
        var selectedOption = document.getElementById('selectFilterBox1').value;
        var selectedFilter;
		console.log("selectedOption",selectedOption);
        if (selectedOption === 'option2') {
            selectedFilter = 'black-and-white';
        } else if (selectedOption === 'option3') {
            selectedFilter = 'brightness';
        } else if (selectedOption === 'option4') {
            selectedFilter = 'shake';
        } else if (selectedOption === 'option5') {
            selectedFilter = 'invert';
        } else if (selectedOption === 'option6') {
            selectedFilter = 'sepia';
        } else if (selectedOption === 'option7') {
            selectedFilter = 'saturate';
        } else if (selectedOption === 'option8') {
            selectedFilter = 'opacity';
        } else if (selectedOption === 'option9') {
            selectedFilter = 'blur';
        }
    	console.log("selectedFilter",selectedFilter);
		console.log("feedFile",feedFile);
		console.log("prevSavedName",prevSavedName);
        var formData = new FormData();
        formData.append('feedNo', feedNo);
        formData.append('agId', agId);
        formData.append('feedContent', feedContent);
        formData.append('feedMembership', feedMembership);

        if (feedFile) {
            formData.append('feedFile', feedFile);
        } else {
            formData.append('faSavedname', prevSavedName);
        }
        formData.append('faFilter', selectedFilter);
        $.ajax({
            type: 'POST',
            url: '/community/feed/feedUpdate.do',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: formData,
            
            processData: false, 
            contentType: false, 
            success: function(response) {
                Swal.fire({
                    icon: "success",
                    title: "수정이 완료되었습니다.",
                    showConfirmButton: false,
                    timer: 1500
                }).then(() => {
                    location.reload(); 
                });
                console.log('요청이 성공했습니다.');
            },
            error: function(xhr, status, error) {
                console.error('요청이 실패했습니다.');
            }
        });
    });
}




// var mediaContainer = document.getElementById("mediaContainer");
// var faMime = "${feed.faMime}";

// if (faMime.includes("image")) {
//     // 이미지 파일인 경우
//     var image = document.createElement("img");
//     image.src = "${pageContext.request.contextPath}/resources/feed/" + "${feed.faSavedname}";
//     image.alt = "이미지";
//     image.style.height = "300px"; // 이미지의 높이 조절
//     mediaContainer.insertBefore(image, mediaContainer.firstChild);
// } else if (faMime.includes("video")) {
//     // 비디오 파일인 경우
//     var video = document.createElement("video");
//     video.controls = true; // 비디오 컨트롤러 표시
//     video.style.height = "300px"; // 비디오의 높이 조절
//     var source = document.createElement("source");
//     source.src = "${pageContext.request.contextPath}/resources/feed/" + "${feed.faSavedname}";
//     source.type = faMime; // 비디오 파일의 MIME 타입 설정
//     video.appendChild(source);
//     mediaContainer.insertBefore(video, mediaContainer.firstChild);
// } else {
//     // 이미지나 비디오가 아닌 경우
//     console.error("지원되지 않는 파일 형식입니다.");
// }

$("#commentContent").keydown(function(event) {
      // 엔터 키가 눌렸을 때
      if (event.which === 13) {
          event.preventDefault();  
          $("#commentButton").click();
      }
  });
$("#commentContent").keydown(function(event) {
      // 엔터 키가 눌렸을 때
      if (event.which === 13) {
          event.preventDefault();  
          $("#commentButton").click();
      }
  });
$(document).ready(function() {

    $('#modalCommentBtn').on('click', function() {
        $('#commentModal').show();
        
    });
    
    $('#commentModal .close').on('click', function() {
        $('#commentModal').hide();
    });
    
    $('#commentButton').on('click',function() {
        var commentContent = $('#commentContent').val();
        var feedNo = $('#feedRealNo').val();
        var userNo = $('#modalCommentBtn').data('userno');
		console.log("feedNo",feedNo);
		console.log("commentContent",commentContent);
		console.log("userNo",userNo);
        $.ajax({
            type: 'POST',
            url: '/community/feed/comment/insert.do',
            beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
            data: { 
            	userNo:userNo,
            	feedNo:feedNo,
            	fcContent: commentContent,
            	}, 
            success: function(response) {
            	 $('#commentModal').hide();
            	 updateComments(feedNo);
            },
            error: function(xhr, status, error) {
                console.error(error);
                alert('댓글 작성에 실패했습니다. 다시 시도해주세요.');
            }
        });
    });
 });
// function updateComments(feedNo) {
//     $.ajax({
//         type: 'get',
//         url: '/community/feed/artistFeedComment.do?feedNo=' + feedNo,
//         success: function(data) {
//             var commentsHtml = '';
//             data.feedCommentList.forEach(function(comment) {
//                 console.log("comment",comment);
//                 var commentHtml = '<div class="comment">';
//                 commentHtml += '<p>' + comment.fcContent + '</p>';
//                 commentHtml += '</div>';

//                 commentsHtml += commentHtml;
//             });

//             $('#ulCommentArea').html(commentsHtml);
//         },
//         error: function(xhr, status, error) {
//             console.error('댓글을 불러오는 중 오류 발생:', error);
//         }
//     });
// }
function updateComments(feedNo) {
	var loggedUserNo = $('#myModal').data('loginuser');
	$.ajax({
	    type: 'get',
	    beforeSend: function(xhr){	
			xhr.setRequestHeader(header, token);
		},
	    url: '/community/feed/artistFeedComment.do?feedNo=' + feedNo,
	    success: function(data) {
	        var commentsHtml = '';
	        data.feedCommentList.forEach(function(comment) {
	        	console.log("comment",comment);
    			var fcRegdate = comment.fcRegdate;
        		var date = new Date(fcRegdate);
     		    var formattedDate = date.toLocaleString();
        		var cjNo1 = comment.cjNo;
     			var userType=comment.userType;
     			var memberShipYn = data.memberShipYn;
     			console.log("memberShipYn",memberShipYn);
	            var commentHtml = '<div class="comment">';
	            var contextPath = '${pageContext.request.contextPath}'; 
	            commentHtml += "<li>";
	            commentHtml += "	<div class='modalFeedCommentArea'>";
	            commentHtml += "    	<div class='comet-avatar modalFeedCommentProfile' id='modalComProfile'>";
	            commentHtml += "        	<img src='" + contextPath + comment.userProfile + "' alt='' style='object-fit:cover;'>";
	            commentHtml += "    		<div class='we-comment modalFeedCommentTop'>";
	            commentHtml += "				<h5><a title='' href='/community/feed/myFeed.do?userNo=" + comment.userNo + "&agId=" + comment.agId + "'>" + comment.mnNickName + "</a></h5>";
	            for (var i = 0; i < memberShipYn.length; i++) {
        		    var feed1 = memberShipYn[i];
        		    console.log("수정제발요",cjNo1);
        		    if (feed1.cjNo == cjNo1 && userType !='3') {
        		    	commentHtml += "<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>";
        		    }
        		}

	        	if (userType == '3') {
	        		commentHtml += "<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>";    
	        	    
	        	}
	            
	            
	            commentHtml += "    	</div>";
	            commentHtml += "    </div>";
	            commentHtml += "    <p id='modalComContent' class='modalFeedCommentCon'>"+ comment.fcContent +"</p>";
	            commentHtml += "    <div class='inline-itms' id='modalcomFcRegdate'>";
	            commentHtml += "        <span class='modalFeedCommentDate'>"+ formattedDate +"</span>";
	            
	            commentHtml += "	<div class='modalFeedCommentBtns'>"
	            
	            commentHtml += "		<div id='likeFeed2' class='like-button2 modalFeedCommentLike' title='Like/Dislike' data-fcno='" + comment.fcNo + "' data-userno='" + comment.userNo + "' style='cursor: pointer'>";
	            commentHtml += "    		<span class='modalFeedCommentLikeBtn'>❤</span>";
	            commentHtml += "    		<span class='like-count'>0</span>";
	            commentHtml += "		</div>";
	            
        		if (comment.userNo == loggedUserNo) {
        			commentHtml += "<a title='Edit Comment' href='#' onclick='openEditCommentModal("+ comment.fcNo +", \""+ comment.fcContent +"\")' class='edit-comment' style='margin-right:10px;'><i class='fa fa-edit'></i></a>";
        			commentHtml += "<a title='Delete Comment' href='#' onclick='deleteComment("+ comment.fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>";
        		}
        		if(comment.userNo != loggedUserNo){
        		commentHtml += "<a title='Report Comment' href='#' onclick='reportComment("+ comment.feedNo +", \""+ comment.userNo +"\")' class='report-comment'><i class='fa-sharp fa-regular fa-bell'></i></a>";
        		}
        		
        		commentHtml += "    	</div>";
        		commentHtml += "    	</div>";
        		commentHtml += "    </div>";
        		commentHtml += "</li>";

	            commentsHtml += commentHtml;
	        });

	        $('#ulCommentArea').html(commentsHtml);
			$('#commentContent').val('');
	    },
	    error: function(xhr, status, error) {
	        console.error('댓글을 불러오는 중 오류 발생:', error);
	    }
	    
	});

}
//-------------------
// 유저 피드 댓글
$(function(){
	var feeds = $(".feeds");
	var loggedUserNo = $('#myModal').data('loginuser');
	console.log("loggedUserNologgedUserNo",loggedUserNo);
    $(".loadMore").on("click", ".feeds", function(){
        var feedNo = $(this).data("idx");
        
        $.ajax({
        	type: 'get',
        	beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
        	url:'/community/feed/artistFeedComment.do?feedNo=' + feedNo,
        	success: function(data){
        		console.log(data);
        		console.log(data.feedVO.feedContent);
        		
     			console.log("asdfasdf",data.feedVO.feedNo);
     			
     			likeFeedNo(data.feedVO.feedNo);
        		
        		$("#feedRealNo").val(feedNo);
        		
        		// feedCommentList를 이용해서 댓글들을 뿌린다.
     			var cmtHtml = "";
					
     			$("#ulCommentArea").empty();
     			
     			data.feedCommentList.map(function(v,i){
       				var deleteButton = (userNo == loggedUserNo) ? "<a title='Delete Comment' href='#' onclick='deleteComment("+ fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>" : "";
       				var fcContent = v.fcContent;
        			var feedNo=v.feedNo;
        			var fcNo = v.fcNo;
        			var cjNo = v.cjNo;
        			console.log("cjNo",cjNo);
        			var fcRegdate = v.fcRegdate;
            		var date = new Date(fcRegdate);
         		    var formattedDate = date.toLocaleString();
        			var feedNo = v.feedNo;
        			var feedMembership=v.feedMembership;
        			var mnNickName = v.mnNickName;
        			var userType=v.userType;
        			var userNo = v.userNo;
        			var userProfile = v.userProfile;
        			var agId= v.agId;
        			var memberShipYn = data.memberShipYn;
	        		var contextPath = '${pageContext.request.contextPath}'; 
	        		cmtHtml += "<li>";
	        		cmtHtml += "	<div class='modalFeedCommentArea'>";
	        		
	        		cmtHtml += "    	<div class='comet-avatar modalFeedCommentProfile' id='modalComProfile'>";
	        		cmtHtml += "        	<img src='" + contextPath + userProfile + "' alt='' style='object-fit:cover;'>";
	        		cmtHtml += "    		<div class='we-comment modalFeedCommentTop'>";
	        		cmtHtml += "				<h5><a title='' href='/community/feed/myFeed.do?userNo=" + userNo + "&agId=" + agId + "'>" + mnNickName + "</a></h5>";
// 	        		if (cjNo >0 && userType == '2') {
// 	        	   		cmtHtml += "<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>";
// 	        		}
	        		for (var i = 0; i < memberShipYn.length; i++) {
	        		    var feed1 = memberShipYn[i];
	        		    console.log("제발",cjNo);
	        		    if (feed1.cjNo == cjNo && userType !='3' ) {
	        		        cmtHtml += "<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>";
	        		    }
	        		}
		        	if (userType == '3') {
		        		cmtHtml += "<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>";
		        	}
		        	
	        		cmtHtml += "    		</div>";
	        		cmtHtml += "    	</div>";
	        		
	        		cmtHtml += "    	<p id='modalComContent' class='modalFeedCommentCon'>"+ fcContent +"</p>";
	        		cmtHtml += "    	<div class='inline-itms' id='modalcomFcRegdate'>";
	        		cmtHtml += "        		<span class='modalFeedCommentDate'>"+ formattedDate +"</span>";
	        		
	        		cmtHtml += "		<div class='modalFeedCommentBtns'>"
	        		
	        		cmtHtml += "			<div id='likeFeed2' class='like-button2 modalFeedCommentLike' title='Like/Dislike' data-fcno='" + fcNo + "' data-userno='" + userNo + "' style='cursor: pointer'>";
	        		cmtHtml += "    			<span class='modalFeedCommentLikeBtn'>❤</span>";
	        		cmtHtml += "    			<span class='like-count'>0</span>";
	        		
	        		cmtHtml += "			</div>";
	        		
	        		if (userNo == loggedUserNo) {
	        		    cmtHtml += "<a title='Edit Comment' href='#' onclick='openEditCommentModal("+ fcNo +", \""+ fcContent +"\")' class='edit-comment' style='margin-right:10px;'><i class='fa fa-edit'></i></a>";
	        		    cmtHtml += "<a title='Delete Comment' href='#' onclick='deleteComment("+ fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>";
	        		}
	        		if(userNo != loggedUserNo){
	        		cmtHtml += "<a title='Report Comment' href='#' onclick='reportComment("+ feedNo +", \""+ userNo +"\")' class='report-comment'><i class='fa-sharp fa-regular fa-bell'></i></a>";
	        		}
	        		
	        		cmtHtml += "		</div>";
	        		
	        		cmtHtml += "    	</div>";
	        		cmtHtml += "    </div>";
	        		cmtHtml += "</li>";

	        		
        			
        			
        			
        		});
     			$("#ulCommentArea").prepend(cmtHtml);
     			
     			updateLikeCounts();
     			
     			$("#modalmemberShip").empty();
     			
     			var contextPath = ''; 
     			var userNo= data.feedVO.userNo;
     			var agId= data.feedVO.agId;
     			$('#modalnick').attr('href', '/community/feed/myFeed.do?userNo=' + userNo + '&agId=' + agId);
     			
     			var content = data.feedVO.feedContent;
     			var nickname = data.feedVO.mnNickName;
     			var feedRegdate = data.feedVO.feedRegdate;
     			var date = new Date(feedRegdate);
     			var imageName = data.feedVO.userProfile;
     			var feedMembership=data.feedVO.feedMembership;
    			var userType=data.feedVO.userType;
    			var cjNo=data.feedVO.cjNo;
    			var memberShipYn = data.memberShipYn;
     			console.log("memberShipYn",memberShipYn);
     			for (var i = 0; i < memberShipYn.length; i++) {
     			    var feed = memberShipYn[i];
     			    console.log("cjNo밑",cjNo);
     			    console.log("feed",feed.cjNo);
     			    if (cjNo == feed.cjNo && userType !='3') {
//      			    	시연용
     			    	$("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: absolute; top: 43px;'>");
//      			    	$("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>");
     			        console.log('cjNo와 memberShipYn의 cjNo가 같습니다.');
     			    } else {
     			        console.log('cjNo와 memberShipYn의 cjNo가 다릅니다.');
     			    }
     			}
     			
    			console.log("cjNo",cjNo);
     			console.log("userType1",userType);
     			var profile = "<img src='" + contextPath + imageName + "' alt=''>";
     			console.log(profile);
     			var mediaType = data.feedVO.faMime;
     			var faSavedname = data.feedVO.faSavedname;
     			var faFilter = data.feedVO.faFilter;

     			var modalMedia = $("#modalMedia");
		
     			modalMedia.empty();
     			
     			
     			
     			
     			if (mediaType) {
	     			if (mediaType.includes("image")) {
	     			    // 이미지인 경우
	     			    var modalImage = $("<img>");
	     			    modalImage.attr("src", contextPath + "/resources/feed/" + faSavedname);
	     			    modalImage.attr("alt", "");
	     			    modalImage.css("width", "100%");
	     			    modalImage.css("max-height", "700px");
//  			                 시연용 수정
	     			    modalImage.css("object-fit", "contain");
// 	     			        시연용 추가
	     			    modalImage.css("object-position", "left");
	     			    
	     			   if (faFilter === "black-and-white") {
	     				    modalImage.css("filter", "grayscale(100%)");
	     				} else if (faFilter === "brightness") { 
	     				    modalImage.css("filter", "brightness(150%)"); 
	     				} else if (faFilter === "shake") { 
	     				    modalImage.css("position", "relative"); 
	     				    modalImage.css("animation", "shake 0.5s"); 
	     				} else if (faFilter === "invert") { 
	     				    modalImage.css("filter", "invert(100%)");
	     				} else if (faFilter === "sepia") { 
	     				    modalImage.css("filter", "sepia(100%)"); 
	     				} else if (faFilter === "saturate") { 
	     				    modalImage.css("filter", "saturate(200%)"); 
	     				} else if (faFilter === "opacity") { 
	     				    modalImage.css("opacity", "0.5"); 
	     				} else if (faFilter === "blur") { 
	     				    modalImage.css("filter", "blur(5px)"); 
	     				}
	
	     			    modalMedia.append(modalImage);
	     			} else if (mediaType.includes("video")) {
	     			    var video = $("<video controls>");
	     			    video.css("width", "100%");	// 너비 설정
	     			    video.css("height", "auto");
//	     			        시연용 추가
	     			   	video.css("max-height", "760px");
	     			    
	     			    var source = $("<source>");
	     			    source.attr("src", contextPath + "/resources/feed/" + faSavedname);
	     			    video.append(source);
	     			   if (faFilter === "black-and-white") {
	     				  video.css("filter", "grayscale(100%)");
	     				} else if (faFilter === "brightness") { 
	     					video.css("filter", "brightness(150%)"); 
	     				} else if (faFilter === "shake") { 
	     					video.css("position", "relative"); 
	     					video.css("animation", "shake 0.5s"); 
	     				} else if (faFilter === "invert") { 
	     					video.css("filter", "invert(100%)");
	     				} else if (faFilter === "sepia") { 
	     					video.css("filter", "sepia(100%)"); 
	     				} else if (faFilter === "saturate") { 
	     					video.css("filter", "saturate(200%)"); 
	     				} else if (faFilter === "opacity") { 
	     					video.css("opacity", "0.5"); 
	     				} else if (faFilter === "blur") { 
	     					video.css("filter", "blur(5px)"); 
	     				}
	
	     			    modalMedia.append(video);
	     			} else {
	     			    console.error("지원되지 않는 미디어 형식입니다.");
	     			}
     			} else {
      			   
     			}



//      			if (cjNo>0 && userType == '2') {
//      			    $("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>");
//      			}
     			if (userType == '3') {
     			    $("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>");
     			}
        		$("#modalProfile").html(profile);
        		$("#modalContent").text(content);
        		$("#modalnick").text(nickname);
        		$("#modalFeedRegdate").text(date.toLocaleString());
        		
        		document.getElementById("editableContent").addEventListener("click", function() {
        		    $('#modalBtn').click();
        		});
        		$('#modalBtn').click();

        	}
        	
        	
        });
        
    });
	
	
});
	


	
	

// 피드삭제
$('.post_button').on('click', function() {
    $('#myModal').modal('show'); // 모달 표시
});

$('#postBtn').on('click', function() {
    var agId = $('#myModal').data('agid');
    var userNo = $('#myModal').data('userno');
    var userType = $('#myModal').data('usertype');
    var feedContent = $('#postContent').val(); 
    var feedMembership = $('#membershipPost').prop('checked') ? 1 : 0;
    console.log("userTypeuserType",userType);

    // 선택된 필터 정보 가져오기
    var selectedOption = document.getElementById('selectFilterBox').value;
    var selectedFilter;

    if (selectedOption === 'option2') {
        selectedFilter = 'black-and-white';
    } else if (selectedOption === 'option3') {
        selectedFilter = 'brightness';
    } else if (selectedOption === 'option4') {
        selectedFilter = 'shake';
    } else if (selectedOption === 'option5') {
        selectedFilter = 'invert';
    } else if (selectedOption === 'option6') {
        selectedFilter = 'sepia';
    } else if (selectedOption === 'option7') {
        selectedFilter = 'saturate';
    } else if (selectedOption === 'option8') {
        selectedFilter = 'opacity';
    } else if (selectedOption === 'option9') {
        selectedFilter = 'blur';
    }
	console.log("selectedFilter",selectedFilter);
	var banKeywords = $('#myModal').data('ban');
	var postContent = document.getElementById('postContent').value;

	var keywordArray = banKeywords.split(',');

	for (var i = 0; i < keywordArray.length; i++) {
	    var keyword = keywordArray[i].trim(); // 공백을 제거한 키워드 추출
	    var keywordWithoutPrefixAndSuffix = keyword.split(')')[0].split('bkText=')[1]; // "bkText="와 ")"를 기준으로 문자열 자르기
	    console.log("금지어:", keywordWithoutPrefixAndSuffix); // 콘솔에 키워드 출력
	    if (postContent.includes(keywordWithoutPrefixAndSuffix)) {
// 	        alert('부적절한 단어가 포함되어 있습니다.');
			 Swal.fire({
            icon: "error",
            title: "부적절한 단어가 포함되어 있습니다.",
            showConfirmButton: false,
            timer: 1500
        })
	        return false;
	    }
	}
	
    var formData = new FormData();
    formData.append('agId', agId);
    formData.append('userNo', userNo);
    formData.append('feedContent', feedContent);
    formData.append('feedMembership', feedMembership);
    formData.append('userType', userType);
    formData.append('type', "ArtistFeed");

    // 파일이 첨부되었는지 확인
    var feedFile = $('#imageInput')[0].files[0]; 
    if (feedFile) {
        formData.append('feedFile', feedFile);
    }
    	formData.append('faFilter', selectedFilter);
    	console.log("formData", formData.get('faFilter'));
	
    // 서버에 데이터 전송
    $.ajax({
        type: 'POST',
        url: '/community/feed/insert.do',
        beforeSend: function(xhr){	
			xhr.setRequestHeader(header, token);
		},
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            $('#myModal').modal('hide');
            Swal.fire({
                icon: "success",
                title: "작성이 완료되었습니다.",
                showConfirmButton: false,
                timer: 1500
            }).then(() => {
            	
            	var ArtistFeedData = {
		        		type : "ArtistFeed",
		        		receiver : response.FeedJoinedList
		        }
            	ws.send(JSON.stringify(ArtistFeedData));
            	setTimeout(() => {
            	  location.reload();
		        }, 3000);
            });
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
});
function deleteComment(fcNo) {
    Swal.fire({
        title: '댓글을 삭제하시겠습니까?',
        text: "이 작업은 되돌릴 수 없습니다!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '네, 삭제하겠습니다!',
        cancelButtonText: '아니요, 취소합니다!'
    }).then((result) => {
        if (result.isConfirmed) {
            console.log("fcNo", fcNo);
            $.ajax({
                type: 'POST', 
                url: '/community/feed/comment/commentDelete.do', 
                beforeSend: function(xhr){    
                    xhr.setRequestHeader(header, token);
                },
                data: JSON.stringify({ fcNo: fcNo }),
                contentType: "application/json; charset=utf-8",
                success: function(response) {
                    Swal.fire({
                        icon: "success",
                        title: "댓글이 삭제되었습니다.",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    updateComments($('#feedRealNo').val());
                },
                error: function() {
                    Swal.fire({
                        icon: "error",
                        title: "댓글 삭제에 실패했습니다.",
                        showConfirmButton: false,
                        timer: 1500
                    });
                }
            });
        }
    });
}

function deleteFeed(feedNo, currentUserId, feedOwnerId) {
    if (currentUserId === feedOwnerId) {
    		console.log(feedNo);
        	var feedNo=feedNo;
    		console.log(feedNo);
        if (confirm('정말로 이 게시물을 삭제하시겠습니까?')) {
            $.ajax({
                type: 'POST',
                url: '/community/feed/feedDelete.do',
                beforeSend: function(xhr){	
        			xhr.setRequestHeader(header, token);
        		},
                data: JSON.stringify({ feedNo: feedNo }),
                contentType: "application/json; charset=utf-8",
                success: function(response) {
                    alert('게시물이 삭제되었습니다.');
                    location.reload();
                },
                error: function(xhr, status, error) {
                    console.error(error);
                    alert('게시물 삭제에 실패했습니다.');
                }
            });
        }
    } else {
        alert('삭제할 수 있는 권한이 없습니다.');
    }
};

$(function(){
	var loggedUserNo = $('#myModal').data('loginuser');
    $('.slick-slide-item').on('click', function() {
        $('#img-comt').modal('show');
//  		var feedNo = 101;
 		var feedNo = $(this).data('feedno');
        console.log("feedNofeedNofeedNo",feedNo);
        $.ajax({
        	type: 'get',
        	url:'/community/feed/artistFeedComment.do?feedNo=' + feedNo,
        	beforeSend: function(xhr){	
    			xhr.setRequestHeader(header, token);
    		},
        	success: function(data){
        		console.log(data);
        		console.log(data.feedVO.feedContent);
        		
     			console.log("asdfasdf",data.feedVO.feedNo);
     			
     			likeFeedNo(data.feedVO.feedNo);
        		
        		$("#feedRealNo").val(feedNo);
        		
        		// feedCommentList를 이용해서 댓글들을 뿌린다.
     			var cmtHtml = "";
					
     			$("#ulCommentArea").empty();
     			
       			
     			
     			
     			
     			
     			
     			
     			
     			data.feedCommentList.map(function(v,i){
       				var deleteButton = (userNo == loggedUserNo) ? "<a title='Delete Comment' href='#' onclick='deleteComment("+ fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>" : "";
       				var fcContent = v.fcContent;
        			var feedNo=v.feedNo;
        			var fcNo = v.fcNo;
        			var cjNo1 = v.cjNo;
        			var fcRegdate = v.fcRegdate;
            		var date = new Date(fcRegdate);
            		var memberShipYn = data.memberShipYn;
         		    var formattedDate = date.toLocaleString();
        			var feedNo = v.feedNo;
        			var feedMembership = v.feedMembership;
        			var mnNickName = v.mnNickName;
        			var userNo = v.userNo
        			var userProfile = v.userProfile;
        			var userType = v.userType;
        			var agId= v.agId;
        			var memberShipYn = data.memberShipYn;
	        		var contextPath = '${pageContext.request.contextPath}'; 
	        		cmtHtml += "<li>";
	        		cmtHtml += "	<div class='modalFeedCommentArea'>";
	        		
	        		
	        		cmtHtml += "    <div class='comet-avatar modalFeedCommentProfile' id='modalComProfile'>";
	        		cmtHtml += "        <img src='" + contextPath + userProfile + "' alt='' style='object-fit:cover;'>";
	        		cmtHtml += "    	<div class='we-comment modalFeedCommentTop'>";
	        		cmtHtml += "			<h5><a title='' href='/community/feed/myFeed.do?userNo=" + userNo + "&agId=" + agId + "'>" + mnNickName + "</a></h5>";
	        		for (var i = 0; i < memberShipYn.length; i++) {
	        		    var feed1 = memberShipYn[i];
	        		    console.log("제발요",cjNo1);
	        		    if (feed1.cjNo == cjNo1 && userType !='3') {
	        		        cmtHtml += "<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>";
	        		    }
	        		}
	
		        	if (userType == '3') {
		        		cmtHtml += "<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>";
		        	}
	        		cmtHtml += "    	</div>";
	        		cmtHtml += "    </div>";
	        		cmtHtml += "    <p id='modalComContent' class='modalFeedCommentCon'>"+ fcContent +"</p>";
	        		cmtHtml += "    <div class='inline-itms' id='modalcomFcRegdate'>";
	        		cmtHtml += "        <span class='modalFeedCommentDate'>"+ formattedDate +"</span>";
	        		
	        		cmtHtml += "	<div class='modalFeedCommentBtns'>"
	        		cmtHtml += "		<div id='likeFeed2' class='like-button2 modalFeedCommentLike' title='Like/Dislike' data-fcno='" + fcNo + "' data-userno='" + userNo + "' style='cursor: pointer'>";
	        		cmtHtml += "    		<span class='modalFeedCommentLikeBtn'>❤</span>";
	        	    cmtHtml += "    		<span class='like-count'>0</span>";
	        		cmtHtml += "		</div>";
	        		if (userNo == loggedUserNo) {
	        		    cmtHtml += "<a title='Edit Comment' href='#' onclick='openEditCommentModal("+ fcNo +", \""+ fcContent +"\")' class='edit-comment' style='margin-right:10px;'><i class='fa fa-edit'></i></a>";
	        		    cmtHtml += "<a title='Delete Comment' href='#' onclick='deleteComment("+ fcNo +")' class='delete-comment'><i class='fa fa-trash'></i></a>";
	        		}
	        		if(userNo != loggedUserNo){
	        		cmtHtml += "<a title='Report Comment' href='#' onclick='reportComment("+ feedNo +", \""+ userNo +"\")' class='report-comment'><i class='fa-sharp fa-regular fa-bell'></i></a>";
	        		}
	        		cmtHtml += "    	</div>";
	        		cmtHtml += "    	</div>";
	        		
	        		cmtHtml += "	</div>";
	        		cmtHtml += "</li>";

	        		
        			
        			
        			
        		});
     			$("#ulCommentArea").prepend(cmtHtml);
     			
     			updateLikeCounts();
     		
     			
     			
     			
     			$("#modalmemberShip").empty();
     			var contextPath = ''; 
     			var userNo= data.feedVO.userNo;
     			var agId= data.feedVO.agId;
     			$('#modalnick').attr('href', '/community/feed/myFeed.do?userNo=' + userNo + '&agId=' + agId);
     			
     			var content = data.feedVO.feedContent;
     			var nickname = data.feedVO.mnNickName;
     			var feedRegdate = data.feedVO.feedRegdate;
     			var date = new Date(feedRegdate);
     			var imageName = data.feedVO.userProfile; 
     			var cjNo = data.feedVO.cjNo;
     			var feedMembership=data.feedVO.feedMembership;
    			var userType1=data.feedVO.userType;
     			console.log("feedMembership",feedMembership);
     			console.log("userType123123",userType1);
     			
     			var memberShipYn = data.memberShipYn;
     			console.log("memberShipYn",memberShipYn);
     			for (var i = 0; i < memberShipYn.length; i++) {
     			    var feed = memberShipYn[i];
     			    var cjNo = data.feedVO.cjNo;
     			    var userType1=data.feedVO.userType;
     			    console.log("cjNo",cjNo);
     			    console.log("feed",feed.cjNo);
     			    if (cjNo == feed.cjNo && userType1 != '3') {
     			    	$("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>");
     			        console.log('cjNo와 memberShipYn의 cjNo가 같습니다.');
     			    } else {
     			        console.log('cjNo와 memberShipYn의 cjNo가 다릅니다.');
     			    }
     			}
     			
     			var faFilter = data.feedVO.faFilter; 
     			console.log("faFilter",faFilter)
     			var profile = "<img src='" + contextPath + imageName + "' alt=''>";
     			console.log(profile);
     			var mediaType = data.feedVO.faMime;
     			var faSavedname = data.feedVO.faSavedname;

     			var modalMedia = $("#modalMedia");
		
     			modalMedia.empty();

     			if (mediaType.includes("image")) {
     			    // 이미지인 경우
     			    var modalImage = $("<img>");
     			    modalImage.attr("src", contextPath + "/resources/feed/" + faSavedname);
     			    modalImage.attr("alt", "");
     			    modalImage.css("width", "100%");
    			    modalImage.css("max-height", "700px");
//  			        시연용 수정
    			    modalImage.css("object-fit", "contain");
//     			    modalImage.css("object-fit", "cover");
//  			        시연용 추가
    			    modalImage.css("object-position", "left");
     			    
     			   if (faFilter === "black-and-white") {
     			        modalImage.css("filter", "grayscale(100%)");
     			    }
     			    modalMedia.append(modalImage);
     			} else if (mediaType.includes("video")) {
     			    // 동영상인 경우
     			    var video = $("<video controls>");
     			   	video.css("width", "100%");	// 너비 설정
     			  	video.css("height", "100%");
//			                  시연용 추가
     			  	video.css("max-height", "760px");
     			  	
     			    var source = $("<source>");
     			    source.attr("src", contextPath + "/resources/feed/" + faSavedname);
     			    video.append(source);
     			   if (faFilter === "black-and-white") {
     				  video.css("filter", "grayscale(100%)");
     			    }
     			    
     			    modalMedia.append(video);
     			} else {
     			    console.error("지원되지 않는 미디어 형식입니다.");
     			}



        		
//      			if (cjNo>0 && userType == '2') {
//      			    $("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/membershipicon.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 2px;'>");
//      			}
     			if (userType1 == '3') {
     			    $("#modalmemberShip").html("<img src='${pageContext.request.contextPath}/resources/images/mark.png' alt='' style='width: 12px; height: 12px; position: relative; bottom: 1px;'>");
     			}
        		$("#modalProfile").html(profile);
        		$("#modalContent").text(content);
        		$("#modalnick").text(nickname);
        		$("#modalFeedRegdate").text(date.toLocaleString());
        		
        		
        		$('#modalBtn').click();
        		
        	}
        	
        	
        });
        
    });
	
});

// $('#membershipLink').click(function(event) {
//     var confirmMembership = confirm("멤버십을 구입하시겠습니까?");
//     if (!confirmMembership) {
//         event.preventDefault(); 
//     }
// });
$('#membershipLink').click(function(event) {
    event.preventDefault(); // 기본 이벤트를 방지함
    var linkURL = $(this).attr('href'); // 클릭된 링크의 URL을 가져옴

    Swal.fire({
        title: '멤버십을 구입하시겠습니까?',
        text: "멤버십 구매를 위해 확인을 눌러주세요.",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = linkURL;
        }
    });
});

$(".ps-container").addClass("commentScroll");
$(".chosen-container").addClass("filterSelectBox");


</script>