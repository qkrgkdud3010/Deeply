package kr.spring.member.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.ArtistVO;
import kr.spring.member.vo.MemberVO;




@Mapper
public interface ArtistMapper {
	 @Select("SELECT SEQ_USER_NUM.nextval FROM dual")
	    long selectUser_num();

	    // 사용자 정보를 DB에 삽입하는 메소드
	    @Insert("INSERT INTO auser(user_num, id) VALUES (#{user_num, jdbcType=BIGINT}, #{id})")
	    void insertMember(ArtistVO artist);
	public void insertMember_detail(ArtistVO artist);
	public ArtistVO selectCheckMember(String id);
	public ArtistVO selectIdAndNickName(Map<String,String> map);
}
