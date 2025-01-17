package kr.spring.booking.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.booking.dao.BookingMapper;
import kr.spring.booking.vo.BookingVO;
import kr.spring.event.vo.EventVO;
import kr.spring.seat.vo.SeatVO;

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

	@Override
	public void registerBookingInfo(BookingVO bookingVO) {
		bookingMapper.registerBookingInfo(bookingVO);
		
	}

	@Override
	public int countSeatByHallNum(long hall_num) {
		return bookingMapper.countSeatByHallNum(hall_num);
		
	}

	@Override
	public List<SeatVO> selectSeatByHallNum(long hall_num) {
		return bookingMapper.selectSeatByHallNum(hall_num);
	}

	@Override
	public void registerEvent(EventVO eventVO) {
		bookingMapper.registerEvent(eventVO);
		
	}

	@Override
	public void updatePerformanceStatus() {
		bookingMapper.updatePerformanceStatus();
		
	}

	@Override
	public void deleteBookingBeforePay(long booking_num) {
		bookingMapper.deleteBookingBeforePay(booking_num);
		
	}

	@Override
	public void updateBookingPaymentStatus(long booking_num) {
		bookingMapper.updateBookingPaymentStatus(booking_num);
		
	}

	

	

}
