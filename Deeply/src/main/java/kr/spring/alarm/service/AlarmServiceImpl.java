package kr.spring.alarm.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.spring.alarm.dao.AlarmMapper;
import kr.spring.alarm.vo.AlarmVO;


public class AlarmServiceImpl implements AlarmService{

	@Autowired
	AlarmMapper alarmMapper;
	
	@Override
	public void insertReplyAlarm(AlarmVO alvo) {
		
		alarmMapper.insertReplyAlarm(alvo);
		
		
	}

}
