package kr.or.ddit.service.community;

import java.util.List;

import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.CalVO;

public interface IArtistScheduleSerivce {

	public void insert(CalVO calVO);

	public List<CalVO> scList(String agId);

	public int delete(String agId);

	public int update(CalVO calVO);

	public List<CalVO> userList();

	public int sizeUpdate(CalVO calVO);

	public int dragUpdate(CalVO calVO);

}
