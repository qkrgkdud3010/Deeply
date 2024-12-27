CREATE TABLE VIDEO (
    video_id NUMBER PRIMARY KEY, -- 시퀀스를 통해 값이 자동으로 할당됨
    artist_id NUMBER NOT NULL,
    title VARCHAR2(100) NOT NULL,
    description VARCHAR2(500),
    is_exclusive NUMBER(1) DEFAULT 0 NOT NULL, -- 0: 무료, 1: 유료
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    views NUMBER DEFAULT 0,
    likes NUMBER DEFAULT 0,
    comments_count NUMBER DEFAULT 0,
    category_id NUMBER NOT NULL
);

CREATE SEQUENCE VIDEO_SEQ
START WITH 1 -- 초기값
INCREMENT BY 1 -- 증가값
NOCACHE -- 메모리 캐시 사용 안 함 (옵션)
NOCYCLE; -- 최대값 이후 다시 1로 돌아가지 않음