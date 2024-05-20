package kr.or.ddit.controller.entertain;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.entertain.IArtistService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.entertain.AlbumVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 아티스트 앨범 수정 및 삭제 컨트롤러
 * @author 조재훈
 */
@Controller
@Slf4j
@RequestMapping("/entertain/artist/album")
public class ArtistAlbumModifyController {

	// 삭제여부 N -> Y 업데이트
	// 앨범 삭제시 해당 수록곡들도 함께 N -> Y 업데이트
	
	@Inject
	private IArtistService artistService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/albumUpdateForm.do", method = RequestMethod.GET)
	public String albumUpdateForm(int alNo, Model model) {
		
		AlbumVO albumVO = artistService.albumDetail(alNo);
		log.info("albumVO 123 " + albumVO);
//		model.addAttribute("artist",artistGroupVO);
		model.addAttribute("albumVO",albumVO);
		return "admin/entertain/albumUpdateForm";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/albumUpdate.do", method = RequestMethod.POST)
	public String albumUpdate(AlbumVO albumVO , Model model,
			HttpServletRequest req,
			RedirectAttributes ra) {
		
		log.info("albumVO 123 " + albumVO.getAlTempPhoto().getSize());
		model.addAttribute("albumVO",albumVO);
		
		ServiceResult result = artistService.albumUpdate(albumVO, req);
		
		if (result.equals(ServiceResult.OK)) {
	        req.getSession().setAttribute("message", "앨범 수정이 완료되었습니다.");
	    } else {
	        req.getSession().setAttribute("message", "서버 오류, 다시 시도해주세요.");
	    }
		return "redirect:/entertain/artist/profile/artistDetail.do?agId="+ albumVO.getAgId()+"#3";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/albumDelete.do", method = RequestMethod.POST)
	public ResponseEntity<?> albumDelete(int alNo, HttpServletRequest req) {
		log.info("asdgasdf" + alNo);
		int status = artistService.albumDelete(alNo);
		
			if(status > 0) {
	        String successMessage = "앨범이 삭제 되었습니다.";
	        return new ResponseEntity<>(successMessage, HttpStatus.OK);
	    } else {
	        String errorMessage = "앨범 삭제에 실패했습니다.";
	        return new ResponseEntity<>(errorMessage, HttpStatus.BAD_REQUEST);
	    }
	}
	

}
