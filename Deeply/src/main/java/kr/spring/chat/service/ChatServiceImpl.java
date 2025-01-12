package kr.spring.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.chat.dao.ChatMapper;
import kr.spring.chat.vo.ChatVO;
import kr.spring.member.vo.ArtistVO;


@Service
@Transactional
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatMapper chatMapper;
	
	@Override
	public void insertChatroom(ChatVO chvo) {
		chatMapper.insertChatroom(chvo);
		
	}

	@Override
	public void insertAuserInfo(ChatVO chvo) {
		chatMapper.insertAuserInfo(chvo);
		
	}


	@Override
	public void insertAuserChat(long chat_num) {
		chatMapper.insertAuserChat(chat_num);
		
	}

	@Override
	public void insertDuserInfo(ChatVO chvo) {
		// TODO Auto-generated method stub
		
	}

	
	
	


	

}