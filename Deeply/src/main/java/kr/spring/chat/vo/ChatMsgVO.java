package kr.spring.chat.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatMsgVO {
	
	
	private long chat_user_num; //채팅에 참여하는 유저
	private long chat_num; //채팅방 번호 
	
	
	//메세지 정보
	private long chatmsg_num; // 채팅 메세지 번호
	private String chat_msg; //채팅 메세지
	private int reply_status; // 채팅 메세지 개수 상한

}
