package kr.or.ddit.service.impl.common;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.common.IAdminMapper;
import kr.or.ddit.service.common.IAdminService;
import kr.or.ddit.vo.goods.goodsInquiryVO;
import kr.or.ddit.vo.statistic.GoodsSalesVO;
import kr.or.ddit.vo.statistic.KeywordVO;
import kr.or.ddit.vo.statistic.MemberRateVO;

@Service
public class AdminServiceImpl implements IAdminService {

	@Inject
	private IAdminMapper adminMapper;
	
	@Override
	public int selectTodayRegister() {
		return adminMapper.selectTodayRegister();
	}

	@Override
	public int selectYesterdayRegister() {
		return adminMapper.selectYesterdayRegister();
	}

	@Override
	public long selectTodaySales() {
		return adminMapper.selectTodaySales();
	}

	@Override
	public long selectYesterdaySales() {
		return adminMapper.selectYesterdaySales();
	}

	@Override
	public int selectDeliveryCount() {
		return adminMapper.selectDeliveryCount();
	}

	@Override
	public int selectChangeCount() {
		return adminMapper.selectChangeCount();
	}

	@Override
	public List<goodsInquiryVO> selectInquiryList() {
		return adminMapper.selectInquiryList();
	}

	@Override
	public void setVisitTotalCount(String username) {
		adminMapper.selectInquiryList(username);
		
	}

	@Override
	public int selectInquiryCount() {
		return adminMapper.selectInquiryCount();
	}

	@Override
	public List<KeywordVO> getKeyword() {
		return adminMapper.getKeyword();
	}

	@Override
	public List<MemberRateVO> selectMemberRateList() {
		return adminMapper.selectMemberRateList();
	}

	@Override
	public List<GoodsSalesVO> selectGoodsSalesList() {
		return adminMapper.selectGoodsSalesList();
	}

}
