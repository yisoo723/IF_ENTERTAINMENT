<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

*, *::before, *::after {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	scroll-behavior: smooth;
}

body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background: #fff;
	background-image: radial-gradient(at 9.2% 73.7%, #ffddc9 0px, transparent 50%),
		radial-gradient(at 92.3% 7.6%, #fff9cf 0px, transparent 50%);
	background-repeat: no-repeat;
	font-family: 'GmarketSansMedium', sans-serif;
}

.gray-bg {
    float: left;
    width: 100%;
    background: #fff;
}

/* ------ */
/* INTRO */
#intro {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	place-items: center;
	padding: 0;
	min-height: 100dvh;
/* 	overflow: hidden; */
}

.info {
	position: relative;
    /* top: -193px; */
    top: -340px;
    right: 25px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content: center;
	gap: 20px;
	padding: 30px 50px;
}

.info h1 {
	font-size: 3rem;
}

.info p {
	font-size: 1.1rem;
	margin-bottom: 20px;
}

.split-beer {
    position: relative;
    /* top: -169px; */
    top: -360px;
	display: flex;
	flex-direction: row;
}

.beer {
    position: relative;
    left: -50px;
	max-width: 100%;
	width: 250px;
	border-radius: 20px;
	margin-left: 15px;
}

.beer:nth-child(2) {
	transform: translateY(-1.5rem);
}

.button:after, .close-btn:after {
	background: #fff;
}

.explore, .explore:before, .close-btn, .close-btn:before {
	background: rgba(255, 193, 7, 1);
	background: linear-gradient(45deg, rgba(255, 193, 7, 1) 0%,
		rgba(255, 87, 34, 1) 100%);
	background: -moz-linear-gradient(45deg, rgba(255, 193, 7, 1) 0%,
		rgba(255, 87, 34, 1) 100%);
	background: -webkit-linear-gradient(45deg, rgba(255, 193, 7, 1) 0%,
		rgba(255, 87, 34, 1) 100%);
}

.button {
	display: inline-block;
	position: relative;
	border-radius: 10px;
	text-decoration: none;
	padding: 0.8rem 2rem;
	font-size: 1rem;
	font-weight: bold;
	border: none;
	outline: none;
	cursor: pointer;
	transition: all 0.5s ease;
	background-clip: text;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.button:hover {
	text-shadow: 0px 0px 0px rgba(255, 255, 255, 0.8);
}

.button:hover::after {
	left: 100%;
	top: 100%;
	bottom: 100%;
	right: 100%;
}

.button::before {
	content: "";
	display: block;
	position: absolute;
	left: 0;
	top: 0;
	bottom: 0;
	right: 0;
	z-index: -1;
	border-radius: inherit;
	transition: all 0.5s;
}

.button::after {
	content: "";
	display: block;
	position: absolute;
	left: 2.5px;
	top: 2px;
	bottom: 2.5px;
	right: 2px;
	z-index: -1;
	border-radius: 8px;
	transition: all 0.5s;
}

/* -------- */
/* CONTENT */
#content {
	left: -25px;
    bottom: 640px;
/*     bottom: 260px; */
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 50px;
    padding: 60px 40px;
    min-height: 100dvh;
    overflow: hidden;
}

.card {
   	margin-bottom: 65px;
    margin-right: 498px;
    position: relative;
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: 50% 50%;
    height: 250px;
    width: 440px;
    aspect-ratio: 1 / 1;
    color: #fff;
    border-radius: 20px;
    box-shadow: 0 6.7px 5.3px rgba(0, 0, 0, 0.03), 0 22.3px 17.9px rgba(0, 0, 0, 0.05);
}

a:link, a:visited, a:hover, a:active {
	background-color: transparent;
}

.title {
	display: flex;
	justify-content: center;
	align-items: center;
	color: #fff;
	background: #000;
	border-radius: 20px 20px 0 0;
	text-align: center;
}

.more {
	display: grid;
	grid-template-columns: 1fr 1fr;
	place-items: center;
	background-color: #fff;
	border-radius: 0 0 20px 20px;
}

.open-icon {
	font-size: 1.25rem;
	color: #000;
	transform: translateY(3px);
	margin-left: 3px;
	z-index: 1;
}

.modal-open {
	text-transform: uppercase;
	color: #000;
	background-color: transparent;
	outline: none;
	border: none;
	cursor: pointer;
	grid-area: 1/2/span 1/span 1;
}

.card-img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border-radius: 20px;
	object-fit: cover;
	object-position: 50% 50%;
	z-index: 2;
	transition: all 450ms ease-in 200ms;
}

.card:hover>.card-img {
	width: 50%;
	height: 50%;
	top: 50%;
	border-radius: 0 0 0 20px;
}

/* ------ */
/* MODAL */
body.prevent-background-scroll {
	min-height: 100dvh;
	overflow-y: hidden;
}

/* ------ */
/* MEDIA QUERIES */
@media ( max-width : 1100px) {
	.beer {
		width: 200px;
	}
	#content {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 800px) {
	#intro {
		padding: 30px;
	}
	.beer {
		width: 150px;
	}
	.info {
		gap: 20px;
		padding: 30px 30px;
	}
	.info h1 {
		font-size: 2.5rem;
	}
	.info p {
		font-size: 1rem;
	}
	#content {
		gap: 30px;
		padding: 60px 20px;
	}
	.card {
		width: 250px;
	}
	.modal-content {
		width: 80%;
	}
	footer {
		padding: 20px 80px 60px;
	}
	footer>p {
		font-size: 1.1rem;
	}
}

@media ( max-width : 550px) {
	#intro {
		grid-template-columns: repeat(1, 1fr);
		grid-template-areas: "split-beer" "info";
	}
	.info {
		grid-area: info;
	}
	.split-beer {
		grid-area: split-beer;
		margin: 20px auto;
	}
	.beer {
		width: 100px;
	}
	#content {
		grid-template-columns: repeat(1, 1fr);
		padding: 40px 40px;
	}
	footer {
		padding: 20px 30px 60px;
	}
	footer>p {
		font-size: 1rem;
	}
}

.mds {
	display: flex;
	height: 100px;
}

.visionText {
	color: black;
	padding: 25px;
	font-size: larger;
}
.companyNm{
	font-size: x-large;
	font-weight: bolder;
}

.central-meta {
    padding: 0px;
}

</style>
<section id="intro">
	<div class="info">
		<h1 class="notranslate"><br/>If entertainment</h1>
		<p>
			<br/>
			If entertainment는 <br/> “We believe in music”이라는 <br/> 
			미션 아래 음악 산업의 비즈니스 모델을
			<br/> 혁신하는 기업입니다. <br/><br/>
			글로벌 트렌드를 이끄는 '콘텐츠'와 우리의<br/>
			고객인 '팬'을 최우선 가치로 두고, 
			높은 기준과<br/>
			끊임없는 개선으로<br/>
			고객을 만족시키도록 노력하고 있습니다.
		</p>
		<a href="#content" class="button explore">Explore</a>
	</div>
	<div class="split-beer">
		<img class="beer" src="${pageContext.request.contextPath }/resources/companyInfo/saok1.PNG" />
		<img class="beer" src="${pageContext.request.contextPath }/resources/companyInfo/saok2.PNG" />
	</div>
</section>

<section id="content">
	<div class="row mds">
		<div class="col-md-6">
			<div class="card">
				<img class="card-img" src="${pageContext.request.contextPath }/resources/companyInfo/vision1.PNG" />
				<div class="visionText">
					<span class="companyNm">If entertainment</span>는 <br/>
					아시아를 넘어 글로벌 No.1을 지향합니다.
				</div>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="card">
				<img class="card-img" src="${pageContext.request.contextPath }/resources/companyInfo/vision2.PNG" />
				<div class="visionText">
					<span class="companyNm">If entertainment</span>는 <br/>
					K-POP과 K-Culture의 미래를 설계합니다.
				</div>
			</div>
		</div>
	
		<div class="col-md-6">
			<div class="card">
				<img class="card-img" src="${pageContext.request.contextPath }/resources/companyInfo/vision3.PNG" />
				<div class="visionText">
					<span class="companyNm">If entertainment</span>는 <br/> 
					신뢰할 수 있는 책임 경영의 모범이 되겠습니다.
				</div>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="card">
				<img class="card-img" src="${pageContext.request.contextPath }/resources/companyInfo/vision4.PNG" />
				<div class="visionText">
					<span class="companyNm">If entertainment</span>는 <br/>
					음악에 기반한 세계 최고의 엔터테인먼트 라이프<br/> 
					스타일 플랫폼 기업을 지향합니다.
				</div>
			</div>
		</div>
	</div>

</section>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(function(){
	$(".central-meta").css("height", "1350px");
	$(".central-meta").css("overflow-y", "hidden");
	$(".central-meta").css("overflow-y", "hidden");
});



</script>