package kr.or.ddit.controller.community;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.community.IArtistScheduleSerivce;
import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.service.entertain.IArtistService;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.CalVO;
import kr.or.ddit.vo.community.CommunityVO;
import kr.or.ddit.vo.entertain.ArtistGroupVO;
import kr.or.ddit.vo.entertain.ArtistVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 아티스트 일정 조회 컨트롤러(사용자/관리자)
 * FullCalendar API 활용
 * @author 조재훈
 */
@Controller
@Slf4j
@RequestMapping("/community/artist/schedule")
public class ArtistScheduleRetrieveController {
	
	@Inject
	private IArtistScheduleSerivce scheduleService;
	
	@Inject
	private IFeedService feedService;
	
	
	@Inject
	private IArtistService artistService;
	
	
	@ResponseBody
	@RequestMapping("/test.do")
	public ResponseEntity<List<CalVO>> test(
			String agId
			){
		log.info("agId값" + agId);
		List<CalVO> scList = new ArrayList<CalVO>();
		scList = scheduleService.scList(agId);
		List<CalVO> userList = new ArrayList<>();
		userList = scheduleService.userList();
		log.info("scList값" + scList);
		log.info("userList값" + userList);
		for (CalVO scItem : scList) {
		    for (CalVO userItem : userList) {
		        if (scItem.getUsername().equals(userItem.getUsername())) {
		            scItem.setUserProfile(userItem.getUserProfile());
		        }
		    }
		}
		log.info("scList값" + scList);
		return new ResponseEntity<List<CalVO>>(scList, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/artistSchedule.do", method = RequestMethod.GET)
	private String artistDetail(Model model, String agId) {
		ArtistGroupVO artistGroupVO = artistService.profileList(agId);
		List<ArtistVO> artistList = artistService.artistSelect(agId);
		 CommunityVO communityVO = new CommunityVO();
		 CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserVO userVO = user.getUser();
			int userNo1 = userVO.getUserNo();
			  log.info("agId: " + agId);
	        //로그인 하드코딩
	        communityVO.setUserNo(userNo1);
	        communityVO.setAgId(agId);
	        
	        CommunityVO comId = feedService.selectUser(communityVO);
	        comId.setAgId(agId);
	        
	        model.addAttribute("UserInfo", comId);
	        log.info("comId: " + comId);
	      
		
		
		model.addAttribute("profile",artistGroupVO);
		model.addAttribute("artistList",artistList);
		model.addAttribute("UserInfo.agId",agId);
		
		return "community/artistSchedule";
	}
//	@RequestMapping("/artistSchedule.do")
//	public String artistSchedule() {
//		
//		return "community/artistSchedule";
//	}
		
	}
	
	
