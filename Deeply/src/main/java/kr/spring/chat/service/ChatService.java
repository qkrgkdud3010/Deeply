package kr.spring.chat.service;

import kr.spring.chat.vo.ChatVO;
import kr.spring.member.vo.ArtistVO;

public interface ChatService {
	
	//채팅방 형성하기
	public void insertChatroom(ChatVO chvo);
	
	//로그인된 아이디 정보 채팅 유저 테이블에 넣기
	public void insertDuserInfo(ChatVO chvo);
	public void insertAuserInfo(ChatVO chvo);
	
	//중간테이블에 두가지 유저 정보 넣기
	public void insertAuserChat(long chat_num);
	//public void insertDuserChat(ChatVO chvo);
	
	


}
