package kr.or.ddit.service.impl.goods;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.common.IWebSocketMapper;
import kr.or.ddit.mapper.goods.IGoodsPurchaseMapper;
import kr.or.ddit.service.goods.IGoodsPurchaseService;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.AddressVO;
import kr.or.ddit.vo.goods.CartVO;
import kr.or.ddit.vo.goods.GoodsVO;
import kr.or.ddit.vo.goods.OrderVO;
import kr.or.ddit.vo.goods.goodsBuyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GoodsPurchaseServiceImpl implements IGoodsPurchaseService {

	@Inject
	private IGoodsPurchaseMapper goodsPurchaseMapper;

	@Inject
	private IWebSocketMapper websocketMapper;

	@Override
	public List<CartVO> cartSelect(String userNo) {
		return goodsPurchaseMapper.cartSelect(userNo);
	}

	@Override
	public List<CartVO> selectArtist(List<CartVO> cartList) {
		// artistList를 빈 리스트로 초기화
		List<CartVO> artistList = new ArrayList<>();
		for (CartVO cartVO : cartList) {
			String goodsNo = cartVO.getGoodsNo();
			CartVO goodsArtist = goodsPurchaseMapper.selectArtist(goodsNo);
			artistList.add(goodsArtist);
		}
		log.info("artistList" + artistList);
		return artistList;
	}

	@Override
	public List<AddressVO> addressSelect(String userNo) {
		return goodsPurchaseMapper.addressSelect(userNo);
	}

	@Override
	public String selectUserName(String userNo) {
		return goodsPurchaseMapper.selectUserName(userNo);
	}

	@Override
	public int addressInsert(OrderVO orderVO) {
		orderVO.setMaTelno(orderVO.getMaTelno1() + orderVO.getMaTelno2() + orderVO.getMaTelno3());
		return goodsPurchaseMapper.addressInsert(orderVO);
	}

	@Override
	public String selectMaNumber(int userNo) {
		return goodsPurchaseMapper.selectMaNumber(userNo);
	}

	@Transactional(rollbackFor = {RuntimeException.class, IOException.class})
	@Override
	public int purchaseInsert(OrderVO orderVO) {
		// 주문번호만들깅-> 오늘날짜일단 가져와서 240101 형식으로 만듦
		int count = 0;
		String todayStr = new SimpleDateFormat("yyMMdd").format(new Date());
		log.info("todayStr" + todayStr);
		String lastOrderNo = goodsPurchaseMapper.selectOrderNo(todayStr);
		log.info("lastOrderNo" + lastOrderNo);

		String newOrderNo = null;
		if (lastOrderNo != null) {
			// 기존에 오늘 날짜로 시작하는 order_no가 있을 경우
			long nextSeq = Long.parseLong(lastOrderNo.substring(6)) + 1;
			newOrderNo = todayStr + String.format("%05d", nextSeq); // 새로운 순번을 오늘 날짜에 붙여서 완성
			// 기존에 오늘날짜 xxxxxx
		} else {
			newOrderNo = todayStr + "00001";
		}
		log.info("newOrderNo" + newOrderNo);
		orderVO.setOrderNo(newOrderNo);
		count = goodsPurchaseMapper.orderInsert(orderVO);
		if (count > 0) {
			// 뭐엿더라 .. 유저넘버로 카트에있는 정보끌어오기 .. goodsname, goods수량 , goods 가격 ,goodsno
			List<OrderVO> orderDetailList = new ArrayList<OrderVO>();
			if (orderVO.getGoodsName() == null || orderVO.getGoodsName().trim().equals("")) {
				orderDetailList = goodsPurchaseMapper.selectCart(orderVO);
				// 굿즈넘버로 멤버십 정보가져오기 .. 인서트해야되서
				for (OrderVO orderVO2 : orderDetailList) {
					String goodsMembership = goodsPurchaseMapper.selectMemberShip(orderVO2.getGoodsNo());
					log.info("goodsMembership" + goodsMembership);
					if (goodsMembership.equals("M")) {
						OrderVO orderVO3 = new OrderVO();
						orderVO3.setUserNo(orderVO.getUserNo());
						orderVO3.setGoodsNo(orderVO2.getGoodsNo());
						String cjNo = goodsPurchaseMapper.selectCjNo(orderVO3);
						log.info("cjNo" + cjNo);
						String confirmCjNo = goodsPurchaseMapper.selectConfirmCjNo(cjNo);
						if (confirmCjNo == null || confirmCjNo.equals("")) {
							goodsPurchaseMapper.insertCjNo(cjNo);
						} else {
							goodsPurchaseMapper.updateCjNo(cjNo);
						}
					}
				}
				for (OrderVO orderVO2 : orderDetailList) {
					orderVO2.setOrderNo(orderVO.getOrderNo());
//				orderVO2.setGcId(orderVO2.getGoodsNo());
				}
				// 이제 저걸 orderdetail에 인서트해야함
				for (OrderVO orderVO2 : orderDetailList) {
					// 딜리트 디테일에 삽입
					goodsPurchaseMapper.orderDetailInsert(orderVO2);
					// 재고 감소
					goodsPurchaseMapper.quantityDecrease(orderVO2);
				}

				goodsPurchaseMapper.cartDelete(orderVO);
			} else {
				OrderVO newOrderVO = new OrderVO();
				newOrderVO.setGoodsPrice(orderVO.getGoodsPrice());
				newOrderVO.setGoodsName(orderVO.getGoodsName());
				newOrderVO.setGoodsQuantity(orderVO.getGoodsQuantity());
				newOrderVO.setGoodsThumbnail(orderVO.getGoodsThumbnail());
				newOrderVO.setGoodsNo(orderVO.getGoodsNo());
				orderDetailList.add(newOrderVO);

				String goodsMembership = goodsPurchaseMapper.selectMemberShip(newOrderVO.getGoodsNo());
				log.info("goodsMembership" + goodsMembership);
				if (goodsMembership.equals("M")) {
					OrderVO orderVO3 = new OrderVO();
					orderVO3.setUserNo(orderVO.getUserNo());
					orderVO3.setGoodsNo(newOrderVO.getGoodsNo());
					String cjNo = goodsPurchaseMapper.selectCjNo(orderVO3);
					log.info("cjNo" + cjNo);
					String confirmCjNo = goodsPurchaseMapper.selectConfirmCjNo(cjNo);
					if (confirmCjNo == null || confirmCjNo.equals("")) {
						goodsPurchaseMapper.insertCjNo(cjNo);
					} else {
						goodsPurchaseMapper.updateCjNo(cjNo);
					}
				}

				for (OrderVO orderVO2 : orderDetailList) {
					orderVO2.setOrderNo(orderVO.getOrderNo());
				}
				for (OrderVO orderVO2 : orderDetailList) {
					// 딜리트 디테일에 삽입
					goodsPurchaseMapper.orderDetailInsert2(orderVO2);
					// 재고 감소
					goodsPurchaseMapper.quantityDecrease2(orderVO2);

					// 현재재고수량, 최소수량, 발주할 수량을 가져옴
					GoodsVO goodsVO = goodsPurchaseMapper.selectInventory(orderVO2.getGoodsNo());
					int gbPrice = (int)(goodsVO.getGoodsPrice() * 0.6);

					goodsVO.setGbPrice(gbPrice);
					
					int GoodsQuantity = goodsVO.getGoodsQuantity();
					int GoodsAutocndtn = goodsVO.getGoodsAutocndtn();
					if (GoodsQuantity <= GoodsAutocndtn) {
						// 재고 감소 후 재고를 체크해봤을 때 5개 이하라면 발주 진행(내역에 인서트 정도만)(성이수)
						goodsPurchaseMapper.insertGoodsBuy(goodsVO);
					}
				}
			}

		}
		return count;
	}

	@Override
	public OrderVO selectTotalOrderPrice(int userNo) {
		return websocketMapper.selectTotalOrderPrice(userNo);
	}

	@Override
	public int selectAutoOrderListCount(PaginationInfoVO<goodsBuyVO> pagingVO) {
		return goodsPurchaseMapper.selectAutoOrderListCount(pagingVO);
	}

	@Override
	public List<goodsBuyVO> selectAutoOrderList(PaginationInfoVO<goodsBuyVO> pagingVO) {
		return goodsPurchaseMapper.selectAutoOrderList(pagingVO);
	}
}
