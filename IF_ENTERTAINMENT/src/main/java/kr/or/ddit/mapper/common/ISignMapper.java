package kr.or.ddit.mapper.common;

import kr.or.ddit.vo.common.MemberVO;
import kr.or.ddit.vo.common.Noti_SettingVO;
import kr.or.ddit.vo.common.Noti_TypeVO;
import kr.or.ddit.vo.common.UserAuthVO;
import kr.or.ddit.vo.common.UserVO;

public interface ISignMapper {
	public UserVO readByUserId(String username);
	
	public UserVO idCheck(String userId);

	public int signupUser(UserVO userVO);

	public void createAuth(UserAuthVO userAuth);

	public void createMember(MemberVO member);

	public int createNotiType(Noti_TypeVO notiTypeVO);

	public int createNotiSetting(Noti_SettingVO notiSettingVO);


	public String findPw(UserVO userVO);

	public UserVO findId(UserVO userVO);
	
	public void changePw(UserVO userVO);

	public void createMemberAddress(MemberVO member);

	public void setVisitTotalCount();

	public int getVisitTodayCount();

	public int getVisitTotalCount();


}
