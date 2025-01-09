package kr.spring.follow.service;

import java.util.List;
import java.util.Map;

import kr.spring.follow.vo.FollowVO;

public interface FollowService {
	//나의 팔로우 목록)마이페이지
	List<FollowVO> getMyFollow(Map<String,Object> map);
	public Integer countMyFollow(long follower_num);

	//팔로우 기능
	public FollowVO selectFollow(FollowVO follow);
	public void following(FollowVO follow);
	public void unfollow(FollowVO follow);
}
