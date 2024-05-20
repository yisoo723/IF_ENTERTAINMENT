<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span class="create-post">지원내역확인</span>
		<div class="title-block search_box">
			<div class="row">
				<div class="col-lg-6">
<!-- 					<div class="row merged20"> -->
<!-- 						<div class="col-lg-7 col-md-7 col-sm-7 search_box"> -->
<!-- 							<form method="post"> -->
<!-- 								<input type="text" placeholder="Search..."> -->
<!-- 								<button type="submit" class="searchBtn"><i class="fa-regular fa-magnifying-glass"></i></button> -->
<!-- 							</form> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
		<div class="central-meta">
			<div class="row">
				<table class="table table-responsive">
					<thead style="width: inherit;">
						<tr align="center">
							<th width="6%">번호</th>
							<th width="69%">제목</th>
							<th width="15%">등록일</th>
						</tr>
					</thead>
					<tbody class="ent-sched-tbody">
					<c:choose>
						<c:when test="${empty arList }">
							<tr>
								<td colspan="4">오디션 신청내역이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${arList }" var="auditionList">
								<tr>
									<td align="center">${auditionList.arNo }</td>
									<td align="center">
										<a href="/entertain/audition/auditionSupportDetail.do?arNo=${auditionList.arNo }" title="">
											${auditionList.arTitle }
										</a>
									</td>
									<td align="center">
										<fmt:formatDate value="${auditionList.arRegdate }" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>