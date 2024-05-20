<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<title>IF ENTERTAINMENT</title>
	<meta id="_csrf" name="_csrf" content=${_csrf.token }>
	<meta id="_csrf_header" name="_csrf_header" content=${_csrf.headerName }>
	<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/weather-icons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/toast-notification.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/page-tour.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/stories-zuck.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/color.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/company.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

	<!-- Javascript 연결 -->
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/loder.js"></script> --%>
	
	<!-- 제이쿼리 CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/alam/jsAlam.js" defer="defer"></script> --%>

</head>

<style type="text/css">
* {
	cursor: url(https://cur.cursors-4u.net/symbols/sym-7/sym646.ani),
		url(https://cur.cursors-4u.net/symbols/sym-7/sym646.gif), auto
		!important;
}

@font-face {
    font-family: 'LOTTERIACHAB';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIACHAB.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	font-family: 'GmarketSansMedium', sans-serif;
}

.gray-bg {
    float: left;
    width: 100%;
      background: none; 
}

.central-meta {
    background: none; /* 백그라운드 컬러 없애기 */
    border: none; /* 보더 없애기 */
    padding:50px;
}

body {
	font-family: 'GmarketSansMedium', sans-serif;
}

/* 기본 아이템 스타일 */
.owl-item {
	transition: transform 0.5s;
}

/* 활성화된 아이템 스타일 */
.owl-item.active.center {
	transform: scale(1.5); /* 크기를 20% 키웁니다 */
}

/* 엔터 버튼 ! */
button {
	margin: 20px;
}

.frame {
	width: 90%;
	margin: 40px auto;
	text-align: center;
}

.custom-btn {
	width: 130px;
	height: 40px;
	color: #fff;
	border-radius: 5px;
	padding: 10px 25px;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	outline: none;
}

.btn-12 {
	position: relative;
	right: 20px;
	bottom: 20px;
	border: none;
	box-shadow: none;
	width: 130px;
	height: 40px;
	line-height: 42px;
	-webkit-perspective: 230px;
	perspective: 230px;
}

.btn-12 span {
	background: rgb(0, 172, 238);
	background: linear-gradient(315deg, #1fd1f9 0%, #b621fe 64%);
	display: block;
	position: absolute;
	width: 130px;
	height: 40px;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	border-radius: 5px;
	margin: 0;
	text-align: center;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all .3s;
	transition: all .3s;
}

.btn-12 span:nth-child(1) {
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
	-webkit-transform: rotateX(90deg);
	-moz-transform: rotateX(90deg);
	transform: rotateX(90deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-12 span:nth-child(2) {
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-12:hover span:nth-child(1) {
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
}

.btn-12:hover span:nth-child(2) {
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	color: transparent;
	-webkit-transform: rotateX(-90deg);
	-moz-transform: rotateX(-90deg);
	transform: rotateX(-90deg);
}
/* 버튼 끝 */

.wavy-wraper {
    display: none;
}



</style>
<c:if test="${not empty message }">
	<script type="text/javascript">
	$(function(){
		Swal.fire({
			  icon: "success",
			  title: "${message}",
			  showConfirmButton: false,
			  timer: 1500
		});
	});
	<c:remove var="message" scope="request"/>
	<c:remove var="message" scope="session"/>
	</script>
</c:if>

<body onload="hideGoogleTranslateToolbar()">
	<div class="theme-layout">

		<!-- 헤더 영역 -->
		<tiles:insertAttribute name="header"/>

		<!-- main content 시작 -->
		<section>
			<div class="gap2 gray-bg content_box">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="row merged20" id="page-contents">

								<!-- side bar 시작 -->
								<c:set var="sideName" value="${sideName }" />
								<c:if test="${sideName eq 'company' }">
									<c:import url="./tiles/entertain/sidebar/sidebar_${sideName }.jsp" />
								</c:if>
								<c:if test="${sideName eq 'investor' }">
									<c:import url="./tiles/entertain/sidebar/sidebar_${sideName }.jsp" />
								</c:if>
								<c:if test="${sideName eq 'audition' }">
									<c:import url="./tiles/entertain/sidebar/sidebar_${sideName }.jsp" />
								</c:if>

								<!-- main content 시작 -->
								<c:choose>
									<c:when test="${sideName eq '' || sideName eq null}">
										<c:set var="cols" value="12" />
									</c:when>
									<c:otherwise>
										<c:set var="cols" value="9" />
									</c:otherwise>
								</c:choose>
								<div class="col-lg-${cols }">
									<div class="central-meta detail_area">
										<!-- 컨텐츠영역 -->
										<tiles:insertAttribute name="content"/>
									</div>
								</div>
								<!-- main content 끝 -->
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- main content 끝 -->

		<!-- 푸터 영역 -->
		<tiles:insertAttribute name="footer"/>
		
	</div>

	<div class="modal fade" id="img-comt">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-8">
							<div class="pop-image">
								<div id="demo" class="carousel slide" data-interval="false" data-ride="carousel"
									data-pause="hover">
									<!-- The slideshow -->
									<div class="pop-item">
										<div class="carousel-item active">
											<img src="images/resources/blog-detail.jpg" alt="">
										</div>
										<div class="carousel-item">
											<img src="images/resources/blog-detail2.jpg" alt="">
										</div>
										<div class="carousel-item">
											<img src="images/resources/blog2.jpg" alt="">
										</div>
									</div>

									<!-- Left and right controls -->
									<a class="carousel-control-prev" href="#demo" data-slide="prev">
										<span class="carousel-control-prev-icon"></span>
									</a>
									<a class="carousel-control-next" href="#demo" data-slide="next">
										<span class="carousel-control-next-icon"></span>
									</a>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="user">
								<figure><img src="images/resources/user1.jpg" alt=""></figure>
								<div class="user-information">
									<h4><a href="#" title="">Danile Walker</a></h4>
									<span>2 hours ago</span>
								</div>
								<a href="#" title="Follow" data-ripple="">Follow</a>
							</div>
							<div class="we-video-info">
								<ul>
									<li>
										<div title="Approvals/Disapprovals" class="likes heart">❤ <span>2K</span></div>
									</li>
									<li>
										<span title="Comments" class="comment">
											<i class="fa fa-commenting"></i>
											<ins>52</ins>
										</span>
									</li>

									<li>
										<span>
											<a title="Share" href="#" class="">
												<i class="fa fa-share-alt"></i>
											</a>
											<ins>20</ins>
										</span>
									</li>
								</ul>
								<div class="users-thumb-list">
									<a href="#" title="" data-toggle="tooltip" data-original-title="Anderw">
										<img src="images/resources/userlist-1.jpg" alt="">
									</a>
									<a href="#" title="" data-toggle="tooltip" data-original-title="frank">
										<img src="images/resources/userlist-2.jpg" alt="">
									</a>
									<a href="#" title="" data-toggle="tooltip" data-original-title="Sara">
										<img src="images/resources/userlist-3.jpg" alt="">
									</a>
									<a href="#" title="" data-toggle="tooltip" data-original-title="Amy">
										<img src="images/resources/userlist-4.jpg" alt="">
									</a>
									<span><strong>You</strong>, <b>Sarah</b> and <a title="" href="#">24+ more</a>
										liked</span>
								</div>
							</div>
							<div style="display: block;" class="coment-area">
								<ul class="we-comet">
									<li>
										<div class="comet-avatar">
											<img alt="" src="images/resources/nearly3.jpg">
										</div>
										<div class="we-comment">
											<h5><a title="" href="time-line.html">Jason borne</a></h5>
											<p>we are working for the dance and sing songs. this video is very awesome
												for the youngster. please vote this video and like our channel</p>
											<div class="inline-itms">
												<span>1 year ago</span>
												<a title="Reply" href="#" class="we-reply"><i
														class="fa fa-reply"></i></a>
												<a title="" href="#"><i
														class="fa-solid fa-circle-check"></i><span>20</span></a>
											</div>
										</div>

									</li>
									<li>
										<div class="comet-avatar">
											<img alt="" src="images/resources/comet-4.jpg">
										</div>
										<div class="we-comment">
											<h5><a title="" href="time-line.html">Sophia</a></h5>
											<p>we are working for the dance and sing songs. this video is very awesome
												for the youngster.
												<i class="em em-smiley"></i>
											</p>
											<div class="inline-itms">
												<span>1 year ago</span>
												<a title="Reply" href="#" class="we-reply"><i
														class="fa fa-reply"></i></a>
												<a title="" href="#"><i
														class="fa-solid fa-circle-check"></i><span>20</span></a>
											</div>
										</div>
									</li>
									<li>
										<div class="comet-avatar">
											<img alt="" src="images/resources/comet-4.jpg">
										</div>
										<div class="we-comment">
											<h5><a title="" href="time-line.html">Sophia</a></h5>
											<p>we are working for the dance and sing songs. this video is very awesome
												for the youngster.
												<i class="em em-smiley"></i>
											</p>
											<div class="inline-itms">
												<span>1 year ago</span>
												<a title="Reply" href="#" class="we-reply"><i
														class="fa fa-reply"></i></a>
												<a title="" href="#"><i
														class="fa-solid fa-circle-check"></i><span>20</span></a>
											</div>
										</div>
									</li>
									<li>
										<a class="showmore underline" title="" href="#">more comments+</a>
									</li>
									<li class="post-comment">
										<div class="comet-avatar">
											<img alt="" src="images/resources/nearly1.jpg">
										</div>
										<div class="post-comt-box">
											<form method="post">
												<textarea placeholder="Post your comment"></textarea>
												<div class="add-smiles">
													<div class="uploadimage">
														<i class="fa fa-image"></i>
														<label class="fileContainer">
															<input type="file">
														</label>
													</div>
													<span title="add icon" class="em em-expressionless"></span>
													<div class="smiles-bunch">
														<i class="em em---1"></i>
														<i class="em em-smiley"></i>
														<i class="em em-anguished"></i>
														<i class="em em-laughing"></i>
														<i class="em em-angry"></i>
														<i class="em em-astonished"></i>
														<i class="em em-blush"></i>
														<i class="em em-disappointed"></i>
														<i class="em em-worried"></i>
														<i class="em em-kissing_heart"></i>
														<i class="em em-rage"></i>
														<i class="em em-stuck_out_tongue"></i>
													</div>
												</div>

												<button type="submit"></button>
											</form>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- The Scrolling Modal image with comment -->

	<script src="${pageContext.request.contextPath }/resources/js/main.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-stories.js"></script>
	<!--<script src="js/toast-notificatons.js"></script>-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.2/TweenMax.min.js"></script>
	<!-- For timeline slide show -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3vI4IQqzxRU1449lbIHThUb2gCeDW47w&callback=initMap"></script>
	<!-- for location picker map -->
	<script src="${pageContext.request.contextPath }/resources/js/locationpicker.jquery.js"></script><!-- for loaction picker map -->
	<script src="${pageContext.request.contextPath }/resources/js/map-init.js"></script><!-- map initilasition -->
	<script src="${pageContext.request.contextPath }/resources/js/page-tourintro.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/page-tour-init.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/stories-zuck.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/stories-zuck-necessery.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/stories-zuck-init.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
	<script>
		var header = "";
		var token = "";
		$(function(){
			// 시큐리티 적용 시, header 키 값과 토큰을 설정 
			// (동적 페이지마다 전역변수로 설정된 header, token을 가져다 쓸 수 있다)
			header = $("meta[name='_csrf_header']").attr("content");
			token = $("meta[name='_csrf']").attr("content");
		});
		jQuery(document).ready(function ($) {

			$('#us3').locationpicker({
				location: {
					latitude: -8.681013,
					longitude: 115.23506410000005
				},
				radius: 0,
				inputBinding: {
					latitudeInput: $('#us3-lat'),
					longitudeInput: $('#us3-lon'),
					radiusInput: $('#us3-radius'),
					locationNameInput: $('#us3-address')
				},
				enableAutocomplete: true,
				onchanged: function (currentLocation, radius, isMarkerDropped) {
					// Uncomment line below to show alert on each Location Changed event
					//alert("Location changed. New location (" + currentLocation.latitude + ", " + currentLocation.longitude + ")");
				}
			});
			
			/* //실시간 알림 테스트
			const eventSource = new EventSource('/socket/sse/subscribe');

			eventSource.addEventListener('sse', event => {
				alert(event);
				console.log(event);
			}); */

			
			
			/*if ($.isFunction($.fn.toast)) {
				$.toast({
					heading: 'Welcome To Pitnik',
					text: '',
					showHideTransition: 'slide',
					icon: 'success',
					loaderBg: '#fa6342',
					position: 'bottom-right',
					hideAfter: 3000,
				});
	
				$.toast({
					heading: 'Information',
					text: 'Now you can full demo of pitnik and hope you like',
					showHideTransition: 'slide',
					icon: 'info',
					hideAfter: 5000,
					loaderBg: '#fa6342',
					position: 'bottom-right',
				});
				$.toast({
					heading: 'Support & Help',
					text: 'Report any <a href="#">issues</a> by email',
					showHideTransition: 'fade',
					icon: 'error',
					hideAfter: 7000,
					loaderBg: '#fa6342',
					position: 'bottom-right',
				});
			}*/

		});	
	</script>

</body>

</html>