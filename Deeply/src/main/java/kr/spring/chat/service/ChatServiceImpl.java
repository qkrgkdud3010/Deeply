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
	public void insertDuserInfo(ChatVO chvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertAuserChat(ChatVO chvo) {
		chatMapper.insertAuserChat(chvo);
		
	}

	@Override
	public Long selectChatnum(Long auser_num) {
		
		return chatMapper.selectChatnum(auser_num);
	}

	@Override
	public void updateAuserKind(Long chat_num) {
		 chatMapper.updateAuserKind(chat_num);
		
	}

	@Override
	public void insertDuserChat(ChatVO chvo) {
		// TODO Auto-generated method stub
		
	}

	



	
	

	

	
	
	
	


	

}