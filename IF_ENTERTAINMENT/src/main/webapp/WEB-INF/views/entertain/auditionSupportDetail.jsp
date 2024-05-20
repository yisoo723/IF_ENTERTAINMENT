<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
	<div class="create-post detail_title_box">
		<div>지원내역 </div>
	</div>
	
	<div class="checkout-meta">
		<form action="/entertain/audition/auditionSupportDetail.do" method="post" class="c-form" id="registerForm" enctype="multipart/form-data">
			<div class="row">
				<div class="col-lg-12 col-sm-12">
					<label>제목<span>*</span></label>
					<input type="text" id="arTitle" name="arTitle" placeholder="제목" value="${auditionRegisterVO.arTitle }" disabled="disabled">
				</div>
				<div class="col-lg-6 col-sm-12">
					<label>지원분야<span>*</span></label>
					<select class="mb-2" id="arCategory" name="arCategory" disabled="disabled">
						<option value="">선택</option>
					        <option value="랩" ${auditionRegisterVO.arCategory == "랩" ? "selected" : ""}>랩</option>
					        <option value="보컬" ${auditionRegisterVO.arCategory == "보컬" ? "selected" : ""}>보컬</option>
					        <option value="댄스" ${auditionRegisterVO.arCategory == "댄스" ? "selected" : ""}>댄스</option>
					        <option value="작곡" ${auditionRegisterVO.arCategory == "작곡" ? "selected" : ""}>작곡</option>
					</select>
				</div>
				<div class="col-lg-6 col-sm-12">
				    <label>국적<span>*</span></label>
				    <select class="mb-2" id="nationName" name="arNation" disabled="disabled">
				        <option value="${auditionRegisterVO.arNation }">선택</option>
				        <c:forEach items="${nationList }" var="nation">
				            <option value="${nation.nationName }" ${auditionRegisterVO.arNation eq nation.nationName ? 'selected' : ''}>${nation.nationName }</option>
				        </c:forEach>
				    </select>
				</div>
				<div class="col-lg-6 col-sm-12">
					<label>비밀번호<span>*</span></label>
					<input type="password" id="arPw" name="arPw" placeholder="" disabled="disabled">
				</div>
				<div class="col-lg-6 col-sm-12">
					<label>비밀번호 확인<span>*</span></label>
					<input type="password" id="arPw1" name="arPw1" placeholder="" value="${auditionRegisterVO.arPw1 }" disabled="disabled">
				</div>
				<div class="col-lg-6 col-sm-12">
					<label>이름<span>*</span></label>
					<input type="text" id="arName" name="arName" placeholder="이름" value="${auditionRegisterVO.arName }" disabled="disabled">
				</div>
				<div class="col-lg-6 col-sm-12">
					<label>성별<span>*</span></label>
					<div class="gender_box form-radio">
						<div class="gender_male radio">
							<label>
								<span>남자</span>
								<input type="radio" id="arGenderMale" name="arGender" value="M"${auditionRegisterVO.arGender eq 'M' ? 'checked' : ''} disabled="disabled"><i class="check-box"></i>
							</label>
						</div>
						<div class="gender_female radio">
							<label>
								<span>여자</span>
								<input type="radio" id="arGenderFemale" name="arGender" value="F"${auditionRegisterVO.arGender eq 'F' ? 'checked' : ''} disabled="disabled"><i class="check-box"></i>
							</label>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-12">
					<label>생년월일<span>*</span></label>
					<input type="date" id="arBirth" name="arBirth" value="${auditionRegisterVO.arBirth }" disabled="disabled">
				</div>
				<div class="col-lg-2 col-sm-12 cm_kg_box">
					<label>신장<span>*</span> / 체중<span>*</span></label>
					<div class="cm_box">
						<input type="text" id="arHeight" name="arHeight" placeholder="신장" value="${auditionRegisterVO.arHeight }" disabled="disabled">
						<span>cm</span>
					</div>
				</div>
				<div class="col-lg-2 col-sm-12">
					<div class="kg_box">
						<input type="text" id="arWeight" name="arWeight" placeholder="체중" value="${auditionRegisterVO.arWeight }" disabled="disabled">
						<span>kg</span>
					</div>
				</div>
				<div class="col-lg-6 col-sm-12">
					<label>연락처<span>*</span></label>
					<input type="text" id="arTelno" name="arTelno" placeholder="연락처(010-0000-0000)" value="${auditionRegisterVO.arTelno }" disabled="disabled">
				</div>
				<div class="col-lg-6 col-sm-12">
					<label>이메일<span>*</span></label>
					<input type="text" id="arEmail" name="arEmail" placeholder="이메일" value="${auditionRegisterVO.arEmail }" disabled="disabled">
				</div>
				<div class="col-lg-6 col-sm-12">
					<label>학력(선택)</label>
					<input type="text" id="arEducation" name="arEducation" placeholder="" value="${auditionRegisterVO.arEducation }" disabled="disabled">
				</div>
				<div class="col-lg-6 col-sm-12">
					<label>경력(선택)</label>
					<input type="text" id="arCareer" name="arCareer" placeholder="" value="${auditionRegisterVO.arCareer }" disabled="disabled">
				</div>
				<div class="col-lg-12 col-sm-12">
					<label>특기(선택)</label>
<!-- 					<input type="text" id="arSpecialty" name="arSpecialty" placeholder="특기"> -->
						<textarea rows="5px" cols="0px" id="arSpecialty" name="arSpecialty" placeholder="" disabled="disabled">${auditionRegisterVO.arSpecialty }</textarea>
				</div>
				<div class="col-lg-12 col-sm-12">
					<label>증명사진<span>*</span></label>
<!-- 					<input type="file" id="auditionPhotoFile" name="auditionPhotoFile"> -->
					<img src="/resources/upload/audition/photo/${auditionRegisterVO.arPhoto }" width="200px;" >
				</div>
				<div class="col-lg-12 col-sm-12">
					<label>자료영상<span>*</span></label>
<!-- 					<input type="file" id="auditionVideoFile" name="auditionVideoFile"> -->
<%-- 					<img src="/resources/upload/audition/video/${auditionRegisterVO.arVideo }"> --%>
					<video controls="controls" width="200px;">
						<source src="/resources/upload/audition/video/${auditionRegisterVO.arVideo }" type="video/mp4">
					</video>
				</div>
				<div class="agree">
					<span class="agree_title">개인정보 수집 및 이용에 대한 안내</span>
					<div class="agree_box">
						<span class="agree_content">
							IF_ENTERTAINMENT(이하 ‘회사’)는 지원자의 개인정보를 중요시하며, “정보통신망 이용촉진 및 정보보호”에 관한 법률을 준수하고 있습니다. <br>
							회사는 개인정보취급방침을 통하여 지원자께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, <br>
							개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드입니다. <br>
							회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다. <br>
							<br>
							[수집하는 개인정보 항목] <br>
							회사는 원활한 지원자 상담서비스 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다. <br>
							수집항목 : 이름, 성별, 생년월일, 휴대폰번호, 이메일 
						</span>
					</div>
				</div>
				<div class="col-lg-12 col-sm-12">
					<div class="checkbox">
					<label>
						<input type="checkbox" checked="checked" id="check" disabled="disabled"><i class="check-box"></i>
						<span>개인정보 수집 및 이용에 동의합니다.</span>
					</label>
					<span>※ 만 14세 미만 청소년의 경우 온라인 오디션 지원이 불가하므로 현장 공개 오디션을 통해 지원바랍니다. </span>
					</div>
					<div class="support_button">
						<input class="main-btn support support_register" type="button" id="modifyBtn" value="수정"> 
						
<%-- 						<input type="hidden" name="arNo" value="${auditionRegisterVO.arNo}"> --%>
						<input class="main-btn support_cancel" type="button" id="cancelBtn" data-idx="${auditionRegisterVO.arNo }" value="신청취소">
					</div>
				</div>
			</div>
			<sec:csrfInput/>
		</form>
	</div>
</body>


<script type="text/javascript">
$(function() {
	
	var registerForm = $("#registerForm");
	var modifyBtn = $("#modifyBtn");
	var cancelBtn = $("#cancelBtn");
	var cancelForm = $("#cancelForm");
	
	modifyBtn.on("click", function() {
	    Swal.fire({
	        title: '신청을 수정하시겠습니까?', 
	        text: "", 
	        icon: 'question', 
	        showCancelButton: true, // 취소 버튼 보이도록 설정
	        confirmButtonColor: '#3085d6', // 수정 버튼 색상 설정
	        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
	        confirmButtonText: '수정', // 수정 버튼 텍스트 설정
	        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
	    }).then((result) => {
	        if (result.isConfirmed) { 
	            // 수정 버튼을 눌렀을 때
	            location.href = "/entertain/audition/auditionSupportUpdate.do?arNo=${auditionRegisterVO.arNo}";
	        } else if (result.dismiss === Swal.DismissReason.cancel) {
	            // 취소 버튼을 눌렀을 때
	            Swal.fire( 
	                '작업이 취소되었습니다.', 
	                '', 
	                'info' 
	            )
	        }
	    });
	});


	
	cancelBtn.on("click", function() {
		var arNo = $(this).data("idx");
		
	    // registerForm을 서밋하도록 수정
// 	    registerForm.submit();
	    Swal.fire({
	        title: '신청을 취소하시겠습니까?', 
	        text: "취소하시면 다시 복구시킬 수 없습니다.", 
	        icon: 'warning', 
	        showCancelButton: true, // 취소 버튼 보이도록 설정
	        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
	        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
	        confirmButtonText: '확인', // 삭제 버튼 텍스트 설정
	        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
	    }).then((result) => {
	        if (result.isConfirmed) { 
	        	$.ajax({
	        		url: "/entertain/audition/cancelAudition?arNo=" + arNo,
	        		type: "get",
// 	        		beforeSend: function(xhr){
// 	        			xhr.setRequestHeader(header, token);
// 	        		},
	        		success: function(res){
	        			console.log("res : ", res);
	        			
	        			if(res == 'OK'){
	        				Swal.fire({
	        					  icon: "success",
	        					  title: "취소가 완료되었습니다.",
	        					  showConfirmButton: false,
	        					  timer: 1500
	        					});
       			            setTimeout(() => {
	       			         	location.href="/entertain/audition/auditionSupportCheckForm.do";
							}, 1501);
	        			}
	        			
	        		}
	        	});
	         
	        } else if (result.dismiss === Swal.DismissReason.cancel) { // 취소 버튼을 눌렀을 때
	            // "취소" 버튼을 눌렀을 때
	            Swal.fire( 
	                '작업이 취소되었습니다.', 
	                '', 
	                'info' 
	            );
	        }
	    });
	});

	
});
</script>
</html>