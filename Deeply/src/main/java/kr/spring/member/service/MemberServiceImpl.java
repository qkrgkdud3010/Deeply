package kr.spring.member.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
    public void insertMember(MemberVO member) {
        // 시퀀스 값을 가져와서 user_num에 설정
    	long user_num = memberMapper.selectUser_num(); 
        member.setUser_num(user_num);

        // 회원 정보를 삽입
        memberMapper.insertMember(member);
        memberMapper.insertMember_detail(member);
       
    }

	@Override
	public MemberVO selectIdAndNickName(Map<String, String> map) {
		return memberMapper.selectIdAndNickName(map);

	}
	

	public static Map<String, String> verificationCodes = new HashMap<>();
	    

	    public void registerMember(MemberVO memberVO) {
	        // 이메일 중복 검사
	        Optional<MemberVO> existingMember = memberMapper.findByEmail(memberVO.getEmail());
	        if (existingMember.isPresent()) {
	            throw new RuntimeException("이미 가입된 이메일입니다.");
	        }
	      
	        // 인증 상태 초기화
	        memberMapper.insertMember(memberVO);  // 회원 정보 저장
	    }

	    public String verifyEmail(String email, String code) {
	        String storedCode = verificationCodes.get(email);
	        if (storedCode == null || !storedCode.equals(code)) {
	            return "fail";
	        }
	        return "verified";
	    }

	    public void storeVerificationCode(String email, String code) {
	        verificationCodes.put(email, code);
	    }

		@Override
		public Optional<MemberVO> findByEmail(String email) {
		    // memberMapper.findByEmail(email)이 null일 수 있으므로 Optional로 감싼다
		   
		    return memberMapper.findByEmail(email);
		}

	    
	    


}
