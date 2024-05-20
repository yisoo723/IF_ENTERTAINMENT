<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sweetAlertCustom/sweetAlertCustom.js"></script>
<style>
.noticeList td{
	padding: 24px 20px 24px 20px !important;
}
</style>
<div class="gap inner-bg">
  <div class="table-styles">
  
  <div class="little-heading">
  	<h2 style="margin-bottom: 30px; font-family: 'GmarketSansMedium';">🎁 굿즈 공지사항 </h2>
  </div>
  
  	<div class="gap listbar-container">
    <div class="discount-copon list-bar">
      <div class="row">
        <div class="col-md-4">
          <form method="post" id="searchForm">
	        <input type="hidden" name="page" id="page"/>
          	<div class="searchform-box" style="display: flex">
	            <input type="text" name="searchWord" value="${searchWord }" placeholder="제목검색">
		        <button type="submit">검색</button>
	        </div>
	        <sec:csrfInput/>
          </form>
        </div>
        <div class="col-md-3" style="display: flex;">
        	<form id="noticeform" method="post" action="/goods/notice/ckeckDelete.do">
        		<span class="noticeConfirm">
        			<button id="checkDelBtn" type="submit" style="width: 150px">선택항목 삭제하기</button>
        		</span>
        		<sec:csrfInput/>
        	</form>
        	<form>
        		<button type="button" id="newBtn"><i class="fa-solid fa-plus"></i>등록하기</button>
        		<sec:csrfInput/>
        	</form>
        </div>
      </div>
    </div>
  </div>
    
    <div class="widget">
      <table class="prj-tbl striped table-responsive">
        <thead class="color">
           <tr class="prodTitle">
             <th><i class="all-slct"></i></th>
             <th><em>번호</em></th>
             <th><em>제목</em></th>
             <th><em>작성일자</em></th>
             <th><em>조회수</em></th>
             <th><em>작성자</em></th>
             <th><em>배너</em></th>
             <th><em>상태</em></th>
           </tr>
        </thead>
        <tbody>
        <c:set value="${pagingVO.dataList }" var="goodsNoticeList"/>
        <c:choose>
        	<c:when test="${empty goodsNoticeList}">
        		<tr>
        			<td colspan="10">공지사항 리스트가 존재하지 않습니다.</td>
        		</tr>
        	</c:when>
        	<c:otherwise>
        		<c:forEach items="${goodsNoticeList }" var="goodsNotice" varStatus="vs1">
        			<tr class="prodList noticeList" >
			            <td><i class="sngl-slct" data-index="${vs1.index}"></i></td>
			            <td><span class="noticeNo">${goodsNotice.bfNo}</span></td>
			            <td style="text-align: left; padding-left: 90px;"><a href="/goods/notice/detail.do?bfNo=${goodsNotice.bfNo}"><span>${goodsNotice.bfTitle}</span></a></td>
			             <fmt:parseDate value="${goodsNotice.bfRegdate}" var="bfRegdate" pattern="yyyy-MM-dd" />
			            <td><span><fmt:formatDate value="${bfRegdate}" pattern="yyyy-MM-dd" /></span></td>
			            
			            <td><span>${goodsNotice.bfHit}</span></td>
			            <td><span>${goodsNotice.userName }</span></td>
			            <c:choose>
			            	<c:when test="${goodsNotice.bfDisplay eq 'N'}">
			            		 <td><span class="off">OFF</span></td>
			            	</c:when>
			            	<c:otherwise>
			            		<td><span class="on">ON</span></td>
			            	</c:otherwise>
			            </c:choose>
			            <td>
			            	<span>
				            	<a class="delBtn" data-bfNo="${goodsNotice.bfNo }">
				            		<i class="icon-trash"></i>
				            	</a>
		            		</span>
			            </td>
			          </tr>
        		</c:forEach>
        	</c:otherwise>
        </c:choose>
        </tbody> 
      </table>
      <!-- <form action="/goods/notice/delete.do" method="post" id="delFrm">
      	<input type="hidden" name="bfNo" id="gNo"/>
      </form> -->
    </div>
    <div class="card-footer prod-footer clearfix" id="pagingArea">
		${pagingVO.pagingHTML }
	</div>
  </div>
</div>

<script>
$(function () {
	var noticeNos = [];
	var snglSlct = $(".sngl-slct");
	
	snglSlct.on("click", function () {
		$(this).toggleClass('active'); 
		
		var index = $(this).data("index");
		var noticeNo = $(".noticeNo").eq(index).text();
		
	    if (noticeNos.indexOf(noticeNo) === -1) {
	        // 중복된 값이 없는 경우에만 배열에 추가
	        noticeNos.push(noticeNo);
	    } else {
	        // 중복된 값이 있는 경우, 해당 값 삭제
	        noticeNos = noticeNos.filter(function(value) {
	        	return value !== noticeNo;
	        });
	    }		
		console.log("현재 noticeNos 배열 : ", noticeNos);
	});
	
	var checkDelBtn = $("#checkDelBtn");
	
	checkDelBtn.on("click", function (event) {
		event.preventDefault();
		Swal.fire({
	        title: '선택한 게시물을 삭제하시겠습니까?', 
	        text: " ", 
	        icon: 'warning', 
	        showCancelButton: true, // 취소 버튼 보이도록 설정
	        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
	        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
	        confirmButtonText: '삭제하기', // 삭제 버튼 텍스트 설정
	        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
	    }).then((result) => {
	        setTimeout(() => {
	            Swal.close(); // 일정 시간 후 SweetAlert2 경고창 닫기
	        }, 2000); // 2000ms(2초) 후에 경고창 닫기
	        if (result.isConfirmed) { 
	        	// 삭제 버튼을 눌렀을 때
	   			for (var i = 0; i < noticeNos.length; i++) {
					$(".noticeConfirm").append('<input type="hidden" name="noticeNos" value="' + noticeNos[i] + '">');
				}
	   			noticeform.submit();
	            Swal.fire( 
	                '배송처리 성공!', 
	                '', 
	                'success' 
	            )
	        } else if (result.dismiss === Swal.DismissReason.cancel) { // 취소 버튼을 눌렀을 때
	            // "취소" 버튼을 눌렀을 때
	            Swal.fire( 
	                '작업이 취소되었습니다.', 
	                '', 
	                'info' 
	            )
	        }
	    });
	});
	
	
	$('.all-slct').on("click",function(){
		$(this).toggleClass('active');
	    $(".sngl-slct").toggleClass('active'); 
	});
	
	var prodList = $(".prodList");
	var delFrm = $("#delFrm");
	var prod_update = $(".prod_update");
	var delBtn = $(".delBtn");
	var searchForm = $("#searchForm")

	$('.all-slct').on("click",function(){
		$(this).toggleClass('active');
	    $(".sngl-slct").toggleClass('active'); 
	});
	
	var newBtn = $("#newBtn");
	var pagingArea = $("#pagingArea");
	
	pagingArea.on("click", "a", function (event) {
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	newBtn.on("click", function () {
		location.href = "/goods/notice/form.do";
	});
	
	delBtn.on("click", function (event) {
		event.preventDefault();
		Swal.fire({
            title: '공지사항을 정말 삭제 하시겠습니까?',
            text: "삭제 시 복구할 수 없습니다!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예, 삭제합니다',
            cancelButtonText: '취소'
        }).then((result) => {
        	var bfNo = $(this).data("bfno");
			//delFrm.find("#gNo").val(goodsNo);
			//delFrm.submit();
        	
            if (result.isConfirmed) {
                $.ajax({
                    url: "/goods/notice/delete.do?bfNo="+ bfNo,
                    method: 'POST',
                    beforeSend: function(xhr){
                    	xhr.setRequestHeader(header, token);
                    },
                    success: function(data) {
                        Swal.fire(
                            '삭제 완료!',
                            '항목이 성공적으로 삭제되었습니다.',
                            'success'
                        ).then(() => {
                        	window.location.href = "/goods/notice/list.do";
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