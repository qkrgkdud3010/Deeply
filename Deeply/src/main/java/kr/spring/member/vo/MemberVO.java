package kr.spring.member.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude = {"photo"})
public class MemberVO {
		private Long user_num; // USER_NUM

	    @NotBlank(message = "이름은 필수 입력 값입니다.")
	    @Size(max = 30, message = "이름은 최대 30자까지 입력 가능합니다.")
	    private String name; // NAME

	    @NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	    @Pattern(regexp = "^[A-Za-z0-9!@#$%^&*()_+]{8,20}$", message = "비밀번호는 8~20자의 영문자, 숫자, 특수문자로 구성되어야 합니다.")
	    private String passwd_hash; // PASSWD_HASH

	    @NotBlank(message = "이메일은 필수 입력 값입니다.")
	    @Email(message = "올바른 이메일 형식이 아닙니다.")
	    private String email; // EMAIL

	    @NotBlank(message = "인증 코드는 필수 입력 값입니다.")
	    @Size(max = 10, message = "인증 코드는 최대 10자까지 입력 가능합니다.")
	    private String verificationCode; // VERIFICATION_CODE

	    @NotBlank(message = "인증 여부는 필수 값입니다.")
	    private String isVerified; // IS_VERIFIED

	    private Date codeExpiration; // CODE_EXPIRATION

	    @NotBlank(message = "우편번호는 필수 입력 값입니다.")
	    @Pattern(regexp = "^[0-9]{5}$", message = "우편번호는 5자리 숫자로 입력해야 합니다.")
	    private String zipcode; // ZIPCODE

	    @NotBlank(message = "주소는 필수 입력 값입니다.")
	    @Size(max = 90, message = "주소는 최대 90자까지 입력 가능합니다.")
	    private String address1; // ADDRESS1

	    private String address2; // ADDRESS2 (선택 값)

	    private String photo; // PHOTO (선택 값)

	    private String photoName; // PHOTO_NAME (선택 값)

	    @NotBlank(message = "전화번호는 필수 입력 값입니다.")
	    @Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "전화번호는 올바른 형식으로 입력해야 합니다. 예: 010-1234-5678")
	    private String phone; // PHONE

	    private String socialName; // SOCIAL_NAME (선택 값)

	    private String twoFactorEnabled; // TWO_FACTOR_ENABLED

	    private String automaticLogin; // AUTOMATIC_LOGIN

	    @NotBlank(message = "사용자 잔액은 필수 값입니다.")
	    private String userBal; // USER_BAL
	    
	  

	    @NotBlank(message = "아이디는 필수 입력 값입니다.")
	    @Pattern(regexp = "^[A-Za-z0-9]{4,12}$", message = "아이디는 4~12자의 영문자와 숫자로 구성되어야 합니다.")
	    private String id; // ID

	    @NotBlank(message = "닉네임은 필수 입력 값입니다.")
	    @Size(max = 30, message = "닉네임은 최대 30자까지 입력 가능합니다.")
	    private String nick_name; // NICK_NAME

	    private int auth; // AUTH
	//비밀번호 일치 여부 체크
	public boolean isCheckedPassword(String userPasswd) {
		
		if(auth > 1 && passwd_hash.equals(userPasswd)) {
			return true;
		}
		return false;
	}
	
}