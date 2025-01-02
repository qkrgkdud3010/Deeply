create table auser(
 user_num number not null PRIMARY KEY,
 category char(1) not null UNIQUE
);

CREATE TABLE auser_detail (
    user_num NUMBER PRIMARY KEY, -- 유저 번호 (고유 키, 외래 키)
    name VARCHAR2(30) NOT NULL, -- 유저 이름 (본명)
    passwd_hash VARCHAR2(60) NOT NULL, -- 비밀번호 (해싱된 값)
    email VARCHAR2(50) NOT NULL, -- 이메일
    verification_code VARCHAR2(10) NOT NULL, -- 인증 번호
    is_verified CHAR(1) DEFAULT 'N', -- 인증 여부 (기본값 'N')
    code_expiration DATE, -- 인증 유효 기간
    photo VARCHAR2(255), -- 프로필 정보 저장 (필요 시 NOT NULL 추가)
    photo_name VARCHAR2(255), -- 프로필 이름 (필요 시 NOT NULL 추가)
    two_factor_enabled CHAR(1) DEFAULT 'N', -- 2단계 인증 여부 (기본값 'N')
    member1 VARCHAR2(30) NOT NULL, -- 멤버 필드
    member2 VARCHAR2(30),
    member3 VARCHAR2(30),
    member4 VARCHAR2(30),
    member5 VARCHAR2(30),
    member6 VARCHAR2(30),
    member7 VARCHAR2(30),
    member8 VARCHAR2(30),
    member9 VARCHAR2(30),
    member10 VARCHAR2(30),
    CONSTRAINT fk_auser_detail_auser FOREIGN KEY (user_num) REFERENCES auser (user_num) -- 외래 키
);

CREATE TABLE performance_hall(
	hall_num NUMBER PRIMARY KEY,
	hall_name VARCHAR2(50) NOT NULL,
	max_seat NUMBER NOT NULL,
	location VARCHAR2(100) NOT NULL,
	has_vip NUMBER NOT NULL
);

create sequence perf_hall_seq;

CREATE TABLE performance_detail (
    pref_num NUMBER NOT NULL PRIMARY KEY,
    hall_num NUMBER NOT NULL,
    booked_amount NUMBER NOT NULL,
    artist_num NUMBER NOT NULL,
    perf_date VARCHAR2(100) NOT NULL,
    pref_time VARCHAR2(100) NOT NULL,
    perf_status VARCHAR2(200) NOT NULL,
    perf_title VARCHAR2(200) NOT NULL,
    perf_desc VARCHAR2(2000),
    ticket_price NUMBER NOT NULL,
    remaining_amount NUMBER NOT NULL,
    reg_date VARCHAR2(100) NOT NULL,
    end_date VARCHAR2(100),
    category VARCHAR2(100) NOT NULL,
    booking_deadline DATE NOT NULL,
    CONSTRAINT fk_perf_detail_hall FOREIGN KEY (hall_num) REFERENCES performance_hall (hall_num),
    CONSTRAINT fk_perf_detail_auser FOREIGN KEY (artist_num) REFERENCES auser (user_num)
);
create sequence perf_detail_seq;