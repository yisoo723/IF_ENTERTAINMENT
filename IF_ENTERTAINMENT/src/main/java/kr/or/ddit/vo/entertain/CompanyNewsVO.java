package kr.or.ddit.vo.entertain;


import java.util.Date;

import lombok.Data;

@Data
public class CompanyNewsVO {
	private int bfNo;
	private String bfTitle;
	private String bfContent;
	private int bfHit;
	private Date bfRegdate;
	private String bfDelyn;
	private String bfDisplay;
	private int userNo;
	private int btNo;
	private String bfWriter;
	
}
