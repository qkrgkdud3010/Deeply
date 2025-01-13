package kr.spring.payment.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FanVO {
	private Long fan_num;
	private Date fan_start;
	private Date fan_end;
	private Long fan_artist;
	private Long user_num;
	
	private Long user_bal;
	private String group_name;
	private String name;
}
