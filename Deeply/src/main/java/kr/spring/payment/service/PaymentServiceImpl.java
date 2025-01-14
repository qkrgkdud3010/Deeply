package kr.spring.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.member.vo.MemberVO;
import kr.spring.payment.dao.PaymentMapper;

@Service
@Transactional
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	PaymentMapper paymentMapper;
	
	@Override
	public void updateUser_bal(MemberVO member) {
		paymentMapper.updateUser_bal(member);
	}}
