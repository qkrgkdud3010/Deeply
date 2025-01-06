package kr.spring.event.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EventVO {
	private long perf_num;
	private long hall_num;
	@NotBlank
	private String hall_name;
	private String location;
	private int booked_amount;
	private long artist_num;
	@NotBlank
	private String mem_date;
	@NotBlank
	private String perf_date;
	@NotBlank
	private String perf_time;
	@NotBlank
	private String end_time;
	private String perf_status;
	@NotBlank
	private String perf_title;
	@NotEmpty
	private String perf_desc;
	@NotBlank
	private int ticket_price;
	private int remaining_amount;
	@NotBlank
	private String reg_date;
	@NotBlank
	private String end_date;
	@NotBlank
	private int category;
	@NotBlank
	private String booking_deadline;
}
