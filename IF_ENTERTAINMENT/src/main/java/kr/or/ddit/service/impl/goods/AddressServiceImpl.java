package kr.or.ddit.service.impl.goods;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.goods.IAddressMapper;
import kr.or.ddit.service.goods.IAddressService;
import kr.or.ddit.vo.entertain.NationVO;
import kr.or.ddit.vo.goods.AddressVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AddressServiceImpl implements IAddressService {

	@Inject
	private IAddressMapper addressMapper;

	@Override
	public List<AddressVO> addressManaege(String userNo) {
		return addressMapper.addressManaege(userNo);
	}

	@Override
	public int addressInsert(AddressVO addressVO) {
		return addressMapper.addressInsert(addressVO);
	}

	@Override
	public int addressDelete(AddressVO addressVO) {
		return addressMapper.addressDelete(addressVO);
	}

	@Transactional(rollbackFor = {RuntimeException.class, IOException.class})
	@Override
	public int addressDefault(AddressVO addressVO) {
		int count = 0;
		int status = 0;
		int maNumber = 0;
		maNumber = addressMapper.addressDefault(addressVO);
		log.info("maNumber@@" + maNumber);
		if(maNumber >0) {
			count = addressMapper.addressDefaultUpdate(maNumber);
			log.info("status@@" + count);
		}
		if(count > 0 ) {
			status = addressMapper.addressDefaultInsert(addressVO);
		}
		return status;
	}

	@Override
	public List<NationVO> nationSelect() {
		return addressMapper.nationSelect();
	}

	@Override
	public int addressUpdate(AddressVO addressVO) {
		return addressMapper.addressUpdate(addressVO);
	}
}
