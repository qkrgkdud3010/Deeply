package kr.spring.booking.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookingVO {
	private long booking_num;
	private long perf_num;
	private long user_num;
	private int booked_seat;
	private int total_price;
	private String booking_date;
	private String seat_num1;
	private String seat_num2;
	private String name;
	private String name2;
	private String phone;
	private String phone2;
	private String more_info;
	private String zipcode;
	private String address1;
	private String address2;
	
}
