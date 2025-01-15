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
	//아티스트 아이디로 이벤트 목록 정렬(페이징 처리)
	public List<EventVO> selectEventByArtistId(Map<String,Object> map);
	//이벤트 목록 개수(페이징 처리)
	public Integer selectEventRowCount(Map<String,Object> map);
	//공연 번호 이용해서 공연 상세 정보 불러오기
	@Select("SELECT * FROM performance_detail d LEFT OUTER JOIN performance_hall h ON d.hall_num = h.hall_num WHERE d.perf_num = #{perf_num}")
	public EventVO showEventDetail(long perf_num);
	//예매 정보 등록
	public void registerBookingInfo(BookingVO bookingVO);
	//공연장에 따른 좌석 개수
	@Select("SELECT COUNT(*) FROM seat WHERE hall_num=#{hall_num}")
	public int countSeatByHallNum(long hall_num);
	//공연장에 따른 좌석 정보
	@Select("SELECT * FROM seat WHERE hall_num=#{hall_num}")
	public List<SeatVO> selectSeatByHallNum(long hall_num);
	//공연 정보 등록
	public void registerEvent(EventVO eventVO);
}
 