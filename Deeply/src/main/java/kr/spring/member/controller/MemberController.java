package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.member.vo.PrincipalDetails;
import kr.spring.util.CaptchaUtil;
import kr.spring.util.FileUtil;
import kr.spring.util.ValidationUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {


			
			@Value("${dataconfig.naver-client-id}")
	private String naver_client_id;
	@Value("${dataconfig.naver-client-secret}")
	private String naver_client_secret;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	/*===============================
	 * 회원가입
	 *===============================*/
	//회원가입 폼 호출
	@GetMapping("/registerUser")
	public String form() {
		return "memberRegister";
	}
	//회원가입 데이터 전송
	@PostMapping("/registerUser")
	public String submit(@Valid MemberVO memberVO,
			             BindingResult result,
			             Model model,
			             HttpServletRequest request) {
		log.debug("<<회원가입 - MemberVO>> : " + memberVO);
		
		//전송된 데이터 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			//유효성 체크 결과 오류 필드 출력
			ValidationUtil.printErrorFields(result);
			return form();
		}
		
		//Spring Security 암호화
		memberVO.setPasswd_hash(passwordEncoder.encode(
				                    memberVO.getPasswd_hash()));
		
		//회원가입
		memberService.insertMember(memberVO);
		
		//UI 메시지 처리
		model.addAttribute("accessTitle", "회원가입");
		model.addAttribute("accessMsg", 
				           "회원가입이 완료되었습니다.");
		model.addAttribute("accessBtn", "홈으로");
		model.addAttribute("accessUrl", 
				     request.getContextPath()+"/main/main");
		
		return "common/resultView";
	}
	@GetMapping("/login")
	public String formLogin(MemberVO memberVO,
			                BindingResult result,
			                HttpServletRequest request) {
		Map<String,?> flashMap = 
				RequestContextUtils.getInputFlashMap(request);
		if(flashMap != null) {
			String error = (String)flashMap.get("error");
			log.debug("<<로그인 체크 - error>> : " + error);
			if("username".equals(error)) {
				result.rejectValue(
						"id", "Pattern.id","아이디를 입력하세요");
			}
			if("password".equals(error)) {
				result.rejectValue(
				   "passwd", "Pattern.passwd","비밀번호를 입력하세요");
			}
			if("username_password".equals(error)) {
				result.rejectValue(
						"id", "Pattern.id","아이디를 입력하세요");
				result.rejectValue(
				 "passwd", "Pattern.passwd","비밀번호를 입력하세요");
			}
			if("error".equals(error)) {
				result.reject("invalidIdOrPassword");
			}
		}
		
		return "memberLogin";
	}
	
}







