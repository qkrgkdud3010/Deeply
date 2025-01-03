package kr.spring.follow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.follow.dao.FollowMapper;
import kr.spring.follow.vo.FollowVO;

@Service
@Transactional
public class FollowServiceImpl implements FollowService{
	@Autowired
    private FollowMapper followMapper;

	@Override
	public void following(FollowVO follow) {
		followMapper.following(follow);
	}

	@Override
	public void unFollow(Long follow_num, Long follower_num) {
		followMapper.unFollow(follow_num, follower_num);
	}

	@Override
	public List<FollowVO> getMyFollow(Long user_num) {
		return followMapper.getMyFollow(user_num);
	}

	@Override
	public List<FollowVO> getMyFollower(Long user_num) {
		return followMapper.getMyFollower(user_num);
	}

}
