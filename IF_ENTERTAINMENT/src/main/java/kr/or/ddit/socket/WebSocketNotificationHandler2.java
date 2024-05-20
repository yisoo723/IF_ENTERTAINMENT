package kr.or.ddit.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.itextpdf.text.pdf.hyphenation.TernaryTree.Iterator;

import kr.or.ddit.cofig.ServerEndpointConfigurator;
import kr.or.ddit.service.common.IWebSocketSevice;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.NotificationVO;
import kr.or.ddit.vo.common.UserVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 웹소켓 알림 관련 핸들러
 * 
 * @author 성이수
 */
@Component
//@ServerEndpoint(value = "/notiserver", configurator = ServerEndpointConfigurator.class)
@Slf4j
public class WebSocketNotificationHandler2 {
	// 웹 실시간 알림을 처리하기 위한 핸들러
	// 실시간 알림이 필요한 각 분야에서 해당 핸들러 호출하여 실시간 알림 보낼 수 있도록
	// 클라이언트가 서버에 연결할때 호출되는 메서드
	

	public WebSocketNotificationHandler2() {
		System.out.println("WebSocketNotificationHandler 생성자 호출됨...");
	}

	@Inject
	private IWebSocketSevice websocketService;

//	private static List<Session> list = new ArrayList<Session>();
	
//	private static List<Map<Session, String>> sessionMapList = new ArrayList<Map<Session, String>>();
//	private static Set<Session> sessionMapList = Collections.synchronizedSet(new HashSet<Session>());
	private static List<Map<Session, String>> sessionMapList = new ArrayList<Map<Session, String>>();

	private void print(String msg) {
		System.out.printf("[%tT] %s\n", Calendar.getInstance(), msg);
	}

	@OnOpen
	public void handleOpen(Session session) {
		
//		WebSocketSession webSession = (WebSocketSession) session;
//		Map<String,Object> attrMap = webSession.getAttributes();
		
		print("클라이언트 연결");

		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("@@@접속자 user : {}", user);
		UserVO userVO = user.getUser();
		
		//(특정사용자에게 알림을 보내야하는경우에는 로그인했을때의 아이디를 클라이언트에서 받아와서 비교해준다.)
//		list.add(session); // 접속자 관리
//		for (Session list : list) {
//			log.info("@@@접속자 list : {}", list);
//		}
		
//		Map<Session, String> map = new HashMap<Session, String>();
//		map.put(session, userVO.getUserId());
//		sessionMapList.add(map);
		
//		CustomUser user = (CustomUser) session.getAttributes().get("user");
//		UserVO userVO = user.getUser();
//		sessions.add(session);
	}

	@OnMessage
	public void handleMessage(String msg, Session session) {

		log.info("소켓 들어옴!!!!!!!" + msg);

		JsonParser jp = new JsonParser();
		JsonObject eleObj = jp.parse(msg).getAsJsonObject(); // 전체 json 데이터
		String type = eleObj.get("type").getAsString(); // 기준이 되는 타입을 꺼냄
		
//log.info("#### sessionMapList size : {}", sessionMapList.size());
		
//		for (Session m : sessionMapList) {
//				// 제약 조건이 없이 로그인 한 전체 사용자에게 메시지를 발송...
//				try {
//					String sendMsg = String.format(" %s 사용자가 알림을 발송 하였습니다. ", m.getUserPrincipal().getName());
//					m.getBasicRemote().sendText(sendMsg);
//					
//					log.info("sendMsg : {}", sendMsg);
//				
//				} catch (Exception e) {
//					return;
//				}
//		}

		// 타입 검열 (각자의 메소드로 이동)
		if (type.equals("goodsInquiry")) {
			inquiry(eleObj, session);
		}
		
//		Map<String, Object> mmap = session.getUserProperties();
//		StandardSessionFacade ss = (StandardSessionFacade) mmap.get("Session");
//		SecurityContext sc = (SecurityContext) ss.getAttribute("SPRING_SECURITY_CONTEXT");
//		log.info(sc.getAuthentication().getName());
//		log.info("sc user id : {}", sc.getAuthentication().getName());
//		log.info("session user Id : {}", session.getUserPrincipal().getName());
	}

	
//	private void inquiry(JsonObject eleObj) {
		
//		log.info("### eleObj : {}", eleObj);
		
//		String type = eleObj.get("type").getAsString();
//		String userId = eleObj.get("userId").getAsString();
//		String status = eleObj.get("status").getAsString();
//		String giNo = eleObj.get("giNo").getAsString();
//		String admin = "admin001";
//
//		NotificationVO notificationVO = new NotificationVO();
//		notificationVO.setNotiSender(admin);
//		notificationVO.setNotiReciever(userId);
//		notificationVO.setNotiType(type);
//		notificationVO.setNotiUrl("/goods/inquiry/detail.do?giNo=" + giNo);
//		if (status.equals("등록")) {
//			notificationVO.setNotiContent("1:1문의 답변이 등록되었습니다.");
//		} else {
//			notificationVO.setNotiContent("1:1문의 답변이 수정되었습니다.");
//		}
//		notificationVO.setNotiType(type);

//		ServiceResult result = null;
//		try {
//			ServiceResult res = websocketService.insertInquiry(notificationVO);
//			ServiceResult res = websocketService.insertInquiry(notificationVO);
//			int status1 = 1;
//			if (status1 > 0) {
//				result = ServiceResult.OK;
//			}else {
//				result = ServiceResult.FAILED;
//			}

//			Set<String> keySetList = sessionList.keySet();
//			Iterator<String> ite = keySetList.iterator();
//			if (result.equals(ServiceResult.OK)) {
//				while(ite.hasNext()) {
//					String key = ite.next();
//					log.info("핸들러에서 뽑은 key들 : " + key);
//					Session sess = sessionList.get(key);
//					log.info("세션정보 : " + sess.getId());
//					if (key.equals(userId)) {
//						try {
//							sess.getBasicRemote().sendText("알림");
//							 break;
//						} catch (Exception e) {
//							 e.printStackTrace();
//						}
//					}
//				}
//			} else {
//				
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}
	
	
	
	/**
	 * 1:1문의 답변에 대한 알림
	 * @param eleObj
	 * @param session
	 */
	private void inquiry(JsonObject eleObj, Session session) {

		for (Map<Session, String> m : sessionMapList) {
		Iterator it = (Iterator) m.keySet().iterator();
		while(it.hasMoreElements()) {
			String key = it.nextElement();
			String userId = (String) m.get(key);
			log.info("현재 로그인한 sessionId : {}", userId);
			}
		}
		
		
		String type = eleObj.get("type").getAsString();
		String userId = eleObj.get("userId").getAsString();
		String status = eleObj.get("status").getAsString();
		String giNo = eleObj.get("giNo").getAsString();
		String admin = "admin001";

		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setNotiSender(admin);
		notificationVO.setNotiReciever(userId);
		notificationVO.setNotiType(type);
		notificationVO.setNotiUrl("/goods/inquiry/detail.do?giNo=" + giNo);
		if (status.equals("등록")) {
			notificationVO.setNotiContent("1:1문의 답변이 등록되었습니다.");
		} else {
			notificationVO.setNotiContent("1:1문의 답변이 수정되었습니다.");
		}
		notificationVO.setNotiType(type);

		log.info("!!!!notificationVO : " + notificationVO);
		ServiceResult result = null;
		try {
			result = websocketService.insertInquiry(notificationVO);

			if (result.equals(ServiceResult.OK)) {
//				for (Session s : list) {
//					if (s != session) {
//						
//	                    // 여기서 특정 userId인 경우에만 알림을 보냄
//                        try {
//                            s.getBasicRemote().sendText("알림");
//                        } catch (IOException e) {
//                            e.printStackTrace();
//                        }
//	                }
//				}
			} else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@OnClose
	public void handleClose() {

	}

	@OnError
	public void handleError(Throwable t) {

	}



}
