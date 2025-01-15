package kr.spring.payment.service;

import kr.spring.member.vo.MemberVO;

import kr.spring.payment.vo.PaymentVO;

public interface PaymentService {
	public void insertOrder(PaymentVO payment);

}
