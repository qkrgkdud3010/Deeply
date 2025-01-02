--채팅방 테이블
create table chatroom(
chat_num number not null, --채팅 방 번호 pk
chat_name varchar2(10) not null, --채팅방 이름
chat_status number(1) default 0 not null, --1이면 방이 활성화
constraint chatroom_pk primary key (chat_num) 
);

create sequence chatroom_seq;

--메세지 테이블
create table chatmsg(
chatmsg_num number not null, --pk 메세지 번호
chat_num number not null,  --fk, 채팅방 번호
chat_user_num number not null, --fk, 유저 번호
chat_msg varchar2(200) not null, --메세지
reply_status number(10) default 0 not null,
constraint chatmsg_pk primary key (chatmsg_num),
constraint chatmsg_chat_fk foreign key (chat_num) references chatroom (chat_num),
constraint chatmsg_user_fk foreign key (chat_user_num) references chat (chat_user_num)
);

create sequence chatmsg_seq;


--채팅에 참여하는 artist
create table achat(
auser_num number not null, --아티스트 번호, fk
auser_id varchar2(10) not null, --아티스트 아이디 ,fk
constraint achat_fk_num foreign key (auser_num) references auser (user_num),
constraint achat_fk_id foreign key (auser_id) references auser (id)
);

--채팅에 참여하는 유저

--중간 테이블
create table chat(
chat_user_num number not null, --채팅방에 들어온 user 번호, 두 테이블에서 들어오는 거라서 fk 될 수 없음
chat_num number not null, --채팅방 번호, fk
chat_id varchar2(10) not null, --두 테이블에서 넘어오는 거라서 fk가 될 수 없음
chat_kind number(1) default 0 not null, --0이면 유료 유저 1이면 artist
constraint chat_fk foreign key (chat_num) references chatroom (chat_num),

);
--unique 제약조건 추가
ALTER TABLE chat 
ADD CONSTRAINT chat_user_uniq UNIQUE (chat_user_num);
create sequence chatmsg_seq;


