package kr.or.ddit.service.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.NotificationVO;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.MainArtistGroupVO;
import kr.or.ddit.vo.community.MainArtistVO;
import kr.or.ddit.vo.community.MemberNickNameVO;
import kr.or.ddit.vo.goods.GoodsVO;
import kr.or.ddit.vo.community.BanKeywordVO;
import kr.or.ddit.vo.community.CommunityVO;
import kr.or.ddit.vo.community.FeedCommentVO;
import kr.or.ddit.vo.community.FeedReportVO;
import kr.or.ddit.vo.community.FeedVO;

public interface IFeedService {

	public int selectFeedListCount(PaginationInfoVO<FeedVO> pagingVO);

	public List<FeedVO> selectFeedList(PaginationInfoVO<FeedVO> pagingVO);

	public void deleteFeed(FeedVO feedVO);

	public FeedVO feedListDetail(int feedNo);

	public ServiceResult insertFeed(HttpServletRequest req, FeedVO feedVO);

	public int selectCommentListCount(PaginationInfoVO<FeedCommentVO> pagingVO);

	public List<FeedCommentVO> selectCommentList(PaginationInfoVO<FeedCommentVO> pagingVO);

	public FeedCommentVO feedCommentListDetail(int fcNo);

	public void deleteComment(FeedCommentVO commentVO);

	public void updateComment(FeedCommentVO commentVO);

	public List<MainArtistGroupVO> selectArtist();

	public ServiceResult updateFeed(HttpServletRequest req, FeedVO feedVO);

	public List<MainArtistGroupVO> getArtistById(String agId);



	public CommunityVO selectUser(CommunityVO communityVO);

	public int comSignUp(CommunityVO comSignUp);

	public void nicSignUp(MemberNickNameVO nickVO);

	public List<FeedVO> mainFeedList(String agId,String userType, Integer userNo);

	public List<FeedCommentVO> mainCommentList(int feedNo);

	public List<FeedVO> getArtistFeed(String feedNo);

	public List<FeedVO> getArtistFeedComment(int feedNo);

	public FeedVO selectFeed(int feedNo);

	public void insertFeedComment(FeedCommentVO feedComVO);

	public void feedReport(FeedReportVO feedReportVO);

	public void userReport(FeedReportVO feedReportVO);

	public List<FeedVO> artistCommentList(String agId);

//	public UserVO userTypeSelect(int userNo);

	public List<FeedVO> myFeedList(int userNo, String agId);

	public List<FeedVO> myCommentList(int userNo, String agId);

	public String checkMembership(FeedVO feedVO);

	public ServiceResult likePost(int feedNo, int userNo);

	public String alreadyLiked(int feedNo, int userNo);

	public int getLikeCount(int feedNo);

	public void deleteLike(int feedNo, int userNo);

	public String alreadyFeedLiked(int fcNo, int userNo);

	public void deleteFeedLike(int fcNo, int userNo);

	public ServiceResult likefeedPost(int fcNo, int userNo);

	public int getCommentLikeCount(int fcNo);

	public MemberNickNameVO checkNickName(String mnNickname);

	public List<GoodsVO> getGoodsList(GoodsVO goodsVO);

	public String selectComment(FeedCommentVO commentVO);

	public List<MainArtistGroupVO> getArtist();

	public List<GoodsVO> getGoodsList1(String agId);

	public List<FeedVO> myFeedList1(int userNo, String agId);


	public List<FeedVO> memberShipYn();

	public UserVO myPwCheck(UserVO userVO);

	public List<BanKeywordVO> selectBanKeyword();






}
