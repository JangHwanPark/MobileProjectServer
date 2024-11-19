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