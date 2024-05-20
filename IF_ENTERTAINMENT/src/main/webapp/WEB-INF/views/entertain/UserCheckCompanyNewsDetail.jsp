<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'GmarketSansMedium', sans-serif;
}
</style>
</head>
<body>
	<div class="create-post detail_title_box">
		<div class="detail_title">
		${companyNews.bfTitle }</div>
		<br/>
		<div class="detail_date">
		발행일
		<fmt:formatDate value="${companyNews.bfRegdate }" pattern="yyyy-MM-dd hh:mm"/>
		</div>
	</div>
	<div class="bottom_box">
		<div class="about-chnl detail_content_box">
			<div class="detail_content">
				${companyNews.bfContent }
			</div>
		</div>
		<div class="detail_bottom_line">
			<div class="detail_button">
				<div class="detail_left_btn">
					<a href="/entertain/company/news/userdetail.do?bfNo=${companyNews.bfNo }" 
					title="이전" class="main-btn btn_pre">
						<i class="fa fa-chevron-left" aria-hidden="true"></i>
					</a> 
					<a href="/entertain/company/news/userdetail.do?bfNo=${companyNews.bfNo }" title="다음" class="main-btn btn_next">
						<i class="fa fa-chevron-right" aria-hidden="true"></i>
					</a>
				</div>
<button class="custom-btn btn-12" onclick="location.href='/entertain/company/news/userlist.do'">
    <span style="font-family: 'GmarketSansMedium';">GO !!!</span>
    <span style="font-family: 'GmarketSansMedium';">목록</span>
</button>
				
			</div>
		</div>
	</div>
</body>
</html>