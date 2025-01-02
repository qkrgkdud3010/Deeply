package kr.spring.item.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.item.service.ItemService;
import kr.spring.item.vo.ItemVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.member.vo.PrincipalDetails;
import kr.spring.util.PagingUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	private ItemService itemService;
	
	//자바빈(VO)초기화
	@ModelAttribute
	public ItemVO initCommand() {
		return new ItemVO();
	}

	/*==============================
	 * 	상품 등록	
	 * =============================*/
	//등록 폼
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/write")
	public String form() {
		return "itemWrite";
	}
	//전송된 데이터 처리
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/write")
	public String submit(@Valid ItemVO itemVO,BindingResult result,HttpServletRequest request,RedirectAttributes redirect,@AuthenticationPrincipal PrincipalDetails principal) throws IllegalStateException, IOException {
		log.debug("<<상품 등록>> :" + itemVO);
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		//회원 번호 읽기
		MemberVO vo = principal.getMemberVO();
		itemVO.setUser_num(vo.getUser_num());
		//파일 업로드 안하면 어떻게 하는지 찾아보기
		
		//상품 등록하기
		itemService.insertItem(itemVO);
		
		redirect.addFlashAttribute("result","success");
		
		
		return "redirect:/item/list";
	}
	
	
	
	/*==============================
	 * 	상품 목록
	 * =============================*/
	@GetMapping("/list")
	public String getList(
			@RequestParam(defaultValue="1") int pageNum,
			@RequestParam(defaultValue="1") int order,
			String keyfield,String keyword,Model model) {
		
		log.debug("<<게시판 목록 - order>> : " + order);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체/검색 레코드수 
		int count = itemService.selectRowCount(map);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,pageNum,count,20,10,"list","&order="+order);
		
		List<ItemVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = itemService.selectList(map);
		}
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("page", page.getPage());
		
		return "itemList";
	}
	
	/*==============================
	 * 	상품 상세
	 * =============================*/
	@GetMapping("/detail")
	public String process(long item_num,Model model){
		log.debug("<<상품 상세 - item_num>> : " + item_num);
		
		ItemVO item = itemService.selectitem(item_num);
		
		model.addAttribute("item",item);	
		return "itemView";
	}

	
	
	
	
	
	
	
	
	/*==============================
	 * 	상품 글 수정
	 * =============================*/
}






























