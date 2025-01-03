package kr.spring.follow.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FollowVO {
	private Long follow_num;
	private Long follower_num;
	private Long follow_arti_num;
	private Date follow_date;
}
