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

-- View
drop view if exists question_with_user;
create view question_with_user as
select q.qid,
       q.uid,
       q.content,
       q.category,
       q.title,
       q.createAt,
       q.updateAt,
       q.great,
       u.name    AS user_name,
       u.email   AS user_email,
       u.company as user_company
from question as q
         join user as u on q.uid = u.uid;

drop view if exists comment_with_user;
create view comment_with_user as
select c.cid,
       c.uid,
       c.qid,
       c.content,
       c.createAt,
       c.updateAt,
       u.name,
       u.company
from comment as c
         join user as u on c.uid = u.uid;

drop view if exists question_with_comment;
create view question_with_comment as
select q.qid,
       q.uid      as question_uid,
       q.content  as question_content,
       q.category,
       q.title,
       q.createAt as question_createAt,
       c.createAt as comment_createAt
from question as q
         join comment as c on q.qid = c.qid;


-- Trigger
-- 질문 삭제시 질문과 연결된 모든 댓글을 삭제하는 트리거
drop trigger if exists delete_question_comments;
create trigger delete_question_comments
    after delete
    on question
    for each row
begin
    delete from comment where qid = OLD.qid;
end;

-- Procedure
-- 동적 테이블 조회
drop procedure if exists select_all_data;
delimiter
//
create procedure select_all_data(in tableName varchar(50))
begin
    set @query = concat('select * from ', tableName);
    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end
//
delimiter ;


-- 사용자 추가 프로시저
drop procedure if exists create_user;
delimiter
//
create procedure create_user(
    in p_name varchar(100),
    in p_email varchar(100),
    in p_password varchar(255),
    in p_interest varchar(100),
    in p_role varchar(50),
    in p_birth date,
    in p_company varchar(100)
)
begin
    insert into user (name, email, password, interest, company, role, birth)
    values (p_name, p_email, p_password, p_interest, p_company, p_role, p_birth);
end
//
delimiter ;

-- 이메일을 사용한 사용자 uid 조회
drop procedure if exists select_uid_by_email;
delimiter
//
create procedure select_uid_by_email(
    in p_email varchar(50)
)
begin
    select uid
    from user
    where email = p_email;
end
//
delimiter ;


-- 질문 등록 프로시저
drop procedure if exists createQuestion;
DELIMITER
//
CREATE PROCEDURE create_question(
    IN p_qid INT,
    IN p_uid INT,
    IN p_content TEXT,
    IN p_category VARCHAR(50),
    IN p_title VARCHAR(255),
    IN p_createAt TIMESTAMP,
    IN p_updateAt TIMESTAMP
)
BEGIN
    INSERT INTO question (qid, uid, content, category, title, createAt, updateAt, great)
    VALUES (p_qid, p_uid, p_content, p_category, p_title, p_createAt, p_updateAt, 0);
END
//
DELIMITER ;

-- 질문 수정 프로시저
drop procedure if exists update_question;
delimiter
//
create procedure update_question(
    IN p_qid INT,
    IN p_content TEXT,
    IN p_category VARCHAR(50),
    IN p_title VARCHAR(255),
    IN p_updateAt TIMESTAMP
)
begin
    UPDATE question
    SET content  = p_content,
        category = p_category,
        title    = p_title,
        updateAt = p_updateAt
    WHERE qid = p_qid;
end
//
delimiter ;

-- 질문 삭제 프로시저
drop procedure if exists delete_question;
delimiter
//
create procedure delete_question(in p_qid int)
begin
    delete
    from question
    where qid = p_qid;
end
//
delimiter ;

-- 카테고리별 데이터 조회
drop procedure if exists select_question_by_category;
delimiter
//
create procedure select_question_by_category(
    in p_category varchar(10)
)
begin
    select *
    from question_with_user
    where category = p_category
    group by qid;
end
//
delimiter ;

-- 특정 사용자별 데이터 조회
drop procedure if exists select_my_question;
delimiter
//
create procedure select_my_question(in p_uid int)
begin
    select *
    from question_with_user
    where uid = p_uid;
end
//
delimiter ;

-- 카테고리와 제목 검색
drop procedure if exists select_question_by_keyword;
delimiter
//
create procedure select_question_by_keyword(
    in p_keyword varchar(255)
)
begin
    select *
    from question
    where title like concat('%', p_keyword, '%');
end
//
delimiter ;


-- 좋아요 수 증가
drop procedure if exists increment_great;
delimiter
//
create procedure increment_great(
    in p_qid int
)
begin
    update question
    set great = great + 1
    where qid = p_qid;
end
//
delimiter ;

-- 좋아요 수 조회
drop procedure if exists select_great_count;
delimiter
//
create procedure select_great_count(in p_qid int)
begin
    select great
    from question
    where qid = p_qid;
end
//
delimiter ;


-- 코멘트 추가
drop procedure if exists create_comment;
delimiter
//
create procedure create_comment(
    IN p_cid INT,
    IN p_uid INT,
    IN p_qid INT,
    IN p_content TEXT,
    IN p_createAt TIMESTAMP,
    IN p_updateAt TIMESTAMP
)
begin
    insert into comment (cid, uid, qid, content, createAt, updateAt)
    values (p_cid, p_uid, p_qid, p_content, p_createAt, p_updateAt);
end
//
delimiter ;

-- 코멘트 수정
drop procedure if exists update_comment;
delimiter
//
create procedure update_comment(
    in p_cid int,
    in p_content varchar(255),
    in p_updateAt date
)
begin
    update comment
    set content  = p_content,
        updateAt = p_updateAt
    where cid = p_cid;
end
//
delimiter ;

-- 질문별 댓글 불러오기
drop procedure if exists select_comment_by_question_id;
delimiter
//
create procedure select_comment_by_question_id(in p_qid int)
begin
    select *
    from comment_with_user
    where qid = p_qid
    group by cid;
end //
delimiter ;

-- 코멘트 삭제
drop procedure if exists delete_comment_by_id;
delimiter //
create procedure delete_comment_by_id(in p_cid int)
begin
    delete from comment where cid = p_cid;
end //
delimiter ;

-- 전체 코멘트 삭제
drop procedure if exists delete_comment;
delimiter
//
create procedure delete_comment(in p_qid int)
begin
    delete from comment where qid = p_qid;
end
//
delimiter ;


-- 통계 프로시저
-- 사용자별 활동 통계
drop procedure if exists get_user_activity_stats;
delimiter //
create procedure get_user_activity_stats(in p_period varchar(20))
begin
    declare start_date date;
    set start_date =
            case
                when p_period = 'daily' then curdate()
                when p_period = 'weekly' then date_sub(curdate(), interval 7 day)
                when p_period = 'monthly' then date_sub(curdate(), interval 1 month)
                when p_period = 'yearly' then date_sub(curdate(), interval 1 year)
                else curdate()
                end;

    select q.uid, u.name, u.email, u.company, count(*) as question_count
    from question as q
             join user as u on q.uid = u.uid
    where q.createAt >= start_date
    group by q.uid;
end //
delimiter ;

-- 사용자가 작성한 코멘트 or 질문의 개수
drop procedure if exists get_written_count;
delimiter //
create procedure get_written_count(
    in p_uName varchar(10),
    in p_tableName varchar(20)
)
begin
    set @query = concat(
            'select u.uid, u.name, u.email, count(*) as ', p_uName, '_cnt '
                'from ', p_tableName, ' as tname '
                'inner join user as u on u.uid = tname.uid ',
            'where u.name = ''', p_uName, ''' ',
            'group by u.uid');

    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end //
delimiter ;

-- 사용자별 평균 질문 or 코멘트 개수
drop procedure if exists get_average_count;
delimiter //
create procedure get_average_count(
    in p_tName varchar(20)
)
begin
    set @query = concat(
            'select u.uid, u.name, u.email, avg(user_counts.cnt) as average_', p_tName, '_count ',
            'from user as u ',
            'join (',
            '   select uid, count(*) as cnt ',
            '   from ', p_tName, ' as t ',
            '   group by uid',
            ') as user_counts on u.uid = user_counts.uid ',
            'group by u.uid'
                 );

    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end //
delimiter ;

-- 질문, 코멘트를 입력받아 가장 많이 작성한 사용자 분석
-- 사용자가 작성한 질문의 개수
drop procedure if exists get_top_user_by_cnt;
delimiter //
create procedure get_top_user_by_cnt(in p_tableName varchar(20))
begin
    -- 안전한 컬럼 및 테이블 검증 (comment와 question 테이블만 허용)
    if p_tableName not in ('comment', 'question') then
        signal sqlstate '45000' set message_text = 'Invalid table name';
    end if;

    -- 동적 쿼리 생성
    set @query = concat(
            'select u.uid, u.name, u.company, count(*) as ', p_tableName ,'_count ',
            'from ', p_tableName, ' as t ',
            'join user as u on t.uid = u.uid ',
            'group by u.uid ',
        -- 질문 갯수 기준으로 내림차순 정렬
            'order by ', p_tableName, '_count desc'
                 );

    -- 동적 쿼리 실행
    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end //
delimiter ;

call get_top_user_by_cnt('question');

-- 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
-- 회사 이름과 질문 or 코멘트 테이블을 입력받아 가장 많이 작성한 회사를 내림차순으로 출력
drop procedure if exists get_top_user_company_by_count;
delimiter //
create procedure get_top_user_company_by_count(
    in p_company varchar(10),
    in p_tableName varchar(20)
)
begin
    set @query = concat(
            'select u.company, count(*) as ', p_tableName, '_cnt ',
            'from ', p_tableName, ' as t ',
            'join user as u on t.uid = u.uid ',
            'where u.company = ''', p_company, ''' ',
            'group by u.company ',
            'order by ', p_tableName, '_cnt desc'
                 );

    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end //
delimiter ;

-- 최근 인기있는 주제 분석
drop procedure if exists get_popular_topics;
delimiter //
create procedure get_popular_topics()
begin
    select t.tname as topic, count(*) as question_count
    from question as q
             join question_tag as qt on q.qid = qt.qid
             join tag as t on qt.tid = t.tid
    group by t.tname
    order by question_count desc
    limit 10;
end //
delimiter ;

-- 소속 회사별 활동 현황 분석
drop procedure if exists get_activity_by_company;
delimiter //
create procedure get_activity_by_company()
begin
    select u.company,
           count(distinct q.qid) as question_cnt,
           count(distinct c.cid) as comment_cnt
    from user as u
             left join question as q on u.uid = q.uid
             left join comment as c on u.uid = c.uid
    group by u.company;
end //
delimiter ;

-- 시간대별 활동 분석
drop procedure if exists get_activity_by_time;
delimiter //
create procedure get_activity_by_time()
begin
    select hour(createAt) as hour, count(*) as activity_cnt
    from question
    group by hour
    order by hour;
end //
delimiter ;

-- 사용자 응답 시간 분석
drop procedure if exists get_user_response_time;
delimiter //
create procedure get_user_response_time(in p_uid int)
begin
    select q.qid, timestampdiff(minute, q.createAt, min(c.createAt)) as response_time_minutes
    from question as q
             join comment as c on q.qid = c.qid
    where q.uid = p_uid
    group by q.qid;
end //
delimiter ;


-- 추가 2024.11.13
-- 사용자의 평균 질문 및 댓글 처리 시간
drop procedure if exists get_avg_question_comment_time;
delimiter //
create procedure get_avg_question_comment_time(in p_uid int)
begin
    select
        avg(timestampdiff(minute, q.createAt, c.createAt)) as avg_response_time
    from question q
             join comment c on q.qid = c.qid
    where q.uid = p_uid;
end //
delimiter ;

-- 주제별 활동 분석
drop procedure if exists get_activity_by_topic;
delimiter //
create procedure get_activity_by_topic()
begin
    select
        t.tname as topic,
        count(distinct q.qid) as question_count,
        count(distinct c.cid) as comment_count
    from question q
             join question_tag qt on q.qid = qt.qid
             join tag t on qt.tid = t.tid
             left join comment c on q.qid = c.qid
    group by t.tname;
end //
delimiter ;

-- 특정 시간대의 질문과 댓글 수 분석
drop procedure if exists get_activity_by_time_range;
delimiter //
create procedure get_activity_by_time_range()
begin
    select
        hour(q.createAt) as hour_of_day,
        count(distinct q.qid) as question_count,
        count(distinct c.cid) as comment_count
    from question q
             left join comment c on q.qid = c.qid
    group by hour(q.createAt)
    order by hour_of_day;
end //
delimiter ;

-- 사용자가 작성한 질문의 카테고리별 분포
drop procedure if exists get_question_category_distribution;
delimiter //
create procedure get_question_category_distribution(in p_uid int)
begin
    select
        q.category,
        count(*) as question_count
    from question q
    where q.uid = p_uid
    group by q.category;
end //
delimiter ;

-- 사용자 활동의 월별 변화 분석
drop procedure if exists get_monthly_user_activity;
delimiter //
create procedure get_monthly_user_activity(in p_uid int)
begin
    select
        month(q.createAt) as month,
        count(distinct q.qid) as question_count,
        count(distinct c.cid) as comment_count
    from question q
             left join comment c on q.qid = c.qid
    where q.uid = p_uid
    group by month(q.createAt)
    order by month(q.createAt);
end //
delimiter ;
