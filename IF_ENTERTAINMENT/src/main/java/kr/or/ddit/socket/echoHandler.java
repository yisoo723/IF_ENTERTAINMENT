package kr.or.ddit.socket;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.handler.TextWebSocketHandler;


@Component
@RequestMapping("/notiserver")
public class echoHandler extends TextWebSocketHandler {
	
}
