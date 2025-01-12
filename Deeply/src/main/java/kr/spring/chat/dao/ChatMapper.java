package kr.spring.chat.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import kr.spring.chat.vo.ChatVO;
import kr.spring.member.vo.ArtistVO;

@Mapper
public interface ChatMapper {
	/*****************
	채팅방 형성
	*******************/
	//아티스트가 (채팅방 들어가기)를 누르면 채팅방 정보가 새롭게 insert된다.
	public void insertChatroom(ChatVO chvo);
	
	//유저정보 insert 
	public void insertAuserInfo(ChatVO chvo);
	public void insertDuserInfo(ChatVO chvo);
	
	//중간테이블에 2가지 유저정보를 정보를 업데이트 시킨다.
	public void insertAuserChat(long chat_num);
	public void insertDuserChat(long chat_num );
	//최종 usertable에서 select하기
	
	//메세지 주고 받기

}
