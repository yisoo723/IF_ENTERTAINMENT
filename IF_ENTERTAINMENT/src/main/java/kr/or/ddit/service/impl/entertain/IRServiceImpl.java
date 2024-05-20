package kr.or.ddit.service.impl.entertain;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.entertain.IIRMapper;
import kr.or.ddit.service.entertain.IIRService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.entertain.IREventVO;
import kr.or.ddit.vo.entertain.IRFileAttachVO;
import kr.or.ddit.vo.entertain.IRFileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IRServiceImpl implements IIRService {

	@Inject
	private IIRMapper irMapper;

	/**
	 * @author 서어진
	 * IR 행사
	 */
	
	@Override
	public ServiceResult insertIREvent(HttpServletRequest req, IREventVO ireventVO) {
		ServiceResult result = null;
		ireventVO.setIrSchedule(ireventVO.getIrSchedule().replace(",", " "));
		int status = irMapper.insertIREvent(ireventVO);
		if(status > 0) { 	// 등록 처리가 완료되었을 때
			irMapper.insertIREventDetail(ireventVO);
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public int selectIREventCount(PaginationInfoVO<IREventVO> pagingVO) {
		return irMapper.selectIREventCount(pagingVO);
	}

	@Override
	public List<IREventVO> selectIREventList(PaginationInfoVO<IREventVO> pagingVO) {
		return irMapper.selectIREventList(pagingVO);
	}

	@Override
	public IREventVO selectIREvent(int bfNo) {
		return irMapper.selectIREvent(bfNo); 
	}

	@Override
	public ServiceResult updateIREvent(HttpServletRequest req, IREventVO ireventVO) {
		ServiceResult result = null;
		int status = irMapper.updateIREvent(ireventVO);
		ireventVO.setIrSchedule(ireventVO.getIrSchedule().replace(",", " "));
		if(status > 0) { 
			irMapper.updateIREventDetail(ireventVO);
			result = ServiceResult.OK;
			
		} else { 
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult deleteIREvent(HttpServletRequest req, int bfNo) {
		ServiceResult result = null;
		IREventVO ireventVO = irMapper.selectIREvent(bfNo);
		int status = irMapper.deleteIREvent(bfNo);
		if(status > 0) { // 삭제 성공
			result = ServiceResult.OK;
		} else { // 삭제 실패
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	// 사용자
	@Override
	public int selectUserIREventCount(PaginationInfoVO<IREventVO> pagingVO) {
		return irMapper.selectUserIREventCount(pagingVO); 
	}

	@Override
	public List<IREventVO> selectUserIREventList(PaginationInfoVO<IREventVO> pagingVO) {
		return irMapper.selectUserIREventList(pagingVO); 
	}

	@Override
	public IREventVO selectUserIREvent(int bfNo) {
		return irMapper.selectUserIREvent(bfNo); 
	}
	
	// IR 자료실 관련 
	
	@Override
	public int selectFileCount(PaginationInfoVO<IRFileVO> pagingVO) {
		return irMapper.selectFileCount(pagingVO);
	}

	/**
	 * @author 홍진영
	 * 페이징 포함된 IR 자료실 리스트 조회
	 */
	@Override
	public List<IRFileVO> selectIRFileList(PaginationInfoVO<IRFileVO> pagingVO) {
		return irMapper.selectIRFileList(pagingVO);
	}

	/**
	 * @author 홍진영
	 * IR 자료실 글 등록 (글 등록 시 파일도 함께 등록되도록)
	 */
	@Override
	public ServiceResult insertIRFile(HttpServletRequest req, IRFileVO irFileVO) {
		ServiceResult result = null;
		
		// IR File 자료실 글 등록
		int status = irMapper.insertIRFile(irFileVO);
		
		// 작업이 성공적으로 처리 되었을 경우 파일도 함께 insert
		if(status > 0) {
			 List<IRFileAttachVO> fileList = new ArrayList<IRFileAttachVO>();
			 
			 fileList.add(new IRFileAttachVO(irFileVO.getIrPPT()));
			 fileList.add(new IRFileAttachVO(irFileVO.getIrPDF()));
			 
			 try {
				 irFileUpload(fileList, irFileVO.getBfNo(), req);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
			 result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public IRFileVO selectIRFile(int bfNo) {
		return irMapper.selectIRFile(bfNo);
	}

	@Override
	public List<IRFileAttachVO> getAttachFile(int bfNo) {
		return irMapper.getAttachFile(bfNo);
	}

	@Override
	public ServiceResult updateIRFile(HttpServletRequest req, IRFileVO irFileVO, int[] updateFileNos) {
		ServiceResult result = null;
		
		// IR File 자료실 글 수정
		int status = irMapper.updateIRFile(irFileVO);
		
		// 작업이 성공적으로 처리 되었을 경우 파일도 함께 update
		if(status > 0) {
			 List<IRFileAttachVO> fileList = new ArrayList<IRFileAttachVO>();
			 
			 fileList.add(new IRFileAttachVO(irFileVO.getIrPPT()));
			 fileList.add(new IRFileAttachVO(irFileVO.getIrPDF()));
			 
			 try {
				 irFileUpdate(fileList, irFileVO.getBfNo(), req, updateFileNos);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
			 result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	/**
	 * IR자료실 게시글 삭제
	 */
	@Override
	public ServiceResult deleteIRFile(int bfNo, HttpServletRequest req) {
		ServiceResult result = null;
		
		// 게시글을 삭제하기전 게시슬 번호에 해당하는 첨부파일들을 먼저 삭제한다.
		boolean delSuccess = deleteAttach(bfNo, req);
		

		if(delSuccess) { // 첨부파일 삭제에 성공했을 경우
			int status = irMapper.deleteIRFile(bfNo);
			
			if(status > 0) { // 게시물 삭제 성공 여부
				result = ServiceResult.OK;
			} 
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
	// ir 파일 게시글 번호에 해당하는 파일들을 모두 지운다.
	@Transactional(rollbackFor = {RuntimeException.class, Exception.class, IOException.class})
	private boolean deleteAttach(int bfNo, HttpServletRequest req) {
		String savePath = "/resources/irFile/";
		
		// 삭제할 파일 리스트를 가져온다.
		List<IRFileAttachVO> attachFileList = irMapper.selectIRFile(bfNo).getAttachFileList();
		
		boolean delSuccess = false; // 파일 삭제 성공 여부
		int status = irMapper.deleteIRAttachFile(bfNo);
		
		
		// 삭제에 성공했을 경우 실제 경로에서도 파일을 삭제한다.
		if(status > 0) {
			if(attachFileList != null && attachFileList.size() > 0) {
				for (IRFileAttachVO irFileAttachVO : attachFileList) {
					String saveLocate = req.getServletContext().getRealPath(savePath);
					saveLocate += irFileAttachVO.getBaSavepath();
					log.info("### saveLocate : {}", saveLocate);
					File file = new File(saveLocate);
					file.delete();
				}
			}
			delSuccess = true;
		}
		return delSuccess;
	}

	// ir 파일 업로드 메서드
	private void irFileUpload(List<IRFileAttachVO> fileList, int bfNo, HttpServletRequest req) throws IOException {
		String savePath = "/resources/irFile/";
		
		if(fileList != null && fileList.size() > 0) {
			for (IRFileAttachVO irFileAttachVO : fileList) {
				String savedName = UUID.randomUUID().toString();
				savedName += "_" + irFileAttachVO.getBaName().replaceAll(" ", "_");
				String saveLocate = req.getServletContext().getRealPath(savePath);
				File file = new File(saveLocate);
				if(!file.exists()) {	// 업로드를 하기 위한 폴더 구조가 존재하지 않을 때
					file.mkdirs(); 		// 폴더 생성
				}
				saveLocate += savedName; // 실제 업로드할 경로
				
				irFileAttachVO.setBfNo(bfNo);
//				irFileAttachVO.setBaSavepath(saveLocate);
				irFileAttachVO.setBaSavepath(savedName);
					
				irMapper.insertIRAttachFile(irFileAttachVO); 
				
				File saveFile = new File(saveLocate);
				irFileAttachVO.getItem().transferTo(saveFile);
				
			}
		}
	}
	
	// ir 파일 업데이트 메서드
	private void irFileUpdate(List<IRFileAttachVO> fileList, int bfNo, HttpServletRequest req, int[] updateFileNos) throws IOException {
		String savePath = "/resources/irFile/";
		
		if(fileList != null && fileList.size() > 0) {

			for (int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setBaNo(updateFileNos[i]);
				String savedName = UUID.randomUUID().toString();
				savedName += "_" + fileList.get(i).getBaName().replaceAll(" ", "_");
				String saveLocate = req.getServletContext().getRealPath(savePath);
				File file = new File(saveLocate);
				if(!file.exists()) {	// 업로드를 하기 위한 폴더 구조가 존재하지 않을 때
					file.mkdirs(); 		// 폴더 생성
				}
				saveLocate += savedName; // 실제 업로드할 경로
				fileList.get(i).setBaSavepath(savedName);
				irMapper.updateIRAttachFile(fileList.get(i));
				
				File saveFile = new File(saveLocate);
				fileList.get(i).getItem().transferTo(saveFile);
				
			}
			
		}
	}

}
