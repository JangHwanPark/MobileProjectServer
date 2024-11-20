drop database elk;
create database elk;
use elk;

create table user
(
    uid      int auto_increment primary key,
    name     varchar(10),
    email    varchar(50) unique,
    password varchar(255),
    interest varchar(100),
    company  varchar(100),
    role     varchar(10),
    birth    varchar(20)
);

create table question
(
    qid      int auto_increment primary key,
    uid      int,
    interest varchar(100),
    title    varchar(255),
    content  varchar(255),
    category varchar(50),
    createAt date,
    updateAt date,
    great    int,
    foreign key (uid) references user (uid)
);

create table comment
(
    cid      int auto_increment primary key,
    uid      int,
    qid      int,
    content  varchar(255),
    createAt date,
    updateAt date,
    foreign key (uid) references user (uid),
    foreign key (qid) references question (qid)
);

create table tag
(
    tid   int primary key,
    tname varchar(30)
);

create table question_tag
(
    qid int,
    tid int,
    primary key (tid, qid),
    foreign key (qid) references question (qid) on delete cascade,
    foreign key (tid) references tag (tid)
);

-- 태그 추가
INSERT INTO tag (tid, tname)
VALUES
    -- 기존 IT 및 공학 태그
    (1, '프로그래밍'),
    (2, '인공지능'),
    (3, '데이터베이스'),
    (4, '네트워크'),
    (5, '보안'),
    (6, '웹 개발'),
    (7, '모바일 개발'),
    (8, '빅데이터'),
    (9, '클라우드 컴퓨팅'),
    (10, '사물인터넷(IoT)'),
    (11, '블록체인'),
    (12, '머신러닝'),
    (13, '딥러닝'),
    (14, '데이터 분석'),
    (15, '컴퓨터 그래픽스'),
    (16, '게임 개발'),
    (17, '운영체제'),
    (18, '소프트웨어 엔지니어링'),
    (19, '자연어 처리(NLP)'),
    (20, '로보틱스'),
    (21, '경영학'),
    (22, '경제학'),
    (23, '심리학'),
    (24, '사회학'),
    (25, '교육학'),
    (26, '문학'),
    (27, '역사'),
    (28, '철학'),
    (29, '미술'),
    (30, '음악'),
    (31, '영화'),
    (32, '생물학'),
    (33, '화학'),
    (34, '물리학'),
    (35, '천문학'),
    (36, '지구과학'),
    (37, '의학'),
    (38, '약학'),
    (39, '간호학'),
    (40, '법학'),
    (41, '알고리즘');

-- 카테고리별 조회에 대한 인덱스
create index idx_question_category on question (category);

-- 사용자별 조회에 대한 인덱스
create index idx_question_uid on question (uid);

-- 제목 검색에 대한 인덱스
create index idx_question_title on question (title);

-- 코멘트 테이블에서 질문 ID(qid)로 조회 성능 향상을 위한 인덱스
create index idx_comment_qid on comment (qid);

-- 코멘트 테이블에서 사용자 ID(uid)로 조회 성능 향상을 위한 인덱스
create index idx_comment_uid on comment (uid);