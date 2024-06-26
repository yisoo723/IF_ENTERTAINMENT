<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/sweet.js"></script>
<script src="${pageContext.request.contextPath }/resources/sweetAlertCustom/sweetAlertCustom.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/pay_modal.css">
<!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.7.js"></script>

<!-- 포트원 결제 -->
<link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.min.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/color.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<style>
   .disabled {
    opacity: 0.4; /* 음영 처리 */
    pointer-events: none; /* 클릭 방지 */
}
#addAddressBtn, #addressBtn {
	z-index: 11;
	position : relative;
	left : 38%;
	top : 45%;
    min-height: 30px;
    opacity: 1;
    border-radius: 5px; 
    border: 1px solid white; 
    background-color: #9551fc; 
    color: white; 
}
.payment-method button {
    float: right; 
    background-color: #c956f0; 
    color: white; 
    padding: 10px 24px; 
    border: none; 
    border-radius: 5px; 
    cursor: pointer; 
    font-size: 16px; 
    transition: all 0.3s ease 0s; 
}
.paychoice {
	border-right: 1px solid #e6ecf5;
}
.form-radio .radio > label {
	font-size: 16px;
}
</style>
<div style="display: flex; flex-wrap: wrap;">
	<div class="col-lg-6">
		<button id="addressBtn">기존 배송지 사용</button>
		<div class="central-meta shipping-info-meta">
    <h4 class="create-post">배송지 관리</h4>
    <div class="checkout-meta">
        <form method="post" class="c-form">
         	  <div class="row">
			    <div class="col-lg-3 col-sm-6">
			        <label for="maPlace">배송지 설정</label>
			        <select id="addressSelect">
      	  <c:forEach var="addressList" items="${addressList}">
			             <option value="${addressList.maPlace}" 
                data-maPostcode="${addressList.maPostcode}"
                data-maAddress1="${addressList.maAddress1}"
                data-maNumber="${addressList.maNumber}"
                data-maAddress2="${addressList.maAddress2}"
                data-maReciever="${addressList.maReciever}"
                data-maTelno="${addressList.maTelno}"
                data-maNation="${addressList.maNation}">
            ${addressList.maPlace}
        </option>">
 			</c:forEach>
			        </select>
			    </div>
			</div>
            <div class="row">
			    <div class="col-lg-6 col-sm-4">
			     <label for="maPlace">배송지명</label>
			        <input type="text" id="maPlace"  style="width: 70%" required="" disabled>
			        <!-- 기타 hidden 필드들과 c:forEach 반복문 -->
			    </div>
			    <div class="col-lg-6 col-sm-4">
			     <label for="maPlace">받는사람</label>
			        <input type="text" id="maReciever"  style="width: 70%" required="" disabled>
			        <input type="hidden" id="userNo" value="${userNo }">
			        <!-- 기타 hidden 필드들과 c:forEach 반복문 -->
			    </div>
			    <div class="col-lg-6 col-sm-6"></div>
			</div>
			<div class="row">
			    <label for="maAddress1">&nbsp;주소 </label>
			    <div class="col-lg-6 col-sm-6">
			        <input type="text" id="maAddress1" required="" disabled>
			    </div>
			</div>
				<div class="row">
			    <label for="maPostcode">&nbsp;우편번호</label>
			    <div class="col-lg-3 col-sm-3">
			        <input type="text" id="maPostcode" required="" disabled>
			    </div>
			   
			</div>
			<div class="row">
			    <label for="maAddress2">&nbsp;상세주소</label>
			    <div class="col-lg-6 col-sm-6">
			        <input type="text" id="maAddress2" required="" disabled>
			    </div>
			</div>

		<div class="row">
		        <label for="maTelno1">&nbsp;전화번호</label>
		    <div class="col-lg-2 col-sm-2">
		        <input type="text" id="maTelno1" maxlength="3" required="" disabled>
		    </div>
		    <div class="col-lg-2 col-sm-2">
		        <input type="text" id="maTelno2" maxlength="4" required="" disabled>
		    </div>
		    <div class="col-lg-2 col-sm-2">
		        <input type="text" id="maTelno3" maxlength="4" required="" disabled>
		    </div>
		</div>
			<div class="row">
			    <div class="col-lg-3 col-sm-6">
			        <label for="maNation">국적</label>
			        <input type="text" id="maNation" required="" disabled>
			    </div>
			    <div class="col-lg-6 col-sm-6"></div>
			</div>

        </form>
    </div>  
</div>
</div>






<!-- 새배송지폼  -->
<div class="col-lg-6">
<button id="addAddressBtn">신규 배송지 사용</button>
		<div class="central-meta shipping-info disabled">
    <h4 class="create-post">신규 배송지 사용 </h4>
    <div class="checkout-meta">
        <form method="post" class="c-form">
         	
            <div class="row">
			    <div class="col-lg-6 col-sm-6">
			        <label for="maPlace">배송지명</label>
			        <input type="text" id="maPlace2"  style="width: 70%" required="" value="">
			        <input type="hidden" id="cartName2"  style="width: 70%" required="" value="${cartVO2.cartName }">
			        <input type="hidden" id="cartPrice2"  style="width: 70%" required="" value="${cartVO2.cartPrice }">
			        <input type="hidden" id="cartThumbnail2"  style="width: 70%" required="" value="${cartVO2.cartThumbnail }">
			        <input type="hidden" id="cartQuantity2"  style="width: 70%" required="" value="${cartVO2.cartQuantity }">
			        <input type="hidden" id="goodsNo2"  style="width: 70%" required="" value="${cartVO2.goodsNo }">
			    </div>
			    <div class="col-lg-6 col-sm-6">
			        <label for="maReciever" >받는사람</label>
			        <input type="text" id="maReciever2" style="width: 70%" required="" value="">
			    </div>
			    <div class="col-lg-6 col-sm-6"></div>
			</div>
			<div class="row">
    <label for="maAddress1">&nbsp;주소 </label>
    <div class="col-lg-6 col-sm-6">
        <input type="text" id="maAddress12" class="maAddress1" required="" value="">
    </div>
    <div class="col-lg-6 col-sm-6">
    <button type="button" id="findAddress" class="btn btn-primary" style="float: left; margin-top:3%; ">주소 검색</button>
</div>
           
</div>
		<div class="row">
    <label for="maPostcode">&nbsp;우편번호</label>
    <div class="col-lg-3 col-sm-3">
        <input type="text" id="maPostcode2" class="maPostcode" required=""  value="">
    </div>
    <div class="col-lg-4 col-sm-3">
        
    </div>
</div>
<div class="row">
    <label for="maAddress2">&nbsp;상세주소</label>
    <div class="col-lg-6 col-sm-6">
        <input type="text" id="maAddress22" class="maAddress2" required="" value="">
    </div>
</div>

		<div class="row">
		        <label for="maTelno1">&nbsp;전화번호</label>
		    <div class="col-lg-2 col-sm-2">
		        <input type="text" id="maTelno12" maxlength="3" required="" value="010">
		    </div>
		    <div class="col-lg-2 col-sm-2">
		        <input type="text" id="maTelno22" maxlength="4" required="" value="">
		    </div>
		    <div class="col-lg-2 col-sm-2">
		        <input type="text" id="maTelno32" maxlength="4" required="" value="">
		    </div>
		</div>
		<div class="row">
			    <div class="col-lg-3 col-sm-6">
			        <label for="maNation">국적</label>
			        <select id="maNation2" required="">
			            <option value="">국적을 선택해주세요</option>
			            <c:forEach var="nationList" items="${nationList }">
			            <option value="${nationList.nationName }">${nationList.nationName }</option>
			            </c:forEach>
			        </select>
			    </div>
			    <div class="col-lg-6 col-sm-6"></div>
			</div>
			<div class="row">
			    <div class="col-lg-6 col-sm-6">
			        <label for="maNation" style="margin-top: 10%; width: 330px;">
    <span style="color: orange;">&#x26A0;</span> 신규배송지 정보는 내 배송지 관리에 저장됩니다.
</label>
			    </div>
			    <div class="col-lg-6 col-sm-6"></div>
			</div>
	<sec:csrfInput/>
        </form>
    </div>  
</div>
</div>
</div>
<div class="central-meta OrderIssue" style="width: 1342px;
    position: relative;
    left: 14px;
}">
	<form id="pageForm">
	    <input type="hidden" name="page" id="page"/>
	</form>
	<h1 class="create-post">주문/결제 </h1>
	<div class="cart-sec">
		<table class="table table-responsive OrderIssue-table">
			<tr>
				<th>상품정보</th>
				<th>판매가</th>
				<th>수량</th>
				<th>구매가</th>
			</tr>
			<c:choose>
				<c:when test="${empty cartList }">
					<tr>
						<td colspan="5">주문내역이 존재하지 않습니다.</td>
						
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${cartList }" var="cartList">
						<tr>
							<td>
								<div class="cart-avatar issu-imgbox goods" data-goodsNo="${myOrder.goodsNo}">
									<img src="${cartList.cartThumbnail }" alt="">
								</div>
								<div class="cart-meta issue-pro-con goods" data-goodsNo="${myOrder.goodsNo}">
									<span class="issue-pro-artist" style="color : #B19CD9;">${cartList.goodsArtist }</span>
									<span class="issue-pro-title">${cartList.cartName }</span>
								</div>
							</td>
							<td>
								<span class="cart-prices" style="position: relative; top: 50px;"> 
									<ins>
										<span  class="woocommerce-Price-amount amount" id="cartPrice"><fmt:formatNumber value="${cartList.cartPrice }" pattern="#,###"/>원</span>
									</ins> 
								</span>
							</td>
							<td>
								<span class="cart-prices" style="position: relative; top: 50px;"> 
									<ins>
										<span class="woocommerce-Price-amount amount" id="cartQuantity">${cartList.cartQuantity }</span>
										
									</ins> 
								</span>
							</td>
							<td>
								<span class="cart-prices" style="position: relative; top: 50px;"> 
									<ins>
										 <span class="woocommerce-Price-amount amount " style="color : #FF0000;"><fmt:formatNumber  value="${cartList.cartPrice * cartList.cartQuantity}" pattern="#,###" />원</span>
									</ins> 
								</span>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>


<div class="col-lg-12">
    <div class="central-meta">
        <h4 class="create-post">결제</h4>
        <div class="checkout-meta">
            <div class="row"> <!-- Bootstrap row 추가 -->
                <div class="col-lg-6"> <!-- 내용을 담을 왼쪽 6열 -->
                    <div class="payment-method">
                        <form class="c-form" method="post">
                            <div class="paychoice">
                                <label>결제수단 선택</label>
                                <div class="form-radio">
                                    <div class="radio" style="display: flex; align-items: center;">
                                        <label style="width: 18%;">
                                            <input type="radio" name="radio" id="kakao"checked="checked"  value="카카오페이">
                                            	<i class="check-box" ></i>카카오 페이
                                        </label>
                                             <img src="${pageContext.request.contextPath }/resources/images/payimage/kakao.png" alt="카카오페이" style="width: 40px; height: 40px; margin-right: 5px;">
                                    </div>
                                    <div class="radio" style="display: flex; align-items: center;">
                                        <label style="width: 18%;">
                                            <input type="radio" name="radio" ><i class="check-box"></i>신용카드
                                        </label>
                                            <img src="${pageContext.request.contextPath }/resources/images/payimage/visa.png" alt="카카오페이" style="width: 40px; height: 40px; margin-right: 5px;">
                                    </div>
                                    <div class="radio" style="display: flex; align-items: center;">
                                        <label style="width: 18%;">
                                            <input type="radio" name="radio"><i class="check-box"></i>토스 페이
                                        </label>
                                            <img src="${pageContext.request.contextPath }/resources/images/payimage/toss.png" alt="토스페이" style="width: 40px; height: 40px; margin-right: 5px;">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div> 
                
                <!-- 오른쪽부분   -->
                <div class="col-lg-6"> 
                <label style="font-size: 20px;">최종 결제정보 </label>
                    <div class="total-line">
					    <ul style="border: none;">
					        <li><ins>총 상품금액:</ins> <span id="total-price-display"><i></i><fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</span></li>
					        <li><ins>배송비:</ins> <span><i></i>무료</span></li>
					        <li style="text-align: right;"><b>총 결제금액: </b><em id="total-payment-display"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</em></li>
					    </ul>
					</div>
                    <div class="payment-method">
                            <button onclick="requestPay()">결제하기</button>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    var price = ${totalPrice}; 

    var formattedPrice = formatter.format(price);
    console.log("Formatted Price: ", formattedPrice);
    document.getElementById('total-price-display').innerHTML = formattedPrice;
    document.getElementById('total-payment-display').innerHTML = formattedPrice;
	});





    // I'mport 초기화
    var IMP = window.IMP; 
    IMP.init("imp54681038"); 
    
    function requestPay() {
    	
        var orderPay = $("#kakao").val();
        var totalPrice = ${totalPrice};
        console.log("totalPrice", totalPrice);
        var cartPrice = $("#cartPrice2").val();
        var cartName = $("#cartName2").val();
        var cartQuantity = $("#cartQuantity2").val();
        var cartThumbnail = $("#cartThumbnail2").val();
        var goodsNo = $("#goodsNo2").val();
        
        console.log("cartQuantity", cartQuantity);

        if ($(".shipping-info-meta").hasClass("disabled")) {
            data = {
                maPlace: $("#maPlace2").val(),
                maReciever: $("#maReciever2").val(),
                maAddress1: $("#maAddress12").val(),
                maPostcode: $("#maPostcode2").val(),
                maAddress2: $("#maAddress22").val(),
                maTelno1: $("#maTelno12").val(),
                maTelno2: $("#maTelno22").val(),
                maTelno3: $("#maTelno32").val(),
                maNation: $("#maNation2").val(),
                orderPay : orderPay,
                orderTotalprice :totalPrice,
                goodsPrice:cartPrice,
                goodsName:cartName,
                goodsQuantity:cartQuantity,
                goodsThumbnail:cartThumbnail,
                goodsNo:goodsNo
            };
        } else {
            data = {
                maNumber: $('#addressSelect').find('option:selected').data('manumber'),
                orderPay : orderPay,
                orderTotalprice :totalPrice,
                goodsPrice:cartPrice,
                goodsName:cartName,
                goodsQuantity:cartQuantity,
                goodsThumbnail:cartThumbnail,
                goodsNo:goodsNo
            };
        }
        
        IMP.request_pay({
            pg: "kakaopay", 
            pay_method: "card",
            merchant_uid: "merchant_" + new Date().getTime(),
            name: "주문명: 예시 상품",
            amount: 1000, 
            buyer_email: "buyer@example.com",
            buyer_name: "구매자 이름",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456"
        }, function(rsp) {
            if (rsp.success) {
                $.ajax({
                    url: "/goods/kakao.do", 
                    type: "POST",
                    contentType: "application/json",
                    beforeSend: function(xhr){
                        xhr.setRequestHeader(header, token);
                    },
                    data: JSON.stringify(data),
                    success: function(res) {
                        console.log("res", res);
                        totalAllprice = res.totalOrderVO.totalAllprice;
                        userId = res.totalOrderVO.userId;
                        
                        Swal.fire({
                        	  icon: "success",
                        	  title: "결제가 성공적으로 완료되었습니다.",
                        	  showConfirmButton: false,
                        	  timer: 1500
                        });
                        
                        if (data != null && totalAllprice >= 200000) {
	                        var CollectionData = {
	        		        		type : "Collection",
	        		        		receiver : res.totalOrderVO.userId
	        		        }
	                        ws.send(JSON.stringify(CollectionData));
						}
						setTimeout(() => {
	                        window.location.href = '/goods/myOrder.do';
						}, 2000);

//                         alert("결제 정보가 성공적으로 전송되었습니다.");
//                         setTimeout(() => {
//                         	window.location.href = '/goods/main.do';
//           		        }, 3000);

                    },
                    error: function(xhr, status, error) {
                        alert("결제 정보 전송에 실패하였습니다.");
                    }
                });
            } else {
                // 결제 실패 시 로직
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
        });
    }
</script>



<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function() {
    $('#findAddress').click(function() { 
        new daum.Postcode({
            oncomplete: function(data) {
                $('.maPostcode').val(data.zonecode); 
                $('.maAddress1').val(data.address); 
                $('.maAddress2').focus(); 
            }
        }).open();
    });
});
</script>
<script>
$(document).ready(function() {
    $('#addressBtn').hide();

    $('#addAddressBtn').click(function() {
        $('.shipping-info').removeClass('disabled');
        $('.shipping-info-meta').addClass('disabled');
        $(this).hide();
        $('#addressBtn').show();
    });

    $('#addressBtn').click(function() {
    	event.preventDefault();
        $('.shipping-info-meta').removeClass('disabled');
        $('.shipping-info').addClass('disabled');
        $(this).hide();
        $('#addAddressBtn').show();
    });
});


$(document).ready(function() {
    function updateFormWithSelectedAddress() {
        var selected = $('#addressSelect').find('option:selected');
        var maPostcode = selected.data('mapostcode');
        var maAddress1 = selected.data('maaddress1');
        var maAddress2 = selected.data('maaddress2');
        var maReciever = selected.data('mareciever');
        var maNation = selected.data('manation');
        var maTelno = selected.data('matelno');
        
       

        var telnoParts = maTelno.split('-'); // 가정: 전화번호가 '-'로 구분되어 있다고 가정
        if (telnoParts.length === 3) { // 전화번호가 올바르게 '-'로 구분되어 있다면
            $('#maTelno1').val(telnoParts[0]);
            $('#maTelno2').val(telnoParts[1]);
            $('#maTelno3').val(telnoParts[2]);
        }
        
        $('#maPlace').val(selected.val());
        $('#maReciever').val(maReciever);
        $('#maPostcode').val(maPostcode);
        $('#maAddress1').val(maAddress1);
        $('#maAddress2').val(maAddress2);
        $('#maNation').val(maNation);
    }

    $('#addressSelect').change(updateFormWithSelectedAddress);
    updateFormWithSelectedAddress();
});

</script>