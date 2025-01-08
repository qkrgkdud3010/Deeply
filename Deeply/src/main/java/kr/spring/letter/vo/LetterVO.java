package kr.spring.letter.vo;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LetterVO {
	private long letter_num;
	private long user_num;
	private long artist_num;
	@NotBlank
	private String letter_title;
	@NotBlank
	private String letter_content;
	private String post_date;
	private int replied;
}
