drop database elk;
create database elk;
use elk;

create table role
(
    rid   int auto_increment primary key,
    rname varchar(10)
);

create table user
(
    uid      int auto_increment primary key,
    rid      int,
    udid    varchar(255),
    email    varchar(50),
    password   varchar(255),
    interest varchar(100),
    role     varchar(10),
    foreign key (rid) references role (rid)
);

create table admin
(
    aid    int auto_increment primary key,
    uid    int unique,
    access date,
    foreign key (uid) references user (uid)
);

create table question
(
    qid      int auto_increment primary key,
    uid      int,
    title    varchar(255),
    content  varchar(255),
    category varchar(50),
    createAt date,
    updateAt date,
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

create table answer
(
    ansid    int auto_increment primary key,
    qid      int,
    uid      int,
    content  varchar(255),
    createAt date,
    foreign key (qid) references question (qid),
    foreign key (uid) references user (uid)
);

-- 사용자 권한
insert into role (rid, rname)
values (1, 'customer');
insert into role (rid, rname)
values (2, 'expert');

-- 사용자
insert into user(email, password, interest, rid, role)
values ('1', '1', '1', 1, "admin");
insert into user(email, password, interest, rid, role)
values ('2', '1', '2', 1, "admin");
insert into user(email, password, interest, rid, role)
values ('3', '1', '1', 1, "admin");
insert into user(email, password, interest, rid, role)
values ('4', '1', '1', 2, "customer");
insert into user(email, password, interest, rid, role)
values ('5', '1', '1', 2, "customer");

-- 관리자
insert into admin
values (1, 1, '2024-01-01');

-- 태그 추가
insert into tag (tid, tname)
values (1, 'JavaScript');
insert into tag (tid, tname)
values (2, 'Python');
insert into tag (tid, tname)
values (3, 'Java');
insert into tag (tid, tname)
values (4, 'Database');
insert into tag (tid, tname)
values (5, 'Web Development');

-- 질문 추가
insert into question (uid, title, content, category, createAt)
values (1, '질문1', 'What is closure in JavaScript?', 'Programming', '2024-10-01');
insert into question (uid, title, content, category, createAt)
values (2,  '질문2', 'How to handle async code in Python?', 'Programming', '2024-10-02');
insert into question (uid, title, content, category, createAt)
values (3, '질문3', 'What are the new features in Java 17?', 'Programming', '2024-10-03');
insert into question (uid, title, content, category, createAt)
values (4, '질문4', 'What is normalization in databases?', 'Database', '2024-10-04');
insert into question (uid, title, content, category, createAt)
values (5, '질문5', 'How to use React with TypeScript?', 'Web Development', '2024-10-05');

-- 10개의 태그 (tag) 데이터 추가
INSERT INTO tag (tid, tname)
VALUES
    (6, 'React'),
    (7, 'Angular'),
    (8, 'Vue.js'),
    (9, 'SQL'),
    (10, 'Node.js'),
    (11, 'Express.js'),
    (12, 'Spring Boot'),
    (13, 'Django'),
    (14, 'Flask'),
    (15, 'Ruby on Rails');

-- 리뷰 추가
insert into comment (uid, content, createAt)
values (1, 'Very helpful answer on JavaScript!', '2024-10-06');
insert into comment (uid, content, createAt)
values (2, 'Great advice on async programming!', '2024-10-07');
insert into comment (uid, content, createAt)
values (3, 'Clear explanation about new Java features.', '2024-10-08');
insert into comment (uid, content, createAt)
values (4, 'Good understanding of database normalization.', '2024-10-09');
insert into comment (uid, content, createAt)
values (5, 'Useful tips for using React with TypeScript.', '2024-10-10');
insert into comment (uid, content, createAt)
values (5, 'TypeScript.', '2024-10-11');
insert into comment (uid, content, createAt)
values (1, 'JavaScript!', '2024-10-16');
insert into comment (uid, content, createAt)
values (1, 'Python!', '2024-10-16');
insert into comment (uid, content, createAt)
values (1, 'Java And Python!', '2024-10-16');
