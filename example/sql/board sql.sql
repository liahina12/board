CREATE DATABASE lee;
use lee;
create table tb_Member(
 id varchar(14) primary key,
 pw varchar(20),
 name varchar(10),
 nicname varchar(10),
 birth date,
 email varchar(20)
);

ALTER TABLE tb_Member ADD UNIQUE uk_name(nicname) ; -- 유니크키 설정 
ALTER TABLE tb1_board ADD constraint fk1_member_board FOREIGN KEY (writer) REFERENCES tb_Member(nicname) ON update CASCADE ON DELETE CASCADE; 

create table tb1_board(
bno int auto_increment primary key,
title varchar(200) not null,
content varchar(2000) not null,
writer varchar(50) not null,
regdate datetime default now(),
updatedate datetime default now()

);
alter table tb1_board add vcount int not null default 0;
alter table tb1_board add column replycnt int default 0;


create table tb1_reply(
rno int auto_increment primary key ,
bno int,
reply varchar(1000),
replyer varchar(50),
replydate datetime default current_timestamp,
updateDate datetime default current_timestamp
);

alter table tb1_reply add constraint fk1_reply_board
foreign key(bno) references tb1_board(bno);
create index idx1_reply on tb1_reply (bno desc, rno asc);

create table tb1_attach(
uuid varchar(100) not null,
uploadPath varchar(200) not null,
fileName varchar(100) not null,
filetype char(1) default 'I',
bno int
);
alter table tb1_attach add constraint pk_attach primary key (uuid);
alter table tb1_attach add constraint fk1_board_attach foreign key (bno) references tb1_board(bno);