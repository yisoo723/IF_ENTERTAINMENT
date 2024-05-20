package kr.or.ddit.service.impl.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.community.IArtistScheduleMapper;
import kr.or.ddit.service.community.IArtistScheduleSerivce;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.CalVO;

@Service
public class ArtistScheduleSerivceImpl implements IArtistScheduleSerivce {
	
	@Inject
	private IArtistScheduleMapper scheduleMapper;

	@Override
	public void insert(CalVO calVO) {
		scheduleMapper.insert(calVO);
	}

	@Override
	public List<CalVO> scList(String agId) {
		List<CalVO> scList = scheduleMapper.scList(agId);
		return scList;
	}

	@Override
	public int delete(String agId) {
		int status = scheduleMapper.delete(agId);
		
		return status;
	}

	@Override
	public int update(CalVO calVO) {
		int status = scheduleMapper.update(calVO);
		return status;
	}

	@Override
	public List<CalVO> userList() {
		List<CalVO> userList = scheduleMapper.userList();
		return userList;
	}

	@Override
	public int sizeUpdate(CalVO calVO) {
		int status = scheduleMapper.sizeUpdate(calVO);
		return status;
	}

	@Override
	public int dragUpdate(CalVO calVO) {
		int status = scheduleMapper.dragUpdate(calVO);
		return status;
	}

}
