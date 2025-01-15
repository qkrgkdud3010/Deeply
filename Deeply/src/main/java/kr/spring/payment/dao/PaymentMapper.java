package kr.spring.payment.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

import kr.spring.payment.vo.PaymentVO;

@Mapper
public interface PaymentMapper {
	  @Insert("INSERT INTO PAYMENT (pay_num, total_amount, status, user_num) VALUES (#{PAY_NUM,jdbcType=VARCHAR}, #{totalAmount}, #{status,jdbcType=VARCHAR}, #{USER_NUM})")
	    void insertOrder(PaymentVO payment);

	    // 주문 상태 업데이트
	   
}
