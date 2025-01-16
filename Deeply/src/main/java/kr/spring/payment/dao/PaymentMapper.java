package kr.spring.payment.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


import kr.spring.payment.vo.PaymentVO;

@Mapper
public interface PaymentMapper {
	 
	 @Select("SELECT PAYMENT_SEQ.nextval FROM dual")
	    long paymentNum();
	@Insert("INSERT INTO PAYMENT (pay_num, total_amount, user_num,buy_date) VALUES (#{PAY_NUM}, #{totalAmount}, #{USER_NUM} ,sysdate)")
	    void insertOrder(PaymentVO payment);

	    // 주문 상태 업데이트
	   
}
