package kr.or.ddit.vo.entertain;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class NationVO {

	private int nationNo;
	
//	@NotBlank(message = "국적을 선택해주세요.")
	private String nationName;
	private String field;
}
