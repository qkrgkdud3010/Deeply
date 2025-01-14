package kr.spring.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.member.vo.PrincipalDetails;
import kr.spring.payment.service.PaymentService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/charge")
public class PaymentController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private PaymentService paymentService;
	/*
	 * 
	@PostMapping("/chargeMoney")
	public String chargeMoney(@RequestParam("pay_price") int payPrice, @AuthenticationPrincipal PrincipalDetails principal) {

	    // 사용자 정보 가져오기
	    Long user_num = principal.getMemberVO().getUser_num();
	    MemberVO member = member.selectMember2(user_num);

	    // 예치금 업데이트
	    int newBalance = member.getUser_bal() + payPrice;
	    paymentService.updateUser_bal(member);

	    // 원하는 페이지로 리다이렉트
	    return "redirect:/desiredPage";
	}
	 */
}
