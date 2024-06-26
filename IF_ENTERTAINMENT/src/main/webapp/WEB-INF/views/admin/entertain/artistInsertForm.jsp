<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>





<div class="gap no-gap">
    <c:set value="등록" var="name"/>
    <c:if test="${status eq 'u' }">
        <c:set value="수정" var="name"/>
    </c:if>
    <div class="inner-bg">
        <div class="element-title">
            <h2>상품등록</h2>
        </div>
        <div class="add-prod-from">
            <form method="post" action="/entertain/artist/profile/insert.do" id="artistForm" enctype="multipart/form-data">
                <c:if test="${status eq 'u' }">
                    <input type="hidden" name="goodsNo" value="">
                </c:if>
                <div class="row row-addproduct">
                    <!-- 왼쪽 섹션 시작 -->
                    <div class="col-md-4">
                        <div class="addproduct-title">
                            <span>그룹명(영문)</span>
                        </div>
                        <input type="text" id="agId" name="agId" value="">
                        
                        <div class="addproduct-title">
                            <span>그룹명(한글)</span>
                        </div>
                        <input type="text" id="agName" name="agName" value="">
                        
                        <div class="addproduct-title">
                            <span>데뷔일</span>
                        </div>
                        <input type="text" id="agDate" name="agDate" placeholder="데뷔일 선택">
                        
                        <div class="addproduct-title">
                            <span>그룹소개</span>
                        </div>
                        <textarea class="form-control" id="agIntro" name="agIntro">${prod.goodsQuantity}</textarea>
                        
                        <div class="addproduct-title">
                            <span>그룹 프로필 사진</span>
                        </div>
                        <label class="fileContainer">
                            <span>찾아보기</span>
                            <input type="file" id="agPhoto" name="agPhoto" multiple="multiple" />
                        </label>
                        <div class="proddetailimg-box">
                            <img id="detailimg" alt="" src="">
                        </div>
                        <c:if test="${status eq 'u'}">
                            <c:if test="${not empty prod.goodsFileList}">
                                <c:forEach items="${prod.goodsFileList}" var="prodFile">
                                    <div class="proddetailimg-box">
                                        <img id="detailimg" alt="" src="${prodFile.gaDetailimg}">
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if>
                    </div>
                    <!-- 왼쪽 섹션 끝 -->
                    
                    <!-- 오른쪽 섹션 시작 (비워둠) -->
                    <div class="col-md-4">
                        <div id="memberAccordion">
                            <!-- 멤버 1 -->
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            멤버 1
                                        </button>
                                    </h5>
                                </div>

                              <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#memberAccordion">
								    <div class="card-body irFile">
								        <!-- 새로 추가할 셀렉트 박스 -->
								        <select id="userName" class="form-control mb-2">
								            <option value="">유저 이름 선택</option>
								            <c:forEach var="user" items="${userList}">
								                <option value="${user.userNo}">${user.userId}(${user.userName})</option>
								            </c:forEach>
								        </select>
								        <!-- 기존 코드 -->
								        <input type="text" id="artistFakename" class="form-control mb-2 artistFakename" placeholder="멤버명">
								        <input type="file" id="userProfile" class="form-control-file mb-2 userProfile">
								        <input type="text" id="artistBirth" class="form-control mb-2 artistBirth" placeholder="출생일">
								        <textarea class="form-control artistIntro" id="artistIntro" placeholder="소개"></textarea>
								    </div>
								</div>

                            </div>
                            <!-- 멤버 2, 3, 4 등은 위와 같은 방식으로 추가합니다. -->
                        </div>
                    </div>
                    <button type="button" id="addMemberBtn">멤버 추가하기</button>
                    
                    <!-- 오른쪽 섹션 끝 -->
                    
                </div>
                <!-- 버튼 섹션 시작 -->
                <div class="buttonz">
                    <button type="button" id="addBtn" value="${name}">등록하기</button>
                    <c:if test="${status ne 'u'}">
                         <button type="button" id="listBtn">목록</button>
                    </c:if>
                    <c:if test="${status eq 'u'}">
                        <button type="button" id="cancelBtn">등록취소</button>
                    </c:if>
                </div>
                <sec:csrfInput/>
            </form>
        </div>
    </div>
</div>
<script>
var userList = null;
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
        option.textContent = user.userId + '(' + user.userName + ')'; // userNo와 userName을 문자열 연결로 조합
        selectUser.appendChild(option);
    });

    // 셀렉트 박스를 카드 바디에 추가
    cardBodyDiv.appendChild(selectUser);

    var inputName = document.createElement('input');
    inputName.type = 'text';
    inputName.className = 'form-control mb-2 artistFakename';
    inputName.placeholder = '멤버명';
    inputName.id = 'artistFakename' + newMemberNumber;

    var inputFile = document.createElement('input');
    inputFile.type = 'file';
    inputFile.className = 'form-control-file mb-2 userProfile';
    inputFile.id = 'userProfile' + newMemberNumber;

    var inputBirth = document.createElement('input');
    inputBirth.type = 'text';
    inputBirth.className = 'form-control mb-2 artistBirth';
    inputBirth.placeholder = '출생일';
    inputBirth.id = 'artistBirth' + newMemberNumber;

    var textarea = document.createElement('textarea');
    textarea.className = 'form-control artistIntro';
    textarea.placeholder = '소개';
    textarea.id = 'artistIntro' + newMemberNumber;

    cardBodyDiv.appendChild(inputName);
    cardBodyDiv.appendChild(inputFile);
    cardBodyDiv.appendChild(inputBirth);
    cardBodyDiv.appendChild(textarea);

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
$('#addBtn').click(function(e) {
    e.preventDefault(); // 폼의 기본 제출 동작을 막습니다.

    var formData = new FormData();
    
    // 멤버 정보를 순회하며 수집
		$('.card').each(function(index, card) {
		    var artistFakename = $(card).find('.artistFakename').val();
		    var artistBirth = $(card).find('.artistBirth').val();
		    var artistIntro = $(card).find('.artistIntro').val();
		    var userProfile = $(card).find('.userProfile')[0].files[0]; // 이미지 파일
		    var userNo = $(card).find('select').val(); // 셀렉트 박스에서 선택된 userNo를 가져옵니다.
		  
		    
		    formData.append('artistFakename[]', artistFakename);
		    formData.append('artistBirth[]', artistBirth);
		    formData.append('artistIntro[]', artistIntro);
		    formData.append('userNo[]', userNo); // 셀렉트 박스에서 선택된 userNo도 formData에 추가합니다.
		    
		    if (userProfile) {
		        formData.append('userProfile[]', userProfile, userProfile.name);
		    }
		});
		
		
	   for (var pair of formData.entries()) {
        console.log(pair[0]+ ', ' + pair[1]); 
    }
	   var agId = $('#agId').val(); // 가정: .agId 클래스를 가진 요소에서 agId 값을 가져옴
	    var agName = $('#agName').val(); // 추가 정보
	    var agDate = $('#agDate').val(); // 가정: .agDate 클래스를 가진 요소에서 agDate 값을 가져옴
	    var agIntro = $('#agIntro').val(); // 추가 정보
	    var agPhoto = $('#agPhoto')[0].files[0]; // 첫 번째 선택된 파일

	
	    formData.append('agId', agId);
		formData.append('agName', agName);
		formData.append('agDate', agDate);
		formData.append('agIntro', agIntro);
		formData.append('agPhoto', agPhoto);
		
	console.log("agPhoto값",agPhoto);

    $.ajax({
        url: '/entertain/artist/profile/insert.do',
        type: 'POST',
        data: formData,
        processData: false, // jQuery가 데이터를 처리하지 않도록 설정
        contentType: false, // contentType을 false로 설정하여 jQuery가 경계 문자열을 올바르게 설정하도록 함
        beforeSend: function(xhr){
        	xhr.setRequestHeader(header, token);
        },
        success: function(data) {
            console.log("성공:", data);
            // 성공 시 추가적인 동작 구현
        },
        error: function(xhr, status, error) {
            console.error("실패:", error);
            // 실패 시 추가적인 동작 구현
        }
    });
});
</script>
<script>
    flatpickr("#agDate", {
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
    });
</script>

