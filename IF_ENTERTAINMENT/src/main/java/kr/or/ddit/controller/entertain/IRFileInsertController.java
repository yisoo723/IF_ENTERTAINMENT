package kr.or.ddit.controller.entertain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.entertain.IIRService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.entertain.IRFileAttachVO;
import kr.or.ddit.vo.entertain.IRFileVO;
import lombok.extern.slf4j.Slf4j;

/**
 * IR자료 등록 컨트롤러
 * @author 홍진영
 */
@Controller
@Slf4j
@RequestMapping("/entertain/irFile")
public class IRFileInsertController {
	
	@Inject
	private IIRService IRService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/insert.do", method = RequestMethod.GET)
	public String irFileInsertForm() {
		return "admin/entertain/IRFileForm";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/insert.do", method = RequestMethod.POST)
	public String irFileInsert(IRFileVO irFileVO, Model model,
			RedirectAttributes ra, HttpServletRequest req) {
		String goPage = "";
		
		// 에러 발생시 정보를 담을 맵을 선언한다.
		Map<String, String> errors = new HashMap<String, String>();
		
		// Title 유효성 검사
		if(StringUtils.isBlank(irFileVO.getBfTitle())) {
			errors.put("bfTitle", "제목을 입력해주세요!");
		}
		
		if(errors.size() > 0) { // 제목이 입력되지 않았을 경우
			model.addAttribute("errors", errors);
			model.addAttribute("irFileVO", irFileVO);
			model.addAttribute("ppt", irFileVO.getIrPPT().getOriginalFilename());
			model.addAttribute("pdf", irFileVO.getIrPDF().getOriginalFilename());
			goPage = "admin/entertain/IRFileForm";
			
		} else { // 데이터가 정상적으로 입력이 되었을 경우
			
			// 시큐리티로 인증/인가 된 객체를 가져온다.
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserVO userVO = user.getUser();
			
			if(userVO != null) { // 인증인가가 제대로 된 객체가 있다면
				
				irFileVO.setUserNo(userVO.getUserNo());
				ServiceResult result = IRService.insertIRFile(req, irFileVO);
				if(result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "게시글 등록이 성공했습니다!");
					goPage = "redirect:/entertain/irFile/admin/IRFileList.do";
				} else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요!");
					model.addAttribute("irFileVO", irFileVO);
					goPage = "admin/entertain/IRFileForm";
				}
			} else {
				ra.addFlashAttribute("message", "로그인 후에 사용 가능합니다!");
				goPage="redirect:/signin.do";
			}
		}
		
		return goPage;
	}
	
}
