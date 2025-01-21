package kr.spring.chat.handler;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.json.JSONObject;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketTextHandler extends TextWebSocketHandler {
/*
	private final Set<WebSocketSession> sessions = ConcurrentHashMap.newKeySet();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		sessions.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String payload = message.getPayload();
		JSONObject jsonObject = new JSONObject(payload);
		for(WebSocketSession s:sessions) {
			s.sendMessage(new TextMessage(payload+"Hi"+jsonObject.get("user")+"! HOW may I help you?"));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws  Exception{
		sessions.remove(session);
	}
	*/
}
