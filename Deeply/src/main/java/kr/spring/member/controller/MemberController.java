package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.service.EmailService;
import kr.spring.member.service.MemberService;
import kr.spring.member.service.MemberServiceImpl;
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
	@Autowired
	private EmailService emailService;
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

	//인증번호 전송
	@PostMapping("/emailSubmit")
	@ResponseBody
	public Map<String, String> emailSubmit(@RequestBody Map<String, String> request) {
		Map<String, String> response = new HashMap<>();
		String email= request.get("email");
		Optional<MemberVO> existingMember = memberService.findByEmail(email);
		if (existingMember.isPresent()) {
			response.put("result", "fail");
			return response;
		}
		String verificationCode = emailService.generateVerificationCode();
		emailService.sendVerificationEmail(email, verificationCode);
		MemberServiceImpl.verificationCodes.put(email,verificationCode );

		response.put("email",email); 
		response.put("code",verificationCode);

		return response;
	}


	//회원가입 데이터 전송
	@PostMapping("/registerUser")
	public @ResponseBody Map<String, String> registerUser(@Valid MemberVO memberVO, 
			BindingResult result) {
		Map<String, String> response = new HashMap<>();

		// 유효성 검사 결과 오류가 있으면, 오류 메시지를 response에 추가
		if (result.hasErrors()) {
			if(result.hasFieldErrors("email")) {
				response.put("error", "이메일을 제대로 입력해주새요.");}
			else if(result.hasFieldErrors("code")) {
				response.put("error", "코드를 입력해주세요");
			}
			else if(result.hasFieldErrors("id")) {
				response.put("error", "아이디는 4~12자의 영문자와 숫자로 구성되어야 합니다.");
			} else if (result.hasFieldErrors("passwd_hash")) {
				response.put("error", "비밀번호는 8~20자의 영문자, 숫자, 특수문자로 구성되어야 합니다.");
			}else if(!memberVO.getPasswd_hash().equals(memberVO.getConfirmPassword())) {
				response.put("error", "비밀번호 2개가 일치 안합니다");
		
	       
			}else if (result.hasFieldErrors("nick_name")) {
				response.put("error", "닉네임을 제대로 입력해야 합니다.");
			} else if (result.hasFieldErrors("zipcode")) {
				response.put("error", "우편번호는 5자리 숫자로 입력해야 합니다.");
			} else if (result.hasFieldErrors("address1")) {
				response.put("error", "주소1를 올바르게 입력해주세요.");
			} else if (result.hasFieldErrors("address2")) {
				response.put("error", "주소2를 올바르게 입력해주세요.");
			} else if (result.hasFieldErrors("phone")) {
				response.put("error", "전화번호를 올바르게 입력해주세요.");
			}
			else {

				response.put("error", "알 수 없는 오류가 발생했습니다.");
			}
			return response;
		}
		// 비밀번호 암호화 및 회원 저장
		memberVO.setPasswd_hash(passwordEncoder.encode(memberVO.getPasswd_hash()));
		memberService.insertMember(memberVO);

		// 성공적인 회원가입 후 메시지
		response.put("successMessage", "회원가입이 완료되었습니다. 이메일 인증을 진행해주세요.");

		return response;  // 성공적인 응답 반환
	}


	// 이메일 인증 처리
	@PostMapping("/verifyEmail")
	public @ResponseBody Map<String, String> verifyEmail(@RequestParam String email, 
			@RequestParam String code, 
			Model model,
			MemberVO memberVO) {
		Map<String, String> response = new HashMap<>();
		String isVerified = memberService.verifyEmail(email, code);

		if ("verified".equals(isVerified)) {
			response.put("status", "verified");
		} else {
			response.put("status", "failed");
		}
		return response;
	}

	// 이메일 인증 코드 확인 페이지
	@GetMapping("/verifyEmailPage")
	public String verifyEmailPage(@RequestParam String email, Model model) {
		model.addAttribute("email", email);
		return "/verifyEmail";
	}
	@GetMapping("/login")
	public String formLogin() {
		return "memberLogin";
	}

	private String generateVerificationCode() {
		Random random = new Random();
		return String.format("%06d", random.nextInt(1000000));
	}

}







