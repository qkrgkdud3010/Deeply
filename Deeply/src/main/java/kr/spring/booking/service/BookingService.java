package kr.spring.booking.service;

import java.util.List;
import java.util.Map;

import kr.spring.booking.vo.BookingVO;
import kr.spring.booking.vo.BookingVO;
import kr.spring.event.vo.EventVO;
import kr.spring.seat.vo.SeatVO;

public interface BookingService {
	public List<EventVO> selectEventByArtistId(Map<String,Object> map);
	public Integer selectEventRowCount(Map<String,Object> map);
	public EventVO showEventDetail(long perf_num);
	public void registerBookingInfo(BookingVO bookingVO);
	public int countSeatByHallNum(long hall_num);
	public List<SeatVO> selectSeatByHallNum(long hall_num);
	public void registerEvent(EventVO eventVO);
	public void updatePerformanceStatus();
}
