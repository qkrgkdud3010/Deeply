package kr.spring.booking.service;

import java.util.List;
import java.util.Map;

import kr.spring.event.vo.EventVO;

public interface BookingService {
	public List<EventVO> selectEventByArtistId(Map<String,Object> map);
	public Integer selectEventRowCount(Map<String,Object> map);
	public EventVO showEventDetail(long perf_num);
}
