package kr.spring.chat.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.chat.vo.ChatVO;

@Mapper
public interface ChatMapper {
	/*****************
	채팅방 형성
	*******************/
	//아티스트가 (채팅방 들어가기)를 누르면 채팅방 정보가 새롭게 insert된다.
	public void insertChatroom(ChatVO chvo);
	
	
	//유저정보 insert or update
	//중간 테이블 정보 update
	//메세지 주고 받기

}
