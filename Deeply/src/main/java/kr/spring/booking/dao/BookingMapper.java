package kr.spring.booking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.event.vo.EventVO;


@Mapper
public interface BookingMapper {
	public List<EventVO> selectEventByArtistId(Map<String,Object> map);
	public Integer selectEventRowCount(Map<String,Object> map);
	@Select("SELECT * FROM performance_detail d LEFT OUTER JOIN performance_hall h ON d.hall_num = h.hall_num WHERE d.perf_num = #{perf_num}")
	public EventVO showEventDetail(long perf_num);
}
