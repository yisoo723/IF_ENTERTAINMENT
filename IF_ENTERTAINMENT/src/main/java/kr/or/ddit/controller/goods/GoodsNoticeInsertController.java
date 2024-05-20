package kr.or.ddit.controller.goods;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.goods.IGoodsNoticeService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.goods.GoodsNoticeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 굿즈샵 공지사항 등록 컨트롤러
 * @author 성이수
 */
@Controller
@Slf4j
@RequestMapping("/goods/notice")
public class GoodsNoticeInsertController {
	
	@Inject
	private IGoodsNoticeService goodsNoticeService;

	// 굿즈샵 관련 공지 등록 시 팝업 띄울지 여부 체크박스 넣기!
	
	/**
	 * 굿즈샵 공지사항 등록 화면을 띄우는 컨트롤러
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public String goodsNoticeInsertform(Model model) {
		return "admin/goods/addGoodsNotice";
	}
	
	/**
	 * 굿즈샵 공지사항을 등록하는 컨트롤러
	 * @param model
	 * @param goodsNoticeVO
	 * @param req
	 * @param ra
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String goodsNoticeInsert(
			Model model, GoodsNoticeVO goodsNoticeVO,
			HttpServletRequest req,
			RedirectAttributes ra) {
		
		String goPage= "";
		
		Map<String, String> errors = new HashMap<String, String>();
		
		if (StringUtils.isBlank(goodsNoticeVO.getBfTitle())) {
			errors.put("bfTitle", "제목을 입력해주세요.");
		}
		
		if (StringUtils.isBlank(goodsNoticeVO.getBfContent())) {
			errors.put("bfContent", "내용을 입력해주세요.");
		}
		
		if (goodsNoticeVO.getBfDisplay() == null) {
			goodsNoticeVO.setBfDisplay("N");
		}
		
		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("GoodsNoticeVO", goodsNoticeVO);
			goPage = "admin/goods/addGoodsNotice";
		}else {
			
			
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserVO userVO = user.getUser();
			int userNo = userVO.getUserNo();
			goodsNoticeVO.setUserNo(userNo);
			
			ServiceResult result = goodsNoticeService.insertGoodsNotice(req, goodsNoticeVO);
			
			if (result.equals(ServiceResult.OK)) { 
				ra.addFlashAttribute("message", "공지사항이 등록되었습니다.");
				goPage = "redirect:/goods/notice/detail.do?bfNo="+goodsNoticeVO.getBfNo();
			}else {
				model.addAttribute("message", "서버에러! 다시 시도해주세요!");
				goPage = "admin/goods/addGoodsNotice";
			}
		}
		return goPage;
	}
	
}
