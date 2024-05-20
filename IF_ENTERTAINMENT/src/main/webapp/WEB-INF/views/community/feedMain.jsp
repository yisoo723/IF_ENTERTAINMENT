<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
	#popInput {
		position: relative;
	    left: 5px;
	    top: 2px;
	}
	.popupFooter {
		position: relative;
		left: 285px;
	}
	#popupTitle {
		font-size: larger;
		font-weight: bolder;
	}
	.modal-dialog {
	    max-width: 800px;
	    margin: 6.75rem auto;
	}
	#modalBtn {
		border-radius: 25px;
	}
	.modal-body{
		/* min-height: 500px; */
		max-height: 700px;
		overflow-y: auto;
	}
	.sqTitles{
		font-size: x-large;
	}
	.sqTypes{
		font-size: smaller;
		color: gray;
		font-size: 16px;
	}
	.options {
		position: relative;
		bottom: 4px;
		line-height: 27px;
		font-size: 18px;
	}
	.widget {
		background-color: aliceblue;
		margin: 10px 0;
		padding: 20px;
	}
	.nav-list {
		display: none;
	}
	
	.background-gradient {
		display: none;
	}
	
	.img-fluid, .slick-slide-item {
		height: 140px; 
		width: 380px;
 		object-fit: cover;
	}
	.img-fluid{
		object-fit: cover;
	}
	
	.pod-caro1, .pod-caro2, .pod-caro3 {
    display: inline-block;
    width: 160%;
    position: relative;
    margin-left: -390px;
    margin-bottom: 30px;
    object-fit: cover;
	}
	.c-form > div label {
		margin-bottom: 25px;
	}
</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.userId" var="idInfo"/>
</sec:authorize>
<%-- <h1>${userNo }</h1> --%>
<div class="pod-featurs">
	<div class="pod-caro1">
		<div class="slick-slide-item">
			<a href="#" title=""> <img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_1.jpg"
				class="img-fluid" style="width: 340px;">
			</a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""> <img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_2.jpg"
				class="img-fluid" style="width: 340px;">
			</a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_3.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_4.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_5.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_6.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_7.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
	</div>
	<div class="pod-caro2">
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_8.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_9.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_10.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_11.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>

		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_12.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>

		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_13.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_14.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
	</div>
	<div class="pod-caro3">
		<div class="slick-slide-item">
			<a href="#" title="">
				<img src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_15.jpg"
				class="img-fluid" style="width: 340px;">
			</a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_16.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_17.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_18.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_19.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_20.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
		<div class="slick-slide-item">
			<a href="#" title=""><img
				src="${pageContext.request.contextPath }/resources/mainArtImg/feedMain_21.jpg"
				class="img-fluid" style="width: 340px;"></a>
		</div>
	</div>
</div>

<c:if test="${not empty idInfo}">
    <div class="central-meta" style="margin-bottom: 50px; border:none;">
        <div class="row remove-ext-40">
            <c:if test="${not empty mycommunityList}">
                <div class="col-lg-12">
                    <h3 style="margin-bottom:20px;">💜 내가 가입한 커뮤니티</h3>
                </div>
                <c:forEach items="${mycommunityList}" var="mycommunity" varStatus="idx">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="game-box">
                            <div class="memberships" style="width:100%; height: 250px;">
                                <a href="#" title="" class="myimage-link" data-artist-id="${mycommunity.agId}" style="position: relative;">
                                    <img src="${pageContext.request.contextPath}/resources/artImg/${mycommunity.agProfile}"
                                         style="width: 100%; height: 250px; object-fit: cover;">
                                </a>
                            </div>
                            <div class="game-meta">
                                <h5><a href="#" title="">${mycommunity.agId}</a></h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>    
</c:if>

 
<div class="central-meta" style="margin-bottom: 50px; border:none;">
    <div class="row remove-ext-40">
        <div class="col-lg-12">
            <h3 style="margin-bottom:20px;">💜 새로운 아티스트들을 만나보세요 ! </h3>
        </div>
        <c:forEach items="${artistList}" var="artistGroup" varStatus="loop">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="game-box">
                    <figure class="image-container">
                        <a href="#" title="" class="image-link" data-artist-id="${artistGroup.agId}" style="position: relative;">
                            <img src="${pageContext.request.contextPath }/resources/artImg/${artistGroup.agProfile}" alt="Artist Profile" style="width: 100%; height: 250px; object-fit: cover;">
                        </a>
                        <div class="join-button" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); opacity: 0;"><i class="fa fa-plus-square"></i>가입하기</div>
                    </figure>
                    <div class="game-meta">
                        <h5><a href="#" title="" style="font-size: 23px; font-weight: bold;">${artistGroup.agId}</a></h5>
                    </div>
                </div>
            </div>
            <c:if test="${loop.index % 4 == 3}">
                <div class="w-100"></div> 
            </c:if>
        </c:forEach>
    </div>
</div>


<!-- 설문조사 팝업 모달시작 -->
<c:if test="${not empty surveyPopupForm && not empty userVO}">
	<div class="popup-wraper2" id="surveyPopup">
		<div class="popup post-sharing">
			<span class="popup-closed"><i class="ti-close"></i></span>
			<div class="popup-meta">
				<div class="popup-head">
					<div id="popupTitle">${surveyPopupForm.sfTitle }</div>
				</div>
				<div class="postbox">
					<figure><img src="${surveyPopupForm.sfPhoto }" id="surveyImg" data-svidx="${surveyPopupForm.sfNo }"></figure>
					<div class="we-video-info">
						<div class="popupFooter">
							<span id="denyPopup">오늘하루 보지않기</span><input id="popInput" name="today_close1" type="checkbox">
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</c:if>
<!-- 설문조사 팝업 모달끝 -->

<!-- 설문지 모달 -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- 모달 헤더 -->
			<div class="modal-header">
				<h4 class="modal-title" style="font-size: 30px;">${surveyPopupForm.sfTitle }</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<!-- 모달 바디 -->
			<div class="modal-body" style="padding: 20px 50px;">
				<form class="c-form search" action="/community/survey/conductSurvey.do?sfNo=${surveyPopupForm.sfNo }" method="post" id="surveyConductForm">
					<c:forEach items="${surveyPopupForm.surveyQuestionList }" var="question" varStatus="qvs">
						<div class="widget">
							<input type="hidden" name="surveyResultList[${qvs.index }].sqNo" value="${question.sqNo }">
							<div>
								<label> 
									<span class="sqTitles">${question.sqTitle }</span>
									<span class="sqTypes"><c:if test="${question.sqType eq 'checkbox' }">(중복선택 가능)</c:if></span>
								</label>
								<div class="form-radio">
									<c:forEach items="${question.optionList }" var="option" varStatus="ovs">
										<div class="radio">
											<label> 
												<input type="${question.sqType }" class="optionInputs" value="${option.soNo }" name="surveyResultList[${qvs.index }].srAnswer">
												<i class="check-box"></i> 
												<span class="options">${option.soContent }</span>
											</label>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:forEach>
					<sec:csrfInput/>
				</form>
			</div>
			<!-- 모달 푸터 -->
			<div class="modal-footer">
				<button type="button" id="modalBtn" class="btn btn-primary" data-dismiss="modal">제출하기</button>
			</div>
		</div>
	</div>
</div>
<!-- 설문지 모달 끝 -->


<script type="text/javascript">
var header = "";
var token = "";
$(function () {
	// 시큐리티 적용 시, header 키 값과 토큰을 설정 
	// (동적 페이지마다 전역변수로 설정된 header, token을 가져다 쓸 수 있다)
	header = $("meta[name='_csrf_header']").attr("content");
	token = $("meta[name='_csrf']").attr("content");
	
	$(".myimage-link").on("click", function () {
		var agId = $(this).data("artist-id");
		window.location.href = "/community/artist?agId=" + agId;
	});
	
    $(".image-link").click(function () {
        var agId = $(this).data("artist-id"); 
        console.log("######", agId);
        window.location.href = "/community/artist?agId=" + agId;
    });
    
    // 설문 팝업 오늘하루 보지않기 기능구현
    var surveyPopup = getCookie('surveyPopup');
    
    // 변수가 없을 경우 팝업 출력
    if(!surveyPopup){
    	console.log("쿠키가 없네요");
    	popUpAction('surveyPopup');
    }

	// 쿠키 설정
	function getCookie(name){
		var nameOfCookie = name + "=";
		var x = 0;
		while(x <= document.cookie.length){
			var y = (x + nameOfCookie.length);
			
			if(document.cookie.substring(x, y) == nameOfCookie){
				if((endOfCookie = document.cookie.indexOf(";", y)) == -1)
					endOfCookie = document.cookie.length;
				return unescape(document.cookie.substring(y, endOfCookie));
			}
			
			x = document.cookie.indexOf(" ", x) + 1;
			
			if(x == 0)break;
		}
		return "";
	}

	// expiredays 후의 클릭한 시간까지 쿠키 설정
	function setCookie24(name, value, expiredays){
		var todayDate = new Date();
		
		todayDate.setDate(todayDate.getDate() + expiredays);
	
	    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
	
	//00:00 시 기준 쿠키 설정하기 // expiredays 의 새벽 00:00:00 까지 쿠키 설정 
	function setCookie00(name, value, expiredays) {
	    var todayDate = new Date(); todayDate = new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);
	
	    if (todayDate > new Date()) {
	        expiredays = expiredays - 1;
	    }
	
	    todayDate.setDate(todayDate.getDate() + expiredays);
	
	    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
	
	// 팝업출력
	function popUpAction(name) {
	    // name으로 해당 팝업창 열기 
	    $("#surveyPopup").addClass('active').css("background", "rgba(0, 0, 0, 0.4) none repeat scroll 0 0");
	    
	    setTimeout(() => {
	    	var popup = $("div[name=" + name + "]");
	    	$(popup[1]).css("display", "none");
		}, 8);
	    
	}
	
	// 닫기버튼 클릭 이벤트 
    $('#popInput').on("click", function () {
    	$('.popup-wraper2').removeClass('active');

        // 오늘하루 보지않기 체크 확인 
        if ($("input:checkbox[name=today_close1]").is(":checked") == true) {
            setCookie00('surveyPopup', "done", 1); // 쿠키 설정
            console.log("오늘 하루 보지않기 체크가 정상적으로 확인되었음");
        }
    });
	
	// 이미지를 클릭했을 때 설문지 모달을 띄운다.
	$("#surveyImg").on("click", function(){
		$('.popup-wraper2').removeClass('active');
		var sfNo = $(this).data("svidx");
		$("#myModal").modal();
	});
	
	// 설문지 모달 버튼 클릭 이벤트 핸들러
	$("#modalBtn").on("click", function(){
		$("#surveyConductForm").submit(); // 설문지 제출
	});

}); // $(function) 종료



</script>








