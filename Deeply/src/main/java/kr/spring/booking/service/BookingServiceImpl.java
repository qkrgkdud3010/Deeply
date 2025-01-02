package kr.spring.booking.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.booking.dao.BookingMapper;
import kr.spring.event.vo.EventVO;

@Service
@Transactional
public class BookingServiceImpl implements BookingService{
	
	@Autowired
	BookingMapper bookingMapper;

	@Override
	public List<EventVO> selectEventByArtistId(Map<String, Object> map) {
		return bookingMapper.selectEventByArtistId(map);
	}

	@Override
	public Integer selectEventRowCount(Map<String, Object> map) {
		return bookingMapper.selectEventRowCount(map);
	}

	@Override
	public EventVO showEventDetail(long perf_num) {
		return bookingMapper.showEventDetail(perf_num);
	}

}
