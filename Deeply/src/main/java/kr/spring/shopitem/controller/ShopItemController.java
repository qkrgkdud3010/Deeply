package kr.spring.shopitem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

//import kr.spring.shopitem.service.ShopItemService;
import kr.spring.shopitem.vo.ShopItemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopItemController {
	//private ShopItemService shopItemService;
	
	//자바빈(VO)초기화
	@ModelAttribute
	public ShopItemVO initCommand() {
		return new ShopItemVO();
	}

	/*==============================
	 * 	상품 등록	
	 * =============================*/
	//등록 폼
	@GetMapping("/write")
	public String form() {
		return "shopItemWrite";
	}
}
