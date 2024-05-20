package kr.or.ddit.vo.goods;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderVO {
	 private String orderNo;
	 private int orderTotalprice;
	 private String orderPay;
	 private String orderDate;
	 private String orderDelivery;
	 private String orderStatus;
	 private int userNo;
	 private Date cmplDate;
	 
	 private String userId;
     private String impUid;
     private String merchantUid;
     private int amount;
     private String name;
     private int totalPrice;
	 private String maNumber;
	 private String maPostcode;
	 private String maAddress1;
	 private String maAddress2;
	 private String maReciever;
	 private String maTelno;
	 private String maTelno1;
	 private String maTelno2;
	 private String maTelno3;
	 private String maDefault;
	 private String maNation;
	 private String field;
	 private String maPlace;
	 private String cartName;
	 private String cartQuantity;
	 private String cartPrice;
	 private String gcId;
	    
	 
	 //주문번호 하나에 각각의 주문 제품들을 불러오는 리스트
	 private List<OrderDetailVO> orderDetailList;
	 
	 //굿즈넘버
	 private int goodsNo;
	 //주문내역 조회시 상품이미지를 불러오기 위한 필드
	 private String goodsThumbnail;
	 //주문내역 조회시 아티스트 이름을 불러오기 위한 필드
	 private String goodsArtist;
	 //주문내역 조회시 제품 이름을 불러오기 위한 필드
	 private String goodsName;
	 private String goodsQuantity;
	 //주문내역 조회시 총 주문수량을 불러오기 위한 필드
	 private int orderCount;
	 private int odTotal;
	 private int goodsPrice;
	 private String goodsMembership;
	 
	 private int odNo;
	 private int odQuantity;
	 private int odPrice;
	 private String odStatus;
	 
	 private String guiType;
	 private String guiReason;
	 private String guiDetail;
	 private Date guiDate;
	 private Date guiCngdate;
	 private String guiSavepath;
	 
	 private int totalAllprice;
	 
}
