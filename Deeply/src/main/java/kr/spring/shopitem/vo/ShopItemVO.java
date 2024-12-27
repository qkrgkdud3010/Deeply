package kr.spring.shopitem.vo;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ShopItemVO {
	private int itemNum;        			// 상품 고유 번호 (PK)
	private int userNum;        			// 유저 번호 (FK)
	@NotBlank
	private String itemName;   		  		// 상품 이름
	@NotBlank
	private int itemPrice;     			    // 상품 가격
	@NotBlank
	private String itemDescription; 		// 상품 상세 설명 (CLOB)
	private java.util.Date itemRegdate;		// 상품 등록일 (자동 설정)
	private java.util.Date itemModifydate;	// 상품 수정일
	@NotBlank
	private int itemStock;      			// 상품 재고 수량
	
	
}
