package kr.spring.video.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VideoVO {
    private long videoId;       // 영상 고유 ID (PK)
    private long artistId;      // 아티스트 ID (FK)
    private String title;       // 영상 제목
    private String description; // 영상 설명
    private boolean isExclusive; // 유료 영상 여부 (0: 무료, 1: 유료)
    private String mediaUrl;    // 영상 파일 경로 또는 URL
    private MultipartFile media; // 업로드된 파일을 처리하기 위한 필드 추가
    private Timestamp createdAt; // 업로드 일시
    private int views;          // 조회수
    private int likes;          // 좋아요 수
    private int commentsCount;  // 댓글 수
    private long categoryId;    // 카테고리 ID (FK)
}
