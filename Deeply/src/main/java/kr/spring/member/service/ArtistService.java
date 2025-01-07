package kr.spring.member.service;

import java.util.Map;



import kr.spring.member.vo.ArtistVO;
import kr.spring.member.vo.MemberVO;



public interface ArtistService {
	public ArtistVO selectCheckMember(String id);
	public ArtistVO selectIdAndNickName(Map<String,String> map);
	public void insertMember(ArtistVO artist);
}
