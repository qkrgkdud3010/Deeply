package kr.spring.event.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EventVO {
	private long perf_num;
	private long hall_num;
	private String hall_name;
	private String location;
	private int booked_amount;
	private long artist_num;
	private String mem_date;
	private String perf_date;
	private String perf_time;
	private String end_time;
	private String perf_status;
	private String perf_title;
	private String perf_desc;
	private int ticket_price;
	private int remaining_amount;
	private String reg_date;
	private String end_date;
	private int category;
	private String booking_deadline;
}
