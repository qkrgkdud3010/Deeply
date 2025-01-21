package kr.spring.chat.vo;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
public class ChatMsgVO {
	
	
	private Long chat_user_num; //채팅에 참여하는 유저
	private Long chat_num; //채팅방 번호 
	
	
	//메세지 정보
	private Long chatmsg_num; // 채팅 메세지 번호
	private String chat_msg; //채팅 메세지
	private int reply_status; // 채팅 메세지 개수 상한

	
	
	public ChatMsgVO(Long chat_user_num, Long chat_num, Long chatmsg_num, String chat_msg, int reply_status) {
		this.chat_user_num = chat_user_num;
		this.chat_num = chat_num;
		this.chatmsg_num = chatmsg_num;
		this.chat_msg = chat_msg;
		this.reply_status = reply_status;
		
	}
	
	public ChatMsgVO() {
		
	}
	
	
	
}
