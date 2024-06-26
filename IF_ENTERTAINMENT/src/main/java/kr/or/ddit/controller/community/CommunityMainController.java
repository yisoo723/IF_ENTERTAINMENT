package kr.or.ddit.controller.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.service.community.IJoinService;
import kr.or.ddit.service.community.ISurveyService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.BanKeywordVO;
import kr.or.ddit.vo.community.CommunityVO;
import kr.or.ddit.vo.community.FeedCommentVO;
import kr.or.ddit.vo.community.FeedVO;
import kr.or.ddit.vo.community.MainArtistGroupVO;
import kr.or.ddit.vo.community.MemberNickNameVO;
import kr.or.ddit.vo.community.SurveyFormVO;
import kr.or.ddit.vo.entertain.ArtistGroupVO;
import kr.or.ddit.vo.entertain.ArtistVO;
import kr.or.ddit.vo.goods.GoodsVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 커뮤니티 메인페이지
 * 
 * @author 임민혁
 */
@Controller
@Slf4j
@RequestMapping("/community")
/*
 * 메인화면 커뮤니티 메인페이지는 로그인을 하지 않아도 조회는 가능함 아티스트를 선택했을 때 로그인을 강제함
 */

/*
 * 커뮤니티 가입하는 메소드 닉네임 중복값 검사(커뮤니티마다 각각 다른 닉네임 사용가능, 회원닉네임 테이블에 Insert) 커뮤니티가입
 * 테이블에 Insert
 */
public class CommunityMainController {
	@Inject
    private PasswordEncoder passwordEncoder;

	@Inject
	private ISurveyService surveyService;
	
    @Inject
    private IFeedService feedService;
    
	@Inject
	private IJoinService joinService;

//	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
    @RequestMapping(value = "/main.do", method = RequestMethod.GET)
    public String artistList(Model model) {
        List<MainArtistGroupVO> artistList = feedService.selectArtist();
        
        int userNo = 0;
        
		// [스프링 시큐리티] 회원 ID를 스프링 시큐리티 UserDetails 정보에서 가져오기
        if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
        	CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        	UserVO userVO = user.getUser();
        	model.addAttribute("userNo", userVO.getUserNo());
    		model.addAttribute("loginUser",userVO.getUserNo());
    		model.addAttribute("userVO",userVO);
        userNo = userVO.getUserNo();
        }
        
//       UserVO user= feedService.userTypeSelect(userNo);
        
        // 팝업에 띄울 하나의 설문지 객체를 가져온다.
        SurveyFormVO surveyPopupForm = surveyService.selectSurveyPopup();
        
        List<ArtistGroupVO> mycommunityList = joinService.selectmycommunityList(userNo);
        
        model.addAttribute("mycommunityList", mycommunityList);
//       
        model.addAttribute("surveyPopupForm", surveyPopupForm);
        
        model.addAttribute("artistList", artistList);
       log.info("artistListartistList{}",artistList);
        return "community/feedMain";
    }

    
    
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
    @RequestMapping(value = "/artist", method = RequestMethod.GET)
    public String communitySignUp(@RequestParam("agId") String agId, HttpServletRequest req, Model model,
    		@RequestParam(name ="userType", required = false, defaultValue = "2") String userType,
    		@RequestParam(name ="userNo", required = false ) Integer userNo
    		) {
        log.info("agId: " + agId);
        log.info("userType: " + userType);
       
        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserVO userVO = user.getUser();
		int userNo1 = userVO.getUserNo();
		model.addAttribute("loginUser",userNo1);
		List<FeedVO> memberShipYn = feedService.memberShipYn();
		model.addAttribute("memberShipYn",memberShipYn);
		List<MainArtistGroupVO> artist = feedService.getArtistById(agId);
		List<MainArtistGroupVO> getArtist = feedService.getArtist();
		model.addAttribute("getArtist",getArtist);
		log.info("getArtist{}",getArtist);
		List<ArtistGroupVO> mycommunity= joinService.selectmycommunityList(userNo1);
		model.addAttribute("mycommunity", mycommunity);
		List<GoodsVO> goodsList1 = feedService.getGoodsList1(agId);
		model.addAttribute("goodsList1",goodsList1);
		log.info("goodsList1{}",goodsList1);
		
		List<MainArtistGroupVO> artistList = feedService.selectArtist();
		model.addAttribute("artistList", artistList);
		
        List<FeedVO> feedList = feedService.mainFeedList(agId,userType,userNo);
        
        model.addAttribute("feedList", feedList);

        log.info("feedListfeedList{}: " + feedList);

        Map<Integer, List<FeedCommentVO>> commentMap = new HashMap<>();

        for (FeedVO feed : feedList) {
            int feedNo = feed.getFeedNo();
            log.info("feedNofeedNo: " + feedNo);
            List<FeedCommentVO> commentList = feedService.mainCommentList(feedNo);
            log.info("commentListcommentListcommentList: " + commentList);
            model.addAttribute("commentList", commentList);
            commentMap.put(feedNo, commentList);
        }
         
        
        model.addAttribute("commentMap", commentMap);
        
        log.info("artist123: " + artist);
       
        model.addAttribute("artistGroup", artist);
       
        log.info("agId111: " + agId);
        
        List<FeedVO> artistComment = feedService.artistCommentList(agId);
        model.addAttribute("artistCommentList",artistComment);
        
        
        
        List<BanKeywordVO> ban = feedService.selectBanKeyword();
        model.addAttribute("ban",ban);
        
        
        CommunityVO communityVO = new CommunityVO();
        
        //로그인 하드코딩
        communityVO.setUserNo(userNo1);
        communityVO.setAgId(agId);
        
        CommunityVO comId = feedService.selectUser(communityVO);
        
        
        model.addAttribute("UserInfo", comId);
        log.info("comId: " + comId);
       
        if (comId != null) {
            //하드코딩
            FeedVO feedVO = new FeedVO();
            feedVO.setMnNickName(comId.getMnNickName());
            String membership  = feedService.checkMembership(feedVO);
            boolean member = (membership !=null);
            // 멤버십 여부 확인
            // 모델에 멤버십 여부 추가
            model.addAttribute("member", member);
        	
        	model.addAttribute("artistGroup", artist);
            model.addAttribute("userInfo", communityVO);
            return "community/artistFeed";
        } else {
            model.addAttribute("artistGroup", artist);
            model.addAttribute("userInfo", communityVO);
            
            HttpSession session = req.getSession();
            //세션에 담아서 전달	
            session.setAttribute("artistGroup", artist);
            session.setAttribute("userInfo", communityVO);
//    	    if (principal != null) {
//	        // 로그인 상태일 때 처리할 내용
//	    } else {
//	        // 비로그인 상태일 때 처리할 내용
//	        return "community/artistFeed";
//	    }
            return "commons/communitySignUp";
        }
    }
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
    @RequestMapping(value = "/communitySignUp", method = RequestMethod.POST)
    public String communitySignUp(Model model, MemberNickNameVO nickVO, HttpServletRequest request) {
    	
    	HttpSession session = request.getSession();
    	CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserVO userVO = user.getUser();
		int userNo1 = userVO.getUserNo();
		model.addAttribute("loginUser",userNo1);
        ArrayList<MainArtistGroupVO> artistGroupList = (ArrayList<MainArtistGroupVO>) session.getAttribute("artistGroup");
    	
        MainArtistGroupVO artistGroup = artistGroupList.get(0);
        CommunityVO userInfo = (CommunityVO) session.getAttribute("userInfo");
        //일단 커뮤니티 가입시킨후 멤버닉네임 추가
        
    
        MemberNickNameVO checkNick = feedService.checkNickName(nickVO.getMnNickname());
        if(checkNick ==null) {
        	
        //가입진행
        CommunityVO comSignUp=new CommunityVO();
        comSignUp.setAgId(artistGroup.getAgId());
        comSignUp.setUserNo(userInfo.getUserNo());
        
        int suc =feedService.comSignUp(comSignUp);
        if(suc >0) {
        	
        //이건 멤버쉽 가입용 임시로 넣어서 확인 처음 가입에는 없어야해
       
        nickVO.setCjNo(comSignUp.getCjNo());
        nickVO.setUserNo(userNo1);
        
        log.info("nickVOnickVO", nickVO.getMnNickname());
        log.info("nickVOnickVO", nickVO.getCjNo());
        log.info("nickVOnickVO", nickVO.getUserNo());
        feedService.nicSignUp(nickVO);
        }
     }else {
    	 model.addAttribute("error", "해당 닉네임은 이미 사용 중입니다. 다른 닉네임을 선택해 주세요.");
         return "/commons/communitySignUp";
     }
//        MemberNickNameVO memberNickName=feedService.comSignUp();
//        log.info("comcom", communityVO);
        return "redirect:/community/artist?agId=" + userInfo.getAgId();
    }
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/pwMyCheck.do", method = RequestMethod.GET)
	public String pwMyCheck(Model model) {
    	CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserVO userVO1 = user.getUser();
		int userNo1 = userVO1.getUserNo();
		model.addAttribute("loginUser",userNo1);
		
		return "/community/pwCheck";
		
		
	}
	
//	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
//	@RequestMapping(value = "/pwMyCheck.do", method = RequestMethod.POST)
//    public ResponseEntity<String> pwCheck(Model model ,@RequestBody UserVO userVO ) {
//		
//		log.info("userVO{}",userVO);
//
//		UserVO myPw = feedService.myPwCheck(userVO);
//		if (myPw != null) {
//	        return new ResponseEntity<String>(HttpStatus.OK);
//	    } else {
//	        return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
//	    }
//	}
//	
	@RequestMapping(value = "/pwMyCheck.do", method = RequestMethod.POST)
	public ResponseEntity<String> pwCheck(@RequestBody UserVO userVO) {
	    log.info("Received userno: {}", userVO.getUserNo());

	    UserVO storedUser = feedService.myPwCheck(userVO);
	    if (storedUser != null && passwordEncoder.matches(userVO.getUserPw(), storedUser.getUserPw())) {
	        return new ResponseEntity<>(HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }
	}	
}
