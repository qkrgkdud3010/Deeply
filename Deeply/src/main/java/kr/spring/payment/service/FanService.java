package kr.spring.payment.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.ArtistVO;
import kr.spring.payment.vo.FanVO;

public interface FanService {
	//아티스트 정보 불러오기
	public ArtistVO artiInfo(Long user_num);
	public FanVO selectArtist(Long artist_num);

	//내 정보 조회
	Long getUser_bal(Long user_num);
	
	//팬인지 조회
	public FanVO selectFan(Long user_num, Long fan_artist);

	//팬클럽 가입
	public void updateUser_bal(Long user_num);
	public void joinFan(FanVO fan);
	
	//팬클럽 탈퇴신청
	public void removeFan(FanVO fan);
	//탈퇴 신청하고 만기일 된 팬정보 조회
	public FanVO noMoreFan(Long user_num, Long fan_artist);
	//만기일되면 탈퇴완료
	public void deleteFan(FanVO fan);
	
}
