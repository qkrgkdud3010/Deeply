package kr.spring.item.vo;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ItemVO {
	private long item_num;        			// 상품 고유 번호 (PK)
	private long user_num;        			// 유저 번호 (FK)
	@NotBlank
	private String item_name;   		  		// 상품 이름
	private MultipartFile upload;				//파일
	@NotBlank
	private String filename;					//파일명
	@NotBlank
	private int item_price;     			    // 상품 가격
	@NotBlank
	private String item_description; 		// 상품 상세 설명 (CLOB)
	private java.util.Date item_regdate;		// 상품 등록일 (자동 설정)
	private java.util.Date item_modifydate;	// 상품 수정일
	@NotBlank
	private int item_stock;      			// 상품 재고 수량
	
	private String name; //아티스트 이름
}
