package kr.spring.alarm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.alarm.dao.AlarmMapper;
import kr.spring.alarm.vo.AlarmVO;

@Service
@Transactional
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	AlarmMapper alarmMapper;
	
	@Override
	public void insertReplyAlarm(AlarmVO alvo) {
		
		alarmMapper.insertReplyAlarm(alvo);
		
		
	}

}
