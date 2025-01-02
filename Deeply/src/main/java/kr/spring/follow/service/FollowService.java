package kr.spring.follow.service;

import java.util.List;


import kr.spring.follow.vo.FollowVO;

public interface FollowService {
	//팔로우하기
	public void following(FollowVO follow);
	//팔로우 취소
	public void unFollow(Long follow_num, Long follower_num);

	//내가 팔로우하는 리스트
	List<FollowVO> getMyFollow(Long user_num);
	//나를 팔로우하는 리스트
	List<FollowVO> getMyFollower(Long user_num);
}
