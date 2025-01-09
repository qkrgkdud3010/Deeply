package kr.spring.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.chat.dao.ChatMapper;
import kr.spring.chat.vo.ChatVO;


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
	public void insertDuserInfo(Long chat_user_num) {
		
		chatMapper.insertDuserInfo(chat_user_num);
	}

	@Override
	public void insertAuserInfo(Long chat_user_num) {
		
		 chatMapper.insertAuserInfo(chat_user_num);;
	}

	

}
