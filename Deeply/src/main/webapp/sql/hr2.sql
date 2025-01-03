Create table payment(
pay_num number not null,
pay_status number not null,
pay_product number not null,
pay_price number not null,
pay_bank varchar2(30),
pay_type number not null,
pay_money number,
user_num number not null,
Constraint payment_pk primary key (pay_num),
Constraint payment_fk foreign key (user_num) references duser (user_num)
);
Create sequence payment_seq;

Create table follow(
follower_num number not null,
follow_num number not null,
follow_date date default sysdate not null,
constraint follow_fk1 foreign key (follow_num) references auser (user_num),
constraint follow_fk2 foreign key (follower_num) references duser (user_num)
);

Create table notice(
notice_num number not null,
notice_title varchar2(90) not null,
notice_content clob not null,
notice_file varchar2(400) not null,
user_num number not null,
Constraint notice_pk primary key (notice_num),
Constraint notice_fk foreign key (user_num) references duser (user_num)
);
Create sequence notice_seq;

Create table community(
c_num number not null,
c_category number not null,
c_title varchar2(90) not null,
c_content clob not null,
c_date date default sysdate not null,
c_update date default sysdate,
c_hit number not null,
c_file varchar2(400) not null,
user_num number not null,
Constraint community_pk primary key (c_num),
Constraint community_fk foreign key (user_num) references duser (user_num)
);
Create sequence community_seq;

Create table community_reply(
cre_num number not null,
cre_refe_num number,
cre_content varchar2(450) not null,
cre_date date default sysdate not null,
cre_update date default sysdate,
cre_file varchar2(400),
user_num number not null,
c_num number not null,
Constraint community_reply_pk primary key (cre_num),
Constraint community_reply_fk1 foreign key (user_num) references duser (user_num),
Constraint community_reply_fk2 foreign key (c_num) references community (c_num)
);
Create sequence community_reply_seq;

Create table community_report(
report_num number not null,
report_type varchar2(10) not null,
reported_num number not null,
report_reason varchar2(90) not null,
report_date date default sysdate not null,
report_status number not null,
user_num number not null,
Constraint community_report_pk primary key (report_num),
Constraint community_report_fk foreign key (user_num) references duser (user_num)
);
Create sequence community_report_seq;

Create table community_promotion(
cp_num number not null,
cp_title varchar2(90) not null,
cp_content clob not null,
cp_date date default sysdate not null,
cp_file varchar2(400) not null,
user_num number not null,
Constraint community_promotion_pk primary key (cp_num),
Constraint community_promotion_fk foreign key (user_num) references duser (user_num)
);
Create sequence community_promotion_seq;

Create table community_promotion_reply(
cpre_num number not null,
cpre_refe_num number,
cpre_content varchar2(450) not null,
cpre_date date default sysdate not null,
cpre_update date default sysdate,
user_num number not null,
cp_num number not null,
Constraint community_promotion_reply_pk primary key (cpre_num),
Constraint community_promotion_reply_fk1 foreign key (user_num) references duser (user_num),
Constraint community_promotion_reply_fk2 foreign key (cp_num) references community_promotion (cp_num)
);
Create sequence community_promotion_reply_seq;