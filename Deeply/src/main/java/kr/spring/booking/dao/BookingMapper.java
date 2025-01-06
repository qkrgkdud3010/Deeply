package kr.spring.booking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.booking.vo.BookingVO;
import kr.spring.event.vo.EventVO;
import kr.spring.seat.vo.SeatVO;


@Mapper
public interface BookingMapper {
	public List<EventVO> selectEventByArtistId(Map<String,Object> map);
	public Integer selectEventRowCount(Map<String,Object> map);
	@Select("SELECT * FROM performance_detail d LEFT OUTER JOIN performance_hall h ON d.hall_num = h.hall_num WHERE d.perf_num = #{perf_num}")
	public EventVO showEventDetail(long perf_num);
	public void registerBookingInfo(BookingVO bookingVO);
	@Select("SELECT COUNT(*) FROM seat WHERE hall_num=#{hall_num}")
	public int countSeatByHallNum(long hall_num);
	@Select("SELECT * FROM seat WHERE hall_num=#{hall_num}")
	public List<SeatVO> selectSeatByHallNum(long hall_num);
}
