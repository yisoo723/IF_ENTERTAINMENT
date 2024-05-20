package kr.or.ddit.mapper.entertain;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.entertain.AlbumVO;
import kr.or.ddit.vo.entertain.ArtistGroupVO;
import kr.or.ddit.vo.entertain.ArtistVO;
import kr.or.ddit.vo.entertain.TrackListVO;
import lombok.extern.slf4j.Slf4j;


public interface IArtistMapper {

	public List<AlbumVO> albumList(String agId);
	public List<TrackListVO> selectAlbum(int alNo);
	public AlbumVO albumDetail(int alNo);
	public ArtistGroupVO profileList(String agId);
	public List<ArtistVO> artistSelect(String agId);
	public List<ArtistGroupVO> artistList();
	public List<ArtistGroupVO> adminList(PaginationInfoVO<ArtistGroupVO> pagingVO);
	public List<ArtistVO> adminArtistList();
	public int selectArtistListCount(PaginationInfoVO<ArtistGroupVO> pagingVO);
	
	public int deleteArtist(String agId);
	public List<UserVO> aritstListForm();
	public void groupInsert(ArtistGroupVO artistGroupVO1);
	public void insert(List<ArtistVO> artistList);
	public ArtistGroupVO artistGroupSelect(String agId);
	public List<ArtistVO> artistMemberSelect(String agId);
	public void memberInsert(ArtistVO artistVO);
	public void memberDelete(ArtistVO artistVO);
	public void groupUpdate(ArtistGroupVO artistGroupVO1);
	public void memberUpdate(ArtistVO artist);
	public int userProfileUpdate(ArtistVO artist);
	public int groupUpdate(PaginationInfoVO<ArtistGroupVO> pagingVO);
	public int albumUpdate(AlbumVO albumVO);
	public int albumInsert(AlbumVO albumVO);
	public void trackInsert(TrackListVO track);
	public int albumDelete(int alNo);
	public void artistDelete(ArtistVO artistVO);
	public int albumUpdates(AlbumVO albumVO);

}
