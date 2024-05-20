<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<div class="gap no-gap">
	<div class="inner-bg">
		<div class="element-title">
			<h3 style="font-family: 'GmarketSansMedium';">📅 IR 행사일정</h3>
			<br />
			<div class="gap listbar-container">
				<div class="discount-copon list-bar">
					<div class="row">
						<div class="col-md-6">
							<form method="post" id="searchForm" style="display: flex;">
								<input type="hidden" name="page" id="page" /> <input
									type="text" name="searchWord" value="${searchWord}"
									placeholder="검색" style="flex: 1; margin: 3px;">
								<button type="submit" style="margin: 3px;">검색하기</button>
								<button type="button" id="newBtn" style="margin: 3px;">글
									작성</button>
									<sec:csrfInput />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="widget-title no-margin"
			style="width: 100%; text-align: center; padding: 0;">
			<table class="prj-tbl striped table-hover "
				style="width: 100%; text-align: center;">
				<thead class="color">
					<tr>
						<th style="padding-left: 0;"><em>게시글 번호</em></th>
						<th><em>제목</em></th>
						<th><em>작성일</em></th>
						<th><em>작성자</em></th>
						<th style="padding-right: 0;"><em>삭제</em></th>
					</tr>
				</thead>
				<tbody>
					<c:set value="${pagingVO.dataList }" var="irEventList" />
					<c:choose>
						<c:when test="${empty irEventList }">
							<tr>
								<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${irEventList }" var="irevent">
								<tr class="prodList">
									<td style="padding-left: 0;">${irevent.bfNo }</td>
									<td style="text-align: left;"><a
										href="/entertain/ir/detail.do?bfNo=${irevent.bfNo }">
											${irevent.bfTitle } </a></td>
									<td><fmt:formatDate value="${irevent.bfRegdate }"
											pattern="yyyy-MM-dd"/></td>
									<td><font class="badge badge-danger"
										style="font-size: 14px;"> ${irevent.bfWriter } </font></td>
									<td style="text-align: center; padding-right: 0;"><c:choose>
											<c:when test="${irevent.bfDelyn eq 'Y' }"> 삭제완료
        									</c:when>
											<c:otherwise>
												<span class="delete-icon"> <a
													href="/entertain/ir/delete.do?bfNo=${irevent.bfNo}"> <i
														class="icon-trash"></i>
												</a>
												</span>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="card-footer prod-footer clearfix" id="pagingArea">
			${pagingVO.pagingHTML }</div>
	</div>
</div>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$(function() {
		var newBtn = $("#newBtn");
		var searchForm = $("#searchForm");
		var pagingArea = $("#pagingArea");

		newBtn.on("click", function() {
			location.href = "/entertain/ir/form.do";
		});

		pagingArea.on("click", "a", function(event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});
	});
	
	$(document).ready(function() {
	    $(".delete-icon a").on("click", function(event) { 
	        event.preventDefault(); 
	        
	        var deleteUrl = $(this).attr('href'); 

	        Swal.fire({
	            title: '정말로 삭제하시겠습니까?',
	            text: "삭제 시 복구할 수 없습니다!",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '예, 삭제합니다',
	            cancelButtonText: '취소'
	        }).then((result) => {
	        	
	            if (result.isConfirmed) {
	                $.ajax({
	                    url: deleteUrl,
	                    beforeSend: function(xhr){
	                    	xhr.setRequestHeader(header, token);
	                    },
	                    method: 'POST',
	                    success: function(data) {
	                        Swal.fire(
	                            '삭제 완료!',
	                            '항목이 성공적으로 삭제되었습니다.',
	                            'success'
	                        ).then(() => {
	                        	
	                            window.location.href = "/entertain/ir/list.do";
	                        });
	                    },
	                    error: function(xhr, status, error) {
	                        Swal.fire(
	                            '삭제 실패!',
	                            '삭제하는 도중 오류가 발생했습니다.',
	                            'error'
	                        );
	                    }
	                });
	            }
	        });
	    });
	});
</script>