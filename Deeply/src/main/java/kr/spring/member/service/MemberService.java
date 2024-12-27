package kr.spring.member.service;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MemberVO;
public interface MemberService {

	public MemberVO selectMember(Long mem_num);
	@Select("SELECT spmember_seq.nextval FROM dual")
	public Long selectMem_num();
	@Insert("INSERT INTO spmember (mem_num,id,nick_name) VALUES (#{mem_num},#{id},#{nick_name})")
	public void insertMember(MemberVO member);
	public void insertMember_detail(MemberVO member);
	public MemberVO selectIdAndNickName(Map<String,String> map);
	public MemberVO selectCheckMember(String id);
}
