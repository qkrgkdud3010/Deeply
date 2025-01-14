package kr.spring.payment.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface PaymentMapper {
	public void updateUser_bal(MemberVO member);
}
