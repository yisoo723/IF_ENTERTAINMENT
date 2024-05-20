package kr.or.ddit.service.impl.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.community.IJoinMapper;
import kr.or.ddit.service.community.IJoinService;
import kr.or.ddit.vo.community.MembershipVO;
import kr.or.ddit.vo.entertain.ArtistGroupVO;

@Service
public class JoinServiceImpl implements IJoinService {

	@Inject
	private IJoinMapper joinMapper;

	@Override
	public List<ArtistGroupVO> selectmycommunityList(int userNo) {
		return joinMapper.selectmycommunityList(userNo);
	}

	@Override
	public List<MembershipVO> selectmyMembershipList(int userNo) {
		return joinMapper.selectmyMembershipList(userNo);
	}

	@Override
	public List<ArtistGroupVO> goodsShopMainArtist() {
		return joinMapper.goodsShopMainArtist();
	}


	
}
