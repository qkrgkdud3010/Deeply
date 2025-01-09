package kr.spring.chat.service;

import kr.spring.chat.vo.ChatVO;

public interface ChatService {
	
	//채팅방 형성하기
	public void insertChatroom(ChatVO chvo);
	
	//중간 테이블에 유저 및 아티스트 정보 넣기
	public void insertDuserInfo(Long chat_user_num);
	public void insertAuserInfo(Long chat_user_num);

}
