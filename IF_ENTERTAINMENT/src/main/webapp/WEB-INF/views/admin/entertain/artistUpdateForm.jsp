<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.card {
	margin-bottom: 10px;
}
.card-header {
    background-color: #ffffff;
    color: white;
    cursor: pointer;
}
#addMemberBtn {
	background: rgba(0, 0, 0, 0) linear-gradient(-135deg, #1de9b6 0%, #1dc4e9 100%) repeat scroll 0 0;
	position: relative;
	left : 74%;
	
     border: medium none;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    -o-border-radius: 5px;
    border-radius: 5px;
    color: #fff;
    font-size: 14px;
    padding: 8px 35px;
    text-transform: capitalize;
    -webkit-transition: all 0.2s linear 0s;
    -moz-transition: all 0.2s linear 0s;
    -ms-transition: all 0.2s linear 0s;
    -o-transition: all 0.2s linear 0s;
    transition: all 0.2s linear 0s;
    margin: 0 0 17px 0;
}
.addproduct-title {
	margin: 0;
}
.addproduct-title span {
	margin-top: 20px;
	margin-bottom: 10px;
	display: inline-block;
}
.add-prod-from textarea {
	height: 200px;
}

</style>

<div class="gap no-gap">
    <c:set value="등록" var="name"/>
    <c:if test="${status eq 'u' }">
        <c:set value="수정" var="name"/>
    </c:if>
    <div class="inner-bg">
        <div class="element-title">
            <h2>아티스트 프로필 수정</h2>
        </div>
        <div class="add-prod-from">
            <form method="get" action="/entertain/artist/profile/insert.do" id="artistForm" enctype="multipart/form-data">
                <c:if test="${status eq 'u' }">
                    <input type="hidden" name="goodsNo" value="">
                </c:if>
                <div class="row row-addproduct">
                    <!-- 왼쪽 섹션 시작 -->
                    <div class="col-md-5">
                        <div class="addproduct-title">
                            <span>그룹명(영문)</span>
                        </div>
                        <input type="text" id="agId" name="agId" value="${artist.agId }">
                        
                        <div class="addproduct-title">
                            <span>그룹명(한글)</span>
                        </div>
                        <input type="text" id="agName" name="agName" value="${artist.agName }">
                <div class="addproduct-title">
						    <span>데뷔일</span>
						</div>
						
						<div class="agDate">
						  	<fmt:parseDate value="${artist.agDate}" var="parsedAgDate" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${parsedAgDate}" pattern="yyyy-MM-dd" var="formattedDate" />
						</div>
						<input type="text" id="agDate" name="agDate" placeholder="${formattedDate}" value="${formattedDate}" pattern="\d{4}-\d{2}-\d{2}">
                        <div class="addproduct-title">
                            <span>그룹소개</span>
                        </div>
                        <textarea class="form-control" id="agIntro" name="agIntro">${artist.agIntro }</textarea>
                        
<!--                         <div class="addproduct-title"> -->
<!--                             <span>그룹 프로필 사진</span> -->
<!--                         </div> -->
<!--                         <label class="fileContainer"> -->
<!--                             <span>찾아보기</span> -->
<%--                             <input type="file" id="agPhoto" name="agPhoto" multiple="multiple"  value="${artist.agPhoto }"/> --%>
<!--                         </label> -->
                        <div class="addproduct-title">
                            <span>프로필 사진</span>
                        </div>
                        <label class="fileContainer"> <span>찾아보기</span>
                            <input type="file" id="agPhoto" name="agPhoto" />
                        </label>
					    <c:choose>
					        <c:when test="${fn:contains(artist.agProfile, 'http')}">
					            <img id="thumimg" src="${artist.agProfile}" alt="" class="profile-img">
					        </c:when>
					        <c:otherwise>
					            <img id="thumimg" src="${pageContext.request.contextPath}/resources/upload/group/${artist.agProfile}" alt="" class="profile-img">
					        </c:otherwise>
					    </c:choose>
					                        
                    
                    </div>
                    <!-- 왼쪽 섹션 끝 -->
                    
                    <!-- 오른쪽 섹션 시작 (비워둠) -->
                    <div class="col-md-5" >
                       <button type="button" id="addMemberBtn">멤버 추가하기</button>
                       <div id="memberAccordion">
						    <c:forEach var="list" items="${list}" varStatus="status"> 
						        <div class="card">
						            <div class="card-header" id="heading${status.index}">
						               <h5 class="mb-0 d-flex justify-content-between align-items-center">
										    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse${status.index}" aria-expanded="true" aria-controls="collapse${status.index}" >
										     <div class="add-prod-from">
										    ${list.artistFakename} 
										    </div>
										    </button>
										    <!-- 삭제하기 버튼 추가, 오른쪽 정렬을 위해 수정 -->
										   <button class="btn btn-danger" type="button" onclick="confirmDelete(this, ${status.index})" data-index="${status.index}" data-user-no="${list.userNo}" >삭제</button>
										</h5>
									         </div>
						            
						            <div id="collapse${status.index}" class="collapse" aria-labelledby="heading${status.index}" data-parent="#memberAccordion">
						                <div class="card-body irFile">
						                    <!-- 새로 추가할 셀렉트 박스 -->
						                    
						                    <!-- 기존 코드 -->
						                    <input type="text" class="form-control mb-2 artistFakename" value="${list.artistFakename}" placeholder="멤버명">
						                    
						                    <input type="file" class="fileContainer userPhoto" id="userPhoto" name="userPhoto">
											<div class="prodthumimg-box" data-user-profile="${list.userProfile}">
											    <c:choose>
											        <c:when test="${fn:contains(list.userProfile, 'http')}">
											            <img id="thumimg2" src="${list.userProfile}" alt="" class="profile-img">
											        </c:when>
											        <c:otherwise>
											            <img id="thumimg2" src="${pageContext.request.contextPath}/resources/upload/group/${list.userProfile}" alt="" class="profile-img">
											        </c:otherwise>
											    </c:choose>
											</div>
											    <fmt:parseDate value="${list.artistBirth}" pattern="yyyy-MM-dd" var="parsedBirthDate" />
											    <fmt:formatDate value="${parsedBirthDate}" pattern="yyyy-MM-dd" var="formattedBirthDate"/>
											<input type="text" id="artistBirth" name="artistBirth" class="form-control mb-2 artistBirth"  placeholder="${formattedBirthDate}" value="${formattedBirthDate}" pattern="\d{4}-\d{2}-\d{2}">

						                    <textarea class="form-control artistIntro" placeholder="소개">${list.artistIntro}</textarea>
						                </div>
						            </div>
						        </div>
						    </c:forEach>
						    
						</div>

                    </div>
                 
                    
                    <!-- 오른쪽 섹션 끝 -->
                    
                </div>
                <!-- 버튼 섹션 시작 -->
                <div class="buttonz">
                    <button type="button" id="addBtn" value="${name}">수정하기</button>
                     <button type="button" id="listBtn">목록</button>
                </div>
                <!-- 버튼 섹션 끝 -->
                <sec:csrfInput/>
            </form>
        </div>
    </div>
</div>
	<script src="${pageContext.request.contextPath }/resources/js1/bootstrap.min.js"></script>
<script>
var header = "";
var token = "";
header = $("meta[name='_csrf_header']").attr("content");
token = $("meta[name='_csrf']").attr("content");
var userList = [];
$.ajax({
    url: '/entertain/artist/profile/getArtistList.do',
    type: 'GET', 
    dataType: 'json', 
    beforeSend: function(xhr){
    	xhr.setRequestHeader(header, token);
    },
    success: function(data) {
        console.log("Raw data from server:", data); 
        
        userList = data.map(function(user) {
            return {
                userNo: user.userNo, 
                userName: user.userName,
                userId: user.userId
        	}
        });

        console.log("Processed userList:", userList);
        
    },
    error: function(xhr, status, error) {
        console.error("Error fetching data: ", status, error);
    }
});
</script>




<script>
function addMember() {
	
	
    var memberCount = document.querySelectorAll('#memberAccordion .card').length;
    var newMemberNumber = memberCount + 1;

    var cardDiv = document.createElement('div');
    cardDiv.className = 'card';

    var cardHeaderDiv = document.createElement('div');
    cardHeaderDiv.className = 'card-header';
    cardHeaderDiv.id = 'heading' + newMemberNumber;

    var h5 = document.createElement('h5');
    h5.className = 'mb-0';

    var button = document.createElement('button');
    button.className = 'btn btn-link collapsed';
    button.type = 'button';
    button.setAttribute('data-toggle', 'collapse');
    button.setAttribute('data-target', '#collapse' + newMemberNumber);
    button.setAttribute('aria-expanded', 'false');
    button.setAttribute('aria-controls', 'collapse' + newMemberNumber);
    button.textContent = '새 멤버';
    

    var collapseDiv = document.createElement('div');
    collapseDiv.id = 'collapse' + newMemberNumber;
    collapseDiv.className = 'collapse';
    collapseDiv.setAttribute('aria-labelledby', 'heading' + newMemberNumber);
    collapseDiv.setAttribute('data-parent', '#memberAccordion');

    var cardBodyDiv = document.createElement('div');
    cardBodyDiv.className = 'card-body';

    // 셀렉트 박스 생성
    var selectUser = document.createElement('select');
    selectUser.className = 'form-control mb-2';
    selectUser.id = 'userName' + newMemberNumber; // 고유 ID 설정

    // "유저 선택" 기본 옵션 추가
    var defaultOption = document.createElement('option');
    defaultOption.textContent = '유저 이름 선택';
    defaultOption.value = '';
    selectUser.appendChild(defaultOption);

    // userList를 이용하여 셀렉트 박스 옵션 추가
    userList.forEach(function(user) {
        var option = document.createElement('option');
        option.value = user.userNo;
        console.log("user.userNo",user.userNo);
        option.textContent = user.userId + '(' + user.userName + ')'; // userNo와 userName을 문자열 연결로 조합
        selectUser.appendChild(option);
    });

    // 셀렉트 박스를 카드 바디에 추가
    cardBodyDiv.appendChild(selectUser);
    
    var closeButton = document.createElement('button');
    closeButton.className = 'btn btn-danger';
    closeButton.type = 'button';
    closeButton.textContent = 'X'; // 닫기 버튼 표시
    closeButton.style.float = 'right'; // 닫기 버튼을 오른쪽으로 정렬

    // 닫기 버튼 클릭 이벤트 핸들러
    closeButton.onclick = function() {
        document.getElementById('memberAccordion').removeChild(cardDiv);
    };

    cardHeaderDiv.appendChild(closeButton); // 닫기 버튼을 카드 헤더에 추가
	
    var inputName = document.createElement('input');
    inputName.type = 'text';
    inputName.className = 'form-control mb-2 artistFakename';
    inputName.placeholder = '멤버명';
    inputName.id = 'artistFakename' + newMemberNumber;


    var inputBirth = document.createElement('input');
    inputBirth.type = 'text';
    inputBirth.className = 'form-control mb-2 artistBirth';
    inputBirth.placeholder = '출생일';
    inputBirth.id = 'artistBirth' + newMemberNumber; // 고유 ID 생성

    // inputBirth를 cardBodyDiv에 추가
    cardBodyDiv.appendChild(inputBirth);

    // 여기서 inputBirth 요소에 flatpickr 적용
    flatpickr(inputBirth, {
        dateFormat: "Y-m-d",
        "locale": "ko" // 한국어 설정
    });


  	
  

    var textarea = document.createElement('textarea');
    textarea.className = 'form-control artistIntro';
    textarea.placeholder = '소개';
    textarea.id = 'artistIntro' + newMemberNumber;
    
    var addButton = document.createElement('button');
    addButton.className = 'btn btn-primary';
    addButton.type = 'button';
    addButton.textContent = '추가하기';
    addButton.id = 'addButton' + newMemberNumber; // 고유 ID 설정
	
    document.body.appendChild(inputBirth);
    var agId = $('#agId').val();
   
    
    // "추가하기" 버튼 클릭 이벤트 핸들러
    addButton.onclick = function() {
	var artistFakename = document.getElementById('artistFakename' + newMemberNumber).value;
    var artistBirth = document.getElementById('artistBirth' + newMemberNumber).value;
    var artistIntro = document.getElementById('artistIntro' + newMemberNumber).value;
    var selectedUserNo = selectUser.value; // 선택된 userNo 가져오기
    if (!selectedUserNo) {
        alert('유저를 선택해주세요.');
        return;
    }

    // $.ajax를 사용하여 서버에 POST 요청 보내기
    $.ajax({
        url: '/entertain/artist/profile/memberInsert.do', // 요청을 보낼 URL
        type: 'POST', // HTTP 요청 방식
        beforeSend: function(xhr){
        	xhr.setRequestHeader(header, token);
        },
        data: {
            userNo: selectedUserNo,
            artistFakename: artistFakename,
            artistBirth: artistBirth,
            artistIntro: artistIntro,
            agId: agId
        }, // 서버로 보낼 데이터
        success: function(response) {
            // 요청 처리 성공 시
           Swal.fire({
		
			  icon: "success",
			  title: "멤버가 추가되었습니다.",
			  showConfirmButton: false,
			  timer: 1500
			});
            window.location.reload();
        },
        error: function(xhr, status, error) {
            // 요청 처리 실패 시
        	Swal.fire({
        		
  			  icon: "error",
  			  title: "멤버추가중 오류가 발생했습니다.",
  			  showConfirmButton: false,
  			  timer: 1500
  			});
        }
    });

};

    // "추가하기" 버튼을 카드 바디에 추가

    cardBodyDiv.appendChild(inputName);
    cardBodyDiv.appendChild(inputBirth);
    cardBodyDiv.appendChild(textarea);
    cardBodyDiv.appendChild(addButton);

    collapseDiv.appendChild(cardBodyDiv);

    h5.appendChild(button);

    cardHeaderDiv.appendChild(h5);

    cardDiv.appendChild(cardHeaderDiv);
    cardDiv.appendChild(collapseDiv);

    document.getElementById('memberAccordion').appendChild(cardDiv);
}


// "멤버 추가하기" 버튼에 클릭 이벤트 리스너 추가
document.getElementById('addMemberBtn').addEventListener('click', addMember);
</script>




<script>
$(function(){
	$('#addBtn').click(function(event) {
	    event.preventDefault();

			    var formData = new FormData();
			    // 멤버 정보를 순회하며 수집
					$('.card').each(function(index, card) {
			    var artistFakename = $(card).find('.artistFakename').val();
			    var artistBirth = $(card).find('.artistBirth').val();
			    var artistIntro = $(card).find('.artistIntro').val();
			    var userPhoto = $(card).find('.userPhoto')[0].files[0]; // 이미지 파일
			    var userNo = $(card).find('.btn-danger').data('user-no'); // 'data-user-no' 값을 가져옴
			    
			    formData.append('artistFakename[]', artistFakename);
			    formData.append('artistBirth[]', artistBirth);
			    formData.append('artistIntro[]', artistIntro);
			    formData.append('userNo[]', userNo);
			
			    if (userPhoto) {
			        formData.append('userPhoto[]', userPhoto, userPhoto.name);
			        formData.append('userPhotoExists[]', true); // 파일이 존재하는 경우
			    } else {
			        formData.append('userPhoto[]', new Blob(), 'empty.txt'); // 빈 파일을 대신 전송
			        formData.append('userPhotoExists[]', false); // 파일이 존재하지 않는 경우
			    }
			});

			
			
			   for (var pair of formData.entries()) {
		        console.log(pair[0]+ ', ' + pair[1]); 
		    }
			   	var agId = $('#agId').val(); // 가정: .agId 클래스를 가진 요소에서 agId 값을 가져옴
			    var agName = $('#agName').val(); // 추가 정보
			    var agDate = $('#agDate').val();
				 if (!agDate) {
			     var placeholder = $('#agDate').attr('placeholder');
			     $('#agDate').val(placeholder);
			 }
			    

			    var agIntro = $('#agIntro').val(); // 추가 정보
			    var agPhoto = $('#agPhoto')[0].files[0]; // 첫 번째 선택된 파일
			
			    formData.append('agId', agId);
				formData.append('agName', agName);
				formData.append('agDate', agDate);
				formData.append('agIntro', agIntro);
				if (agPhoto) {
				    formData.append('agPhoto', agPhoto, agPhoto.name);
				}
				console.log("agId: ", agId);
				console.log("agName: ", agName);
				console.log("agDate: ", agDate);
				console.log("agIntro: ", agIntro);
				if(agPhoto !== undefined) {
				    console.log("agPhoto: ", agPhoto.name); // 파일이 있을 경우 파일의 이름을 출력
				} else {
				    console.log("agPhoto: undefined");
				}

		
		
	    $.ajax({
	        url: '/entertain/artist/profile/update.do',
	        type: 'post',
	        data: formData,
	        processData: false, 
	        contentType: false, 
	        beforeSend: function(xhr){
	        	xhr.setRequestHeader(header, token);
	        },
	        success: function(data) {
	        	Swal.fire(
	      			  '수정 성공',
	      			  '수정에 성공하였습니다.',
	      			  'success'
	      			).then((result) => {
	      	            if (result.value) {
	      	                window.location.href = "/entertain/artist/profile/artistDetail.do?agId=" + agId +'#2'; 
	      	            }
	      	        });
	        },
	        error: function(xhr, status, error) {
	            console.error("실패:", error);
	        }
	    });
	});
});

</script>
<script>
    flatpickr("#agDate", {
    	  dateFormat: "Y-m-d",
          "locale": "ko" // 한국어 설정
    });
    flatpickr("#artistBirth", {
    	  dateFormat: "Y-m-d",
          "locale": "ko" // 한국어 설정
    });
</script>

<script type="text/javascript">
	$(function () {
		var file = null;
		var agPhoto = $("#agPhoto");
		agPhoto.on("change", function (event) {
			file = event.target.files[0];
			
			if(isimgFile(file)){
				var reader = new FileReader();
				reader.onload = function (e) {
					$("#thumimg").attr("src", e.target.result);
				}
				reader.readAsDataURL(file);
			}else {
				alert("이미지 파일만 등록 가능합니다.");
			}
		});
		function isimgFile(file) {
			var ext = file.name.split(".").pop().toLowerCase(); 
			return ($.inArray(ext,["jpg","jpeg","png", "gif"]) === -1) ? false : true;
		}
		
	});
	
</script>
<script type="text/javascript">
	$(function () {
		var file = null;
		var userPhoto = $("#userPhoto");
		userPhoto.on("change", function (event) {
			file = event.target.files[0];
			
			if(isimgFile(file)){
				var reader = new FileReader();
				reader.onload = function (e) {
					$("#thumimg2").attr("src", e.target.result);
				}
				reader.readAsDataURL(file);
			}else {
				alert("이미지 파일만 등록 가능합니다.");
			}
		});
		function isimgFile(file) {
			var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
			return ($.inArray(ext,["jpg","jpeg","png", "gif"]) === -1) ? false : true;
		}
		
	});
	
</script>

<script>
	function confirmDelete(buttonElement) {
		var userNo = buttonElement.getAttribute('data-user-no');
		console.log(userNo);
	    Swal.fire({
	        title: '아티스트를 삭제하시겠습니까?',
	        text: "삭제하시면 다시 복구시킬 수 없습니다.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            deleteMember(buttonElement, userNo);
	            } else if (result.dismiss === Swal.DismissReason.cancel) {
	            Swal.fire(
	                '작업 취소',
	                '취소되었습니다.',
	                'info'
	            );
	        }
	    });
	}a

	function deleteMember(buttonElement, userNo) {
		console.log("userNo값",userNo);
	    $.ajax({
	        url: '/entertain/artist/profile/memberDelete.do?userNo='+userNo, 
	        type: 'POST', 
	        contentType: 'application/json',
	        beforeSend: function(xhr){
	        	xhr.setRequestHeader(header, token);
	        },
	        data: JSON.stringify({ userNo: userNo }),
	        success: function(response) {
	            // 성공적으로 삭제되었다면, UI에서 해당 .card 요소를 제거
	            const cardElement = buttonElement.closest('.card');
	            if (cardElement) {
	                cardElement.remove();
	            }
	            
	            Swal.fire(
	                '삭제 완료!',
	                '해당 게시물이 성공적으로 삭제되었습니다.',
	                'success'
	            );
	        },
	        error: function(xhr, status, error) {
	            Swal.fire(
	                '삭제 실패!',
	                '오류가 발생하여 삭제할 수 없습니다.',
	                'error'
	            );
	        }
	    });
	}
	
</script>
<script>
$(document).ready(function(){
    $('#listBtn').click(function(){
      var agId = $('#agId').val();
      window.location.href = "/entertain/artist/profile/artistDetail.do?agId=" + agId +'#2';
    });
  });

</script>



