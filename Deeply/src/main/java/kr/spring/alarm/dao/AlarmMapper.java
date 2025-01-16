package kr.spring.alarm.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.alarm.vo.AlarmVO;

@Mapper
public interface AlarmMapper {
	
	/***************
	 * 아이템,채팅, 공연, 답장 알람 테이블에 insert하기
	 * *************/
	
	//답장 알람 테이블에 insert
	public void insertReplyAlarm(AlarmVO alvo);

}