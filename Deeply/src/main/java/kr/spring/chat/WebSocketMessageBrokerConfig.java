package kr.spring.chat;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketMessageBrokerConfig implements WebSocketMessageBrokerConfigurer{
	

	    @Override
	    public void configureMessageBroker(MessageBrokerRegistry config) {
	        // 클라이언트가 구독할 수 있는 prefix 설정
	        config.enableSimpleBroker("/topic");
	        // 클라이언트가 메시지 전송 시 사용할 prefix 설정
	        config.setApplicationDestinationPrefixes("/app");
	    }

	    @Override
	    public void registerStompEndpoints(StompEndpointRegistry registry) {
	        // SockJS를 사용하기 위한 엔드포인트 설정
	        registry.addEndpoint("/stompChat").setAllowedOrigins("*").withSockJS();
	   
	}
}