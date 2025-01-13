package kr.spring.item.vo;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ItemOrderVO {
	private long order_num;
	private long item_num;
	private long user_num;
	private int item_quantity;
	private int total_price;
	private Date order_date;
	private long pay_num;
	private int item_status; //1:결제 및 주문완료 2:배송 준비중 3: 배송 중 4: 배송완료 5: 주문 취소
	private String order_notice;
	
	
	

}
