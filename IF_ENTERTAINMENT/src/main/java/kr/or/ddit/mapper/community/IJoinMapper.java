package kr.or.ddit.mapper.community;

import java.util.List;

import kr.or.ddit.vo.community.MembershipVO;
import kr.or.ddit.vo.entertain.ArtistGroupVO;

public interface IJoinMapper {
	public List<ArtistGroupVO> selectmycommunityList(int userNo);
	public List<MembershipVO> selectmyMembershipList(int userNo);
	public List<ArtistGroupVO> goodsShopMainArtist();

}
