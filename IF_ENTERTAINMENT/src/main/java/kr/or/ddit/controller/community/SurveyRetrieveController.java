package kr.or.ddit.controller.community;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.community.ISurveyService;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.community.SurveyFormVO;
import kr.or.ddit.vo.community.SurveyOptionVO;
import kr.or.ddit.vo.community.SurveyQuestionVO;
import kr.or.ddit.vo.community.SurveyResultVO;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


/**
 * 설문조사 내역 조회 컨트롤러(관리자)
 * @author 홍진영
 */
@Controller
@Slf4j
@RequestMapping("/community/survey")
public class SurveyRetrieveController {

	@Inject
	private ISurveyService surveyService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/list.do")
	public String surveyList(Model model, @RequestParam(required = false) String searchWord,
		@RequestParam(name ="page", required = false, defaultValue = "1") int currentPage) {
		
		PaginationInfoVO<SurveyFormVO> pagingVO = new PaginationInfoVO<SurveyFormVO>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = surveyService.selectSurveyCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<SurveyFormVO> surveyFormList = surveyService.selectSurveyList(pagingVO);
		pagingVO.setDataList(surveyFormList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "admin/community/surveyList";
	}
	
	// 설문 상세 조회 메서드
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/detail.do", method = RequestMethod.GET)
	public String surveyDetail(int sfNo, Model model) {
		SurveyFormVO surveyFormVO = surveyService.selectSurvey(sfNo);
		model.addAttribute("surveyFormVO", surveyFormVO);
		log.info("### surveyFormVO : {}", surveyFormVO);
		return "admin/community/surveyDetail";
	}
	
	// 설문 결과 조회 메서드
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/getResult", method = RequestMethod.GET)
	public ResponseEntity<List<SurveyResultVO>> getResult(int sfNo, Model model){
		log.info("설문 결과 조회를 위한 설문번호 : {}", sfNo);
		ResponseEntity<List<SurveyResultVO>> entity = null;
		
		// 설문지 번호에 해당하는 설문결과 리스트를 받아온다.
		List<SurveyResultVO> surveyResultList = surveyService.getsurveyResultList(sfNo);
		
		log.info("surveyResultList 작업 전 : {}", surveyResultList);
		for (SurveyResultVO surveyResultVO : surveyResultList) {
		    List<SurveyQuestionVO> sqList = surveyResultVO.getSurveyQuestionList();

		    for (SurveyQuestionVO sq : sqList) {
		    	List<Integer> cntList = new ArrayList<Integer>(); // cntList 초기화
		        List<SurveyOptionVO> soList = sq.getOptionList();

		        for (SurveyOptionVO so : soList) {
		            int cnt = so.getCnt();
		            cntList.add(cnt); // cntList에 cnt 값 추가
		        }
		        sq.setCntList(cntList);
		    }
		}
		log.info("surveyResultList 작업 후 : {}", surveyResultList);
			
		model.addAttribute("surveyResultList", surveyResultList);
		entity = new ResponseEntity<List<SurveyResultVO>>(surveyResultList, HttpStatus.OK);
		return entity;
	}
	
}
