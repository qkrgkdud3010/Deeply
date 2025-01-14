package kr.spring.payment.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	private Long pay_num;
	private int pay_status;
	private int pay_product;
	private int pay_price;
	private String pay_bank;
	private int pay_type;
	private int pay_money;
	private Long user_num;
}
