package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;


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
		  String verificationCode = emailService.generateVerificationCode();
          emailService.sendVerificationEmail(email, verificationCode);
          MemberServiceImpl.verificationCodes.put(email,verificationCode );
         
          response.put("email",email); 
          response.put("code",verificationCode);
          return response;
	}
	
	
	//회원가입 데이터 전송
	@PostMapping("/registerUser")
    public String registerUser(@Valid MemberVO memberVO, 
                               BindingResult result, 
                               Model model, 
                               HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("error", "입력 값을 확인해주세요.");
            return "main";
            }
        
			
          // 비밀번호 암호화 및 회원 저장
            memberVO.setPasswd_hash(passwordEncoder.encode(memberVO.getPasswd_hash()));
            memberService.insertMember(memberVO);

          
            // 이메일 인증 대기 메시지
          

            
            
  
            
            return "m";

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
	
	  private String generateVerificationCode() {
	        Random random = new Random();
	        return String.format("%06d", random.nextInt(1000000));
	    }
	
}







