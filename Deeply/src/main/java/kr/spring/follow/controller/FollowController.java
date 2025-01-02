package kr.spring.follow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.follow.service.FollowService;
import kr.spring.follow.vo.FollowVO;

@Controller
@RequestMapping("/follow")
public class FollowController {
	@Autowired
	private FollowService followService;
	
	@PostMapping("/following")
	public String getfollow(@RequestParam Long follow_num, @RequestParam Long follower_num) {
		FollowVO follow = new FollowVO();
		follow.setFollow_num(follow_num);
		follow.setFollower_num(follower_num);
		followService.following(follow);
		
		return "redirect:/follow/list?follower_num="+follower_num;
	}
	
	@PostMapping("/unFollow")
	public String unfollow(@RequestParam Long follow_num, @RequestParam Long follower_num) {
		followService.unFollow(follow_num, follower_num);
		return "redirect:/follow/list?follower_num"+follower_num;
	}
	
	@PostMapping("/getMyFollow")
	public String list(@RequestParam Long user_num, Model model) {
		List<FollowVO> followList = followService.getMyFollow(user_num);
		model.addAttribute("followList", followList);
		return "follow/getMyFollow";
	}
	
	@PostMapping("/getMyFollower")
	public String list(@RequestParam long user_num, Model model) {
		List<FollowVO> followerList = followService.getMyFollower(user_num);
		model.addAttribute("followerList",followerList);
		return "follow/getMyFollower";
	}
	
}
