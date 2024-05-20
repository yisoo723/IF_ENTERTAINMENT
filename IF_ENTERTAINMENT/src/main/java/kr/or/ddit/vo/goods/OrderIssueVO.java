package kr.or.ddit.vo.goods;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class OrderIssueVO {
	 private String orderNo;
	 private String guiType;
	 @NotBlank(message = "유형을 선택해주세요.")
	 private String guiReason;
	 @NotBlank(message = "사유를 입력해주세요.")
	 private String guiDetail;
	 private int odNo;
	 private String guiSavepath;
	 private Date guiDate;
	 private Date guiCngdate;
	 
	 private int orderTotalprice;
	 private Date orderDate;
	 private int orderCount;
	 private int odTotal;
	 private String orderPay;
	 
	 private int goodsNo;
	 private String goodsThumbnail;
	 private String goodsArtist;
	 private String goodsName;
	 private int goodsPrice;
	 
	 private int odQuantity;
	 
	 private String userId;
	 
	 @NotBlank(message = "썸네일을 등록해주세요.")
	 private MultipartFile orderIssuefile;
}
