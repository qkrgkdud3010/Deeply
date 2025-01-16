package kr.spring.alarm.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.alarm.vo.AlarmVO;


@Service
@Transactional
public interface AlarmService {
	
	public void insertReplyAlarm(AlarmVO alvo);
	

}
