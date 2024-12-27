package kr.spring.member.service;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;
@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	@Override
	public MemberVO selectCheckMember(String id) {
		return memberMapper.selectCheckMember(id);
	}
	@Override
	public MemberVO selectMember(Long mem_num) {
		return memberMapper.selectMember(mem_num);
	}
	@Override
	public Long selectMem_num() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void insertMember(MemberVO member) {
		memberMapper.insertMember(member);
		memberMapper.insertMember_detail(member);
		
	}
	@Override
	public void insertMember_detail(MemberVO member) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public MemberVO selectIdAndNickName(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}
}
