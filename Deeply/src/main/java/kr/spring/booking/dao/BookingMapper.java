package kr.spring.booking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.event.vo.EventVO;


@Mapper
public interface BookingMapper {
	public List<EventVO> selectEventByArtistId(Map<String,Object> map);
	public Integer selectEventRowCount(Map<String,Object> map);
}
