package kr.spring.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kr.spring.member.dao.ArtistMapper;
import kr.spring.member.vo.ArtistVO;

@Service
public class ArtistServiceImple implements kr.spring.member.service.ArtistService {
	@Autowired
	private ArtistMapper artistMapper;
	@Override
	public ArtistVO selectCheckMember(String id) {
		
		return artistMapper.selectCheckMember(id);
	}
	@Override
	public ArtistVO selectIdAndNickName(Map<String, String> map) {
		return artistMapper.selectIdAndNickName(map);
	}
	@Override
	public void insertMember(ArtistVO artist) {
		long user_num = artistMapper.selectUser_num(); 
		artist.setUser_num(user_num);

        // 회원 정보를 삽입
        artistMapper.insertMember(artist);
        artistMapper.insertMember_detail(artist);
		
	}



}
