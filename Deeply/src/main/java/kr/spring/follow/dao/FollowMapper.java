package kr.spring.follow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import kr.spring.follow.vo.FollowVO;

@Mapper
public interface FollowMapper {
	//팔로우하기
	@Insert("INSERT INTO follow (follower_num, follow_num, follow_date) VALUES (#{follower_num},#{follow_num},sysdate)")
	public void following(FollowVO follow);
	//팔로우 취소
	@Delete("DELETE FROM follow WHERE follower_num=#{follower_num} and follow_num=#{follow_num}")
	public void unFollow(Long follow_num, Long follower_num);
	
	//내가 팔로우하는 리스트
	List<FollowVO> getMyFollow(Long user_num);
	//나를 팔로우하는 리스트
	List<FollowVO> getMyFollower(Long user_num);
	
}
