package kr.spring.member.service;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MemberVO;
public interface MemberService {


	

	public void insertMember(MemberVO member);

	public MemberVO selectIdAndNickName(Map<String,String> map);
	public MemberVO selectCheckMember(String id);
	 public void registerMember(MemberVO memberVO);
	 public String verifyEmail(String email, String code);
	 public void storeVerificationCode(String email, String code);
	 public Optional<MemberVO> findByEmail(String email);



}
