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
drop procedure if exists select_all_users;
delimiter //
create procedure select_all_users()
begin
    select * from user;
end //
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
drop procedure if exists create_question;
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