package kr.spring.item.vo;

import java.sql.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
public class CartVO {
	private long cart_num;
	private long item_num;
	private long user_num;
	private Date reg_date;
	private long order_quantity;
	
	private String item_name;
	@Min(value = 1, message = "구매개수는 최소 1개 이상이어야 합니다.")
	@Max(value = 2, message = "구매개수는 최대 3개 입니다.")
	private int item_quantity;
	private int total_price;
	private MultipartFile upload;				//파일
	private String filename;					//파일명
	
}
