package com.example.androidserver.Admin.repo;

import com.example.androidserver.utils.AbstractRepo;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class AdminRepo extends AbstractRepo {
    private final JdbcTemplate jdbcTemplate;
    private SimpleJdbcCall getPopularTopicsCall;
    private SimpleJdbcCall getAllDataCall;
    private SimpleJdbcCall getActivityCompanyCall;
    private SimpleJdbcCall getTopActivityUsersCall;
    private SimpleJdbcCall getUserActivitySummaryCall;
    private SimpleJdbcCall getQuestionCommentRatioCall;
    private SimpleJdbcCall getTopUserCompanyByCountCall;
    private SimpleJdbcCall getActivityByCompanyCall;
    private SimpleJdbcCall getCompanyByKeywordCall;
    private SimpleJdbcCall getActivityByTopicCall;
    private SimpleJdbcCall getYearlyQuestionCountCall;
    private SimpleJdbcCall postMonthQuestionCountCall;
    private SimpleJdbcCall getPeriodQuestionCountCall;
    private SimpleJdbcCall getMonthlyUserSignupCountCall;
    private SimpleJdbcCall getYearlyUserSignupCountCall;

    @PostConstruct
    @Override
    protected void initJdbcCalls() {
        getPopularTopicsCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_popular_topics");
        getAllDataCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_post_comment_user_count");
        getActivityCompanyCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_company");
        getTopActivityUsersCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_top_active_users");
        getUserActivitySummaryCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_user_activity_summary");
        getQuestionCommentRatioCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_question_comment_ratio");
        getPeriodQuestionCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_post_count_by_period");
        getTopUserCompanyByCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_top_user_company_by_count");
        getActivityByCompanyCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_company");
        getCompanyByKeywordCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_company_and_year");
        getActivityByTopicCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_topic");
        getYearlyQuestionCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_yearly_question_count");
        postMonthQuestionCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_monthly_question_count");
        getMonthlyUserSignupCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_monthly_user_signup_count");
        getYearlyUserSignupCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_yearly_user_signup_count");
    }

    // 최근 인기있는 주제 분석
    public List<Map<String, Object>> getPopularTopicsRepo() {
        try {
            Map<String, Object> result = getPopularTopicsCall.execute();
            return (List<Map<String, Object>>) result.get("#result-set-1");
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // 예외 발생 시 빈 리스트 반환
        }
    }

    // 모든 질문, 코멘트, 사용자 수 출력
    public List<Map<String, Object>> getAllDataRepo() {
        Map<String, Object> result = getAllDataCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 주제별 활동 분석
    public List<Map<String, Object>> getActivityByTopicRepo() {
        Map<String, Object> result = getActivityByTopicCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 소속 회사별 활동 현황 분석
    public List<Map<String, Object>> getActivityCompanyRepo() {
        try {
            Map<String, Object> result = getActivityCompanyCall.execute();
            return (List<Map<String, Object>>) result.get("#result-set-1");
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // 예외 발생 시 빈 리스트 반환
        }
    }

    // 사용자 활동 순위 (활동이 가장 많은 사용자)
    public List<Map<String, Object>> getTopActivityUsersRepo() {
        Map<String, Object> result = getTopActivityUsersCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 사용자별 활동 요약 (최근 활동한 사용자)
    public List<Map<String, Object>> getUserActivitySummaryRepo(int uid) {
        Map<String, Object> result = getUserActivitySummaryCall.execute("p_uid", uid);
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 월별 사용자 생성 수
    public List<Map<String, Object>> getMonthlyUserSignupCountRepo() {
        Map<String, Object> result = getMonthlyUserSignupCountCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 년도별 사용자 생성 수
    public List<Map<String, Object>> getYearlyUserSignupCountRepo() {
        Map<String, Object> result = getYearlyUserSignupCountCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 오늘, 주별, 월별, 년별 등록된 게시글 갯수
    public List<Map<String, Object>> getPeriodQuestionCountRepo() {
        Map<String, Object> result = getPeriodQuestionCountCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
    public List<Map<String, Object>> getTopUserCompanyByCountRepo(String company, String table) {
        Map<String, Object> result = getTopUserCompanyByCountCall.execute(
                createParamsMap("p_company", company, "p_tableName", table));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 댓글/질문 비율 분석
    public List<Map<String, Object>> getQuestionCommentRatioRepo() {
        Map<String, Object> result = getQuestionCommentRatioCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 소속 회사별 활동 현황 분석
    public List<Map<String, Object>> getActivityByCompanyRepo() {
        Map<String, Object> result = getActivityByCompanyCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 회사별 연도별 질문 및 댓글 작성 횟수 분석
    public List<Map<String, Object>> getCompanyByKeywordRepo(String keyword) {
        Map<String, Object> result = getCompanyByKeywordCall.execute(createParamsMap("p_company", keyword));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 월별 질문 등록 및 코멘트 등록 횟수
    public List<Map<String, Object>> postMonthQuestionCountRepo(String keyword, int year) {
        Map<String, Object> result = postMonthQuestionCountCall.execute(createParamsMap("p_keyword", keyword, "p_year", year));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 년간 질문 등록 횟수
    public List<Map<String, Object>> getYearlyQuestionCountRepo() {
        Map<String, Object> result = getYearlyQuestionCountCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }
}
