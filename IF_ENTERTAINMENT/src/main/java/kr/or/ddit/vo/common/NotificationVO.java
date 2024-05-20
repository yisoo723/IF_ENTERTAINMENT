package kr.or.ddit.vo.common;

import lombok.Data;

@Data
public class NotificationVO {
	 private int notiNo;
	 private String notiSender;
	 private String notiReciever;
	 private String notiUrl;
	 private String notiContent;
	 private String notiType;
	 private String notiDate;
	 private String notiCnfrm;
	 
	 private String userId;
	 private String agIcon;
}
