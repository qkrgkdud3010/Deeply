CREATE TABLE video (
    video_id NUMBER PRIMARY KEY, -- 시퀀스를 통해 값이 자동으로 할당됨
    artist_id NUMBER NOT NULL, -- 아티스트 ID (FK)
    title VARCHAR2(100 CHAR) NOT NULL, -- 영상 제목
    description CLOB, -- 영상 설명
    is_exclusive NUMBER(1) DEFAULT 0 NOT NULL, -- 0: 무료, 1: 유료
    media_url VARCHAR2(500 CHAR), -- 영상 파일 경로 또는 URL
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 업로드 일시
    views NUMBER DEFAULT 0, -- 조회수
    likes NUMBER DEFAULT 0, -- 좋아요 수
    comments_count NUMBER DEFAULT 0, -- 댓글 수
    category_id NUMBER NOT NULL -- 카테고리 ID (FK)
);

CREATE SEQUENCE VIDEO_SEQ
START WITH 1 -- 초기값
INCREMENT BY 1 -- 증가값
NOCACHE -- 메모리 캐시 사용 안 함 (옵션)
NOCYCLE; -- 최대값 이후 다시 1로 돌아가지 않음