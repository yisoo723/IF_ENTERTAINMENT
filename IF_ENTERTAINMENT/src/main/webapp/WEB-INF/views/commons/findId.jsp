<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta id="_csrf" name="_csrf" content=${_csrf.token }>
	<meta id="_csrf_header" name="_csrf_header" content=${_csrf.headerName }>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Authentication Form</title>
    <script src="${pageContext.request.contextPath }/resources/js/find.js" defer></script>
    <style>
    
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.fill:hover,
.fill:focus {
  box-shadow: inset 0 0 0 2em var(--hover);
}

.pulse:hover, 
.pulse:focus {
  animation: pulse 1s;
  box-shadow: 0 0 0 2em transparent;
}

@keyframes pulse {
  0% { box-shadow: 0 0 0 0 var(--hover); }
}

.close:hover,
.close:focus {
  box-shadow: 
    inset -3.5em 0 0 0 var(--hover),
    inset 3.5em 0 0 0 var(--hover);  
}

.raise:hover,
.raise:focus {
  box-shadow: 0 0.5em 0.5em -0.4em var(--hover);
  transform: translateY(-0.25em);
}

.up:hover,
.up:focus {
  box-shadow: inset 0 -3.25em 0 0 var(--hover);
}

.slide:hover,
.slide:focus {
  box-shadow: inset 6.5em 0 0 0 var(--hover);
}

.offset {  
  box-shadow: 
    0.3em 0.3em 0 0 var(--color),
    inset 0.3em 0.3em 0 0 var(--color);
  
}

.offset:hover,
.offset:focus {
  box-shadow: 
    0 0 0 0 var(--hover),
    inset 6em 3.5em 0 0 var(--hover);
}

.fill {  
  --color: #a972cb;
  --hover: #b87ddb;
}

.pulse {
  --color: #ef6eae;
  --hover: #f57ec8;
}

.close {
  --color: #ff7f82;
  --hover: #ff9194;
}

.raise {
  --color: #ffa260;
  --hover: #ffae7a;
}

.up {
  --color: #e4cb58;
  --hover: #edd26e;
}

.slide {
  --color: #8fc866;
  --hover: #98d271;
}

.offset {
  --color: #19bc8b;
  --hover: #22c69c;
}

button {  
  color: var(--color);
  transition: 0.25s;
}

button:hover,
button:focus { 
  border-color: var(--hover);
  color: #fff;
}


button {
  background: none;
  border: 2px solid;
  font: inherit;
  line-height: 1;
  margin: 0.5em;
  padding: 1em 2em;
}


code { 
  color: #e4cb58;
  font: inherit;
}
    
    
:root {
	/* COLORS */
	--white: #e9e9e9;
	--gray: #333;
	--blue: #0367a6;
	--lightblue: #008997;

	/* RADII */
	--button-radius: 0.7rem;

	/* SIZES */
	--max-width: 758px;
	--max-height: 420px;

	font-size: 16px;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
		Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}

body {
	align-items: center;
	background-color: var(--white);
	 background-image: url("${pageContext.request.contextPath}/resources/images/bts.png");
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	display: grid;
	height: 100vh;
	place-items: center;
	font-family: 'GmarketSansMedium', sans-serif;
}

.form__title {
	font-weight: 300;
	margin: 0;
	margin-bottom: 1.25rem;
}

.link {
	color: var(--gray);
	font-size: 0.9rem;
	margin: 1.5rem 0;
	text-decoration: none;
}

.container {
	background-color: var(--white);
	border-radius: var(--button-radius);
	box-shadow: 0 0.9rem 1.7rem rgba(0, 0, 0, 0.25),
		0 0.7rem 0.7rem rgba(0, 0, 0, 0.22);
	height: var(--max-height);
	max-width: var(--max-width);
	overflow: hidden;
	position: relative;
	width: 100%;
}

.container__form {
	height: 100%;
	position: absolute;
	top: 0;
	transition: all 0.6s ease-in-out;
}

.container--signin {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.right-panel-active .container--signin {
	transform: translateX(100%);
}

.container--signup {
	left: 0;
	opacity: 0;
	width: 50%;
	z-index: 1;
}

.container.right-panel-active .container--signup {
	animation: show 0.6s;
	opacity: 1;
	transform: translateX(100%);
	z-index: 5;
}

.container__overlay {
	height: 100%;
	left: 50%;
	overflow: hidden;
	position: absolute;
	top: 0;
	transition: transform 0.6s ease-in-out;
	width: 50%;
	z-index: 100;
}

.container.right-panel-active .container__overlay {
	transform: translateX(-100%);
}

.overlay {
	background-color: var(--lightblue);
	background: url("${pageContext.request.contextPath}/resources/images/bts.png");
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
	left: -100%;
	position: relative;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
	width: 200%;
}

.container.right-panel-active .overlay {
	transform: translateX(50%);
}

.overlay__panel {
	align-items: center;
	display: flex;
	flex-direction: column;
	height: 100%;
	justify-content: center;
	position: absolute;
	text-align: center;
	top: 0;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
	width: 50%;
}

.overlay--left {
	transform: translateX(-20%);
}

.container.right-panel-active .overlay--left {
	transform: translateX(0);
}

.overlay--right {
	right: 0;
	transform: translateX(0);
}

.container.right-panel-active .overlay--right {
	transform: translateX(20%);
}

.btn {
	background-color: var(--blue);
	background-image: linear-gradient(90deg, var(--blue) 0%, var(--lightblue) 74%);
	border-radius: 20px;
	border: 1px solid var(--blue);
	color: var(--white);
	cursor: pointer;
	font-size: 0.8rem;
	font-weight: bold;
	letter-spacing: 0.1rem;
	padding: 0.9rem 4rem;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

.form > .btn {
	margin-top: 1.5rem;
}

.btn:active {
	transform: scale(0.95);
}

.btn:focus {
	outline: none;
}

.form {
	background-color: var(--white);
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 3rem;
	height: 100%;
	text-align: center;
}

.input {
	background-color: #fff;
	border: none;
	padding: 0.9rem 0.9rem;
	margin: 0.5rem 0;
	width: 100%;
}

@keyframes show {
	0%,
	49.99% {
		opacity: 0;
		z-index: 1;
	}

	50%,
	100% {
		opacity: 1;
		z-index: 5;
	}
}

    </style>
</head>
<body>
    <div class="container right-panel-active">
        <!-- Sign Up -->
<!--         <div class="container__form container--signup"> -->
<!--             <form action="#" class="form" id="form1"> -->
<!--                 <h2 class="form__title">비밀번호 찾기</h2> -->
<!--                 <input type="text" id="userId" name="userId" placeholder="아이디" class="input" /> -->
<!--                 <input type="text"  id="userName" name="userName" placeholder="이름" class="input" /> -->
<!--                 <input type="text"  id="memberTelno" name="memberTelno" placeholder="전화번호" class="input" /> -->
<!--                 <button  type="button" id="pwfindBtn" value="비밀번호 찾기" class="raise">비밀번호 찾기</button> -->
<%--             <sec:csrfInput/> --%>
<!--             </form> -->
<!--         </div> -->
        <div class="container__form container--signup">
            <form action="#" class="form" id="form2">
                <h2 class="form__title" >아이디 찾기</h2>
                <input type="text" placeholder="이름" id="userName1" name="userName1" class="input" />
                <input type="text" placeholder="전화번호" class="input" id="memberTelno1" name="memberTelno1" />
            	<button  type="button" id="idfindBtn" value="아이디 찾기"  class="raise">아이디찾기</button>
            <sec:csrfInput/>
            </form>
        </div>
    
        <!-- Sign In -->
        <div class="container__form container--signin">
            <form action="#" class="form" id="form1">
                <h2 class="form__title">비밀번호 찾기</h2>
                <input type="text" id="userId" name="userId" placeholder="아이디" class="input" />
                <input type="text"  id="userName" name="userName" placeholder="이름" class="input" />
                <input type="text"  id="memberTelno" name="memberTelno" placeholder="전화번호" class="input" />
                <button  type="button" id="pwfindBtn" value="비밀번호 찾기" class="raise">비밀번호 찾기</button>
            <sec:csrfInput/>
            </form>
        </div>
    
        <!-- Overlay -->
        <div class="container__overlay">
            <div class="overlay">
                <div class="overlay__panel overlay--left">
                    <button class="raise" id="signIn">Find Id</button>
                </div>
                <div class="overlay__panel overlay--right">
                    <button class="raise" id="signUp">Find Pw</button>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
var header = "";
var token = "";                             
$(function(){
	header = $("meta[name='_csrf_header']").attr("content");
	token = $("meta[name='_csrf']").attr("content");
	
	var idfindBtn =$("#idfindBtn");
	
	idfindBtn.on("click",function(){
		var userName=$("#userName1").val();
		var memberTelno=$("#memberTelno1").val();
		console.log("userName",userName);
		
		if(userName == null || userName == ""){
			Swal.fire({
				  icon: "error",
				  title: "이름을 입력해주세요",
				  showConfirmButton: false,
				  timer: 1500
				});
			$("#userName").focus();
			return false;
		}
		if(memberTelno == null || memberTelno == ""){
			Swal.fire({
				  icon: "error",
				  title: "전화 번호를 입력해 주세요",
				  showConfirmButton: false,
				  timer: 1500
				});
			$("#memberTelno").focus();
			return false;
		}
		
		$.ajax({
			url:'idfind.do',
			type: 'POST',
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
			},
			data:JSON.stringify({
				userName : userName,
				memberTelno : memberTelno
			}),
			contentType : "application/json;charset=utf-8",
			error : function() {
				$("#resultId").text("일치하는 정보가 없습니다!");
				Swal.fire({
					  icon: "error",
					  title: "일치하는 아이디가 없습니다.",
					  showConfirmButton: false,
					  timer: 2500
					});
				
			},
			success: function(res) {
// 			    $("#resultId").text("회원님의 아이디는 [" + res + "] 입니다.");
				Swal.fire({
					  icon: "success",
					  title: "회원님의 아이디는 [" + res + "] 입니다.",
					  showConfirmButton: false,
					  timer: 2500
					});
	            setTimeout(function() {
	                location.href = "/signin.do";
	            }, 3500);
			}
		});
		
	});
});
$(function(){
header = $("meta[name='_csrf_header']").attr("content");
token = $("meta[name='_csrf']").attr("content");
	var pwfindBtn =$("#pwfindBtn");

$("#pwfindBtn").click(function() {
    var userId = $("#userId").val();
    var userName = $("#userName").val();
    var memberTelno = $("#memberTelno").val();

    $.ajax({
        type: "POST",
        url: "/pwfind.do",
        beforeSend: function(xhr){	
			xhr.setRequestHeader(header, token);
		},
        contentType: "application/json",
        data: JSON.stringify({
            userId: userId,
            userName: userName,
            memberTelno: memberTelno
        }),
        success: function(result) {
            if (result === "해당하는 사용자를 찾을 수 없습니다.") {
            	Swal.fire({
            		  icon: "error",
            		  title: "일치하는 사용자를 찾을 수 없습니다.",
            		  showConfirmButton: false,
            		  timer: 1500
            		});
            } else {
            	Swal.fire({

            		  icon: "success",
            		  title: "임시 비밀번호를 메일로 전송하였습니다.",
            		  showConfirmButton: false,
            		  timer: 1500
            		});
            }
            setTimeout(function() {
                location.href = "/signin.do";
            }, 3500);
        },
        error: function(xhr, status, error) {
            alert("해당하는 사용자를 찾을 수 없습니다.");
       		 }
    	});
	});
});
</script>    
</body>
</html>