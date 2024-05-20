package kr.or.ddit.vo.goods;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDetailVO {
	 private int odNo;
	 private int odQuantity;
	 private int odPrice;
	 private String orderNo;
	 private int goodsNo;
	 private String odStatus;
	 
	 private int userNo;
	 private String userId;
	 
	 //주문상세 내역 조회시 상품이미지를 불러오기 위한 필드
	 private String goodsThumbnail;
	 //주문상세 내역 조회시 아티스트 이름을 불러오기 위한 필드
	 private String goodsArtist;
	 //주문상세 내역 조회시 제품 이름을 불러오기 위한 필드
	 private String goodsName;
	 //주문상세 내역 조회시 우편번호를 가져오기 위한 필드
	 private String maPostcode;
	 //주문상세 내역 조회시 주소1을 가져오기 위한 필드
	 private String maAddress1;
	 //주문상세 내역 조회시 주소2를 가져오기 위한 필드
	 private String maAddress2;
	 //주문상세 내역 조회시 수령자를 가져오기 위한 필드
	 private String maReciever;
	 //주문상세 내역 조회시 연락처를 가져오기 위한 필드
	 private String maTelno;
	 //주문상세 내역 조회시 국가를 가져오기 위한 필드
	 private String maNation;
	 
	 private String goodsMembership;
	 
	 private Date orderDate;
	 //주문상세 내역 조회시 총 주문금액을 가져오기 위한 필드
	 private int orderTotalprice;
	 //주문상세 내역 조회시 결제수단을 가져오기 위한필드
	 private String orderPay;
	 //주문상세 내역 조회시 배송 상태를 가져오기 위한 필드
	 private String orderDelivery;
	 //주문 완료 일자
	 private Date cmplDate;
	 
	 private int odIssue;
	 
	 private int odTotalprice;

}
