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
    private SimpleJdbcCall getActivityCompanyCall;
    private SimpleJdbcCall getUserActivityStatsCall;
    private SimpleJdbcCall getTopUserCompanyByCountCall;
    private SimpleJdbcCall getActivityByCompanyCall;
    private SimpleJdbcCall getCompanyByKeywordCall;
    private SimpleJdbcCall getActivityByTopicCall;
    private SimpleJdbcCall getYearlyQuestionCountCall;
    private SimpleJdbcCall postMonthQuestionCountCall;

    @PostConstruct
    @Override
    protected void initJdbcCalls() {
        getPopularTopicsCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_popular_topics");
        getActivityCompanyCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_company");
        getUserActivityStatsCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_user_activity_stats");
        getTopUserCompanyByCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_top_user_company_by_count");
        getActivityByCompanyCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_company");
        getCompanyByKeywordCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_company_and_year");
        getActivityByTopicCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_topic");
        getYearlyQuestionCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_yearly_question_count");
        postMonthQuestionCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_monthly_question_count");
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

    // 사용자별 활동 통계
    public List<Map<String, Object>> getUserActivityStatsRepo(String stats) {
        Map<String, Object> params = createParamsMap("p_period", stats);

        try {
            Map<String, Object> result = getUserActivityStatsCall.execute(params);

            // result에서 '#result-set-1'을 안전하게 가져오기
            if (result.containsKey("#result-set-1")) {
                return (List<Map<String, Object>>) result.get("#result-set-1");
            } else {
                return List.of();  // 반환값이 없으면 빈 리스트 반환
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error executing get_user_activity_stats procedure", e);
        }
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
    public List<Map<String, Object>> getTopUserCompanyByCountRepo(String company, String table) {
        Map<String, Object> result = getTopUserCompanyByCountCall.execute(
                createParamsMap("p_company", company, "p_tableName", table));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 소속 회사별 활동 현황 분석
    public List<Map<String, Object>> getActivityByCompanyRepo(String table) {
        Map<String, Object> result = getActivityByCompanyCall.execute(createParamsMap("p_table", table));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 회사별 연도별 질문 및 댓글 작성 횟수 분석
    public List<Map<String, Object>> getCompanyByKeywordRepo(String keyword) {
        Map<String, Object> result = getCompanyByKeywordCall.execute(createParamsMap("p_company", keyword));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 월별 질문 등록 및 코멘트 등록 횟수
    public List<Map<String, Object>> postMonthQuestionCountRepo(String keyword, int month, int year) {
        Map<String, Object> result = postMonthQuestionCountCall.execute(createParamsMap("p_keyword", keyword, "p_month", month, "p_year", year));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 년간 질문 등록 횟수
    public List<Map<String, Object>> getYearlyQuestionCountRepo() {
        Map<String, Object> result = getYearlyQuestionCountCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }
}
