-- 4. 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
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

-- 5. 최근 인기있는 주제 분석
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

-- 6. 소속 회사별 활동 현황 분석 (Top 10)
drop procedure if exists get_activity_by_company;
delimiter //
create procedure get_activity_by_company()
begin
    select u.company,
           count(distinct q.qid) as question_cnt,
           count(distinct c.cid) as comment_cnt,
           (count(distinct q.qid) + count(distinct c.cid)) as total_activity_count
    from user as u
             left join question as q on u.uid = q.uid
             left join comment as c on u.uid = c.uid
    group by u.company
    order by total_activity_count desc
    limit 10;
end //
delimiter ;

-- 추가 2024.11.13
-- 7. 주제별 활동 분석
drop procedure if exists get_activity_by_topic;
delimiter //
create procedure get_activity_by_topic()
begin
    select t.tname               as topic,
           count(distinct q.qid) as question_count,
           count(distinct c.cid) as comment_count,
           count(distinct q.qid) + count(distinct c.cid) as total_count
    from question q
             join question_tag qt on q.qid = qt.qid
             join tag t on qt.tid = t.tid
             left join comment c on q.qid = c.qid
    group by t.tname;
end //
delimiter ;
call get_activity_by_topic();

-- 8. 사용자 활동의 월별 변화 분석 (미사용)
drop procedure if exists get_monthly_user_activity;
delimiter //
create procedure get_monthly_user_activity(in p_uid int)
begin
    select month(q.createAt)     as month,
           count(distinct q.qid) as question_count,
           count(distinct c.cid) as comment_count
    from question q
             left join comment c on q.qid = c.qid
    where q.uid = p_uid
    group by month(q.createAt)
    order by month(q.createAt);
end //
delimiter ;
call get_monthly_user_activity(400);

-- 9. 회사별 연도별 질문 및 댓글 작성 횟수 분석
drop procedure if exists get_activity_by_company_and_year;
delimiter //
create procedure get_activity_by_company_and_year(in p_company varchar(100))
begin
    select u.company,
           year(q.createAt)      as year,
           count(distinct q.qid) as question_count,
           count(distinct c.cid) as comment_count
    from user u
             left join question q on u.uid = q.uid
             left join comment c on q.qid = c.qid
    where u.company = p_company -- 특정 회사에 대해 필터링
    group by u.company, year(q.createAt) -- 연도별로 그룹화
    order by year(q.createAt); -- 연도별로 오름차순 정렬
end //
delimiter ;

-- 10. 월별 질문 등록 횟수
drop procedure if exists get_monthly_question_count;
delimiter //
create procedure get_monthly_question_count(
    in p_keyword varchar(10), in p_year int)
begin
    set @query = concat(
            'select month(q.createAt) as month, count(q.qid) as count ',
            'from ', p_keyword, ' q ',
            'where year(q.createAt) = ', p_year, ' ',
            'group by month(q.createAt) '
                'order by month(q.createAt)'
                 );

    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end //
delimiter ;

-- 11. 년별 질문 등록 횟수
drop procedure if exists get_yearly_question_count;
delimiter //
create procedure get_yearly_question_count()
begin
    select year(q.createAt) as year,
           count(q.qid)     as question_count
    from question q
    where year(q.createAt) between 2010 and 2024
    group by year(q.createAt)
    order by year(q.createAt);
end //
delimiter ;

-- 12. 오늘, 주별, 월별, 년별 등록된 게시글 갯수
drop procedure if exists get_post_count_by_period;
delimiter //
create procedure get_post_count_by_period()
begin
    select '오늘' as period, count(*) as post_count
    from question
    where createAt = current_date

    union all

    select '이번 주', count(*) as post_count
    from question
    where yearweek(createAt, 1) = yearweek(current_date, 1)

    union all

    select '이번 달', count(*) as post_count
    from question
    where month(createAt) = month(current_date)
      and year(createAt) = year(current_date)

    union all

    select '이번 년도', count(*) as post_count
    from question
    where year(createAt) = year(current_date);
end //
delimiter ;

-- 13. 게시글, 코멘트, 사용자 수 반환
drop procedure if exists get_post_comment_user_count;
delimiter //
create procedure get_post_comment_user_count()
begin
    select
        count(u.uid) as total_user_count,
        count(q.qid) as total_question_count,
        count(c.cid) as total_comment_count
    from user as u
    left join comment as c on u.uid = c.uid
    left join question as q on u.uid = q.uid;
end //
delimiter ;

-- 14. 사용자 활동 순위 (활동이 가장 많은 사용자)
drop procedure if exists get_top_active_users;
delimiter //
create procedure get_top_active_users()
begin
    select u.uid, u.name, u.email, u.company,
           (count(distinct q.qid) + count(distinct c.cid)) as total_activity_count
    from user as u
             left join question as q on u.uid = q.uid
             left join comment as c on u.uid = c.uid
    group by u.uid
    order by total_activity_count desc
    limit 10;
end //
delimiter ;

-- 15. 사용자별 활동 요약 (최근 활동한 사용자)
drop procedure if exists get_user_activity_summary;
delimiter //
create procedure get_user_activity_summary(in p_uid int)
begin
    select u.uid, u.name, u.email,
           count(distinct q.qid) as question_count,
           count(distinct c.cid) as comment_count,
           (count(distinct q.qid) + count(distinct c.cid)) as total_activity_count
    from user as u
             left join question as q on u.uid = q.uid
             left join comment as c on u.uid = c.uid
    where u.uid = p_uid
    group by u.uid;
end //
delimiter ;

-- 16. 댓글/질문 비율 분석
drop procedure if exists get_question_comment_ratio;
delimiter //
create procedure get_question_comment_ratio()
begin
    select u.uid, u.name, u.email,
           count(distinct q.qid) as question_count,
           count(distinct c.cid) as comment_count,
           (count(distinct q.qid) / (count(distinct q.qid) + count(distinct c.cid))) as question_ratio,
           (count(distinct c.cid) / (count(distinct q.qid) + count(distinct c.cid))) as comment_ratio
    from user as u
             left join question as q on u.uid = q.uid
             left join comment as c on u.uid = c.uid
    group by u.uid;
end //
delimiter ;

-- 월별 사용자 생성 수
drop procedure if exists get_monthly_user_signup_count;
delimiter //
create procedure get_monthly_user_signup_count()
begin
    select year(createAt) as year,
           month(createAt) as month,
           count(uid) as user_signup_count
    from user
    group by year(createAt), month(createAt)
    order by year(createAt), month(createAt);
end //
delimiter ;

-- 년도별 사용자 생성 수
drop procedure if exists get_yearly_user_signup_count;
delimiter //
create procedure get_yearly_user_signup_count()
begin
    select year(createAt) as year,
           count(uid) as user_signup_count
    from user
    group by year(createAt)
    order by year(createAt);
end //
delimiter ;