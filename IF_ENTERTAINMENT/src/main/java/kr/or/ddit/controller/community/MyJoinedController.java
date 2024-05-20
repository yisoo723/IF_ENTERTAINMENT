package kr.or.ddit.controller.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.community.IJoinService;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.MembershipVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 내가 가입한 커뮤니티리스트와 멤버십 리스트 조회 컨트롤러
 * @author 성이수
 *
 */
@Controller
@Slf4j
@RequestMapping("/community/joined")
public class MyJoinedController {

	// 아티스트 커뮤니티에 가입하면 커뮤니티 가입 테이블에 저장이 되고 해당 정보들을 로그인한 아이디를 
	// where 조건절에 넣어서 가입한 커뮤니티 목록을 가져온다.
	// 멤버십 테이블도 조인하여 리스트 함께 뽑는다.
	
	@Inject
	private IJoinService joinService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/mymembership.do", method = RequestMethod.GET)
	public String myMembershipList(Model model) {
		
		//하드코딩
		//int userNo = 113;
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserVO userVO = user.getUser();
		int userNo = userVO.getUserNo();
		
		List<MembershipVO> myMembershipList = joinService.selectmyMembershipList(userNo);
		
		log.info("!@!@!@!@!@myMembershipList : " + myMembershipList);
		model.addAttribute("myMembershipList", myMembershipList);
		
		return "community/myMembership";
	}
}
