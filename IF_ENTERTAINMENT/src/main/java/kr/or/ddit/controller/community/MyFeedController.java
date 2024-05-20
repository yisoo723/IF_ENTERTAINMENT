package kr.or.ddit.controller.community;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.service.community.IJoinService;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.CommunityVO;
import kr.or.ddit.vo.community.FeedVO;
import kr.or.ddit.vo.entertain.ArtistGroupVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 마이피드컨트롤러
 * @author 임민혁
 *
 */
@Controller
@Slf4j
@RequestMapping("/community/feed")
public class MyFeedController {
	@Inject
	private IJoinService joinService;
	 @Inject
	    private IFeedService feedService;
	 @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	 @GetMapping("/myFeed.do")
	    public String userProfile(@RequestParam("userNo") int userNo,
	                              @RequestParam("agId") String agId,
	                              @RequestParam(name ="userType", required = false, defaultValue = "2") String userType,
	                              Model model) {
	        model.addAttribute("userNo", userNo);
	        model.addAttribute("agId", agId);
	        
	        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserVO userVO = user.getUser();
			int userNo1 = userVO.getUserNo();
			model.addAttribute("loginUser",userNo1);
			List<ArtistGroupVO> mycommunity= joinService.selectmycommunityList(userNo1);
			model.addAttribute("mycommunity", mycommunity);
			CommunityVO communityVO = new CommunityVO();
	        //로그인 하드코딩
	        communityVO.setUserNo(userNo1);
	        communityVO.setAgId(agId);
	        CommunityVO comId = feedService.selectUser(communityVO);
	        model.addAttribute("UserInfo", comId);
	        Date cjDate = comId.getCjDate();
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    String formattedCjDate = sdf.format(cjDate);
		    model.addAttribute("cjDate", formattedCjDate);
	        List<FeedVO> myFeedList = feedService.myFeedList(userNo,agId);
	        List<FeedVO> myFeedList1 = feedService.myFeedList1(userNo,agId);
	        model.addAttribute("myFeedList1", myFeedList1);
	        for (FeedVO feed : myFeedList) {
	        	String userProfile=feed.getUserProfile();
	        	String mnNickName=feed.getMnNickName();
	        	String userType1= feed.getUserType();
	        	String feedMembership= feed.getFeedMembership();
	        	model.addAttribute("mnNickName",mnNickName);
	        	model.addAttribute("userProfile",userProfile);
	        	model.addAttribute("feedMembership",feedMembership);
	        	model.addAttribute("userType",userType1);
	        	
	        }
	        model.addAttribute("myFeedList", myFeedList);
	        log.info("myFeedList{}",myFeedList);
	        
	        
	        
	        
	        
	        
	        List<FeedVO> myCommentList =feedService.myCommentList(userNo,agId);
	        model.addAttribute("myCommentList", myCommentList);
	        
	        
	        return "community/myFeed";  
	    }
	 
	 	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
		@GetMapping("/myFeedComment.do")
	    @ResponseBody
	    public Map<String, Object> getArtistFeed(@RequestParam("feedNo") int feedNo ,Model model) {
			Map<String, Object> responseData = new HashMap<>();

			
			FeedVO feedVO = feedService.selectFeed(feedNo);
			List<FeedVO> feedCommentList=feedService.getArtistFeedComment(feedNo);
			List<FeedVO> memberShipYn = feedService.memberShipYn();
			responseData.put("feedVO", feedVO);
		    responseData.put("feedCommentList", feedCommentList);
		    responseData.put("memberShipYn", memberShipYn);
	        return responseData;
	    }
		
	 
}