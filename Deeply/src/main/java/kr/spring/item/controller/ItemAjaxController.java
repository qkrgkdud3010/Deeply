package kr.spring.item.controller;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.item.service.ItemService;
import kr.spring.item.vo.CartVO;
import kr.spring.item.vo.ItemVO;
import kr.spring.member.vo.PrincipalDetails;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemAjaxController {
	@Autowired
	private ItemService itemService;
	
	//자바빈(VO)초기화
	@ModelAttribute
	public ItemVO initCommand() {
		return new ItemVO();
	}
	
	@PostMapping("/addCart")
	@ResponseBody
	public Map<String, Object> addCart(@RequestBody CartVO cartVO,
	                                   @AuthenticationPrincipal PrincipalDetails principal,
	                                   Model model, HttpServletRequest request) {

	    Map<String, Object> mapJson = new HashMap<>();

	    // 로그인 여부 확인
	    if (principal == null || principal.getMemberVO() == null) {
	        mapJson.put("result", "logout");
	        return mapJson;
	    }

	    // 사용자 정보 설정
	    cartVO.setUser_num(principal.getMemberVO().getUser_num());

	    try {
	        // 장바구니 삽입
	        itemService.insertCart(cartVO);
	        mapJson.put("result", "success");
	    } catch (Exception e) {
	        mapJson.put("result", "error");
	    }

	    return mapJson;
	}

}
