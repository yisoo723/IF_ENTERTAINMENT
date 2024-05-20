package kr.or.ddit.mapper.common;

import java.util.Map;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.UserVO;

public interface IMypageMapper {

	public void updateProfile(Map<String, Object> map);

	public UserVO selectUserMypage(int userNo);

	public int myPagePasswordUpdate(UserVO userVO);

	public int myPageNoticeSettingUpdate(UserVO userVO);

	public void myPagememberNotificationUpdate(UserVO userVO);

	public int deleteMyForm(int userNo);

}
