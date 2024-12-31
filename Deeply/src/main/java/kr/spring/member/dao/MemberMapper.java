package kr.spring.member.dao;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	 @Select("SELECT SEQ_USER_NUM.nextval FROM dual")
	    long selectUser_num();

	    // 사용자 정보를 DB에 삽입하는 메소드
	    @Insert("INSERT INTO duser(user_num, id, nick_name) VALUES (#{user_num, jdbcType=BIGINT}, #{id}, #{nick_name})")
	    void insertMember(MemberVO member);
	public void insertMember_detail(MemberVO member);
	public MemberVO selectIdAndNickName(Map<String,String> map);

	public MemberVO selectCheckMember(String id);
	Optional<MemberVO> findByEmail(String email);
	public MemberVO selectMember(Long mem_num);
	void updateMember(MemberVO memberVO);

}










