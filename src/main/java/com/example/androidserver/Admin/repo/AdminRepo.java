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
    private SimpleJdbcCall getActivityTimeCall;
    private SimpleJdbcCall getUserActivityStatsCall;
    private SimpleJdbcCall getUserQuestionCountCall;
    private SimpleJdbcCall getUserCommentCountCall;
    private SimpleJdbcCall getTopUserCompanyByCountCall;
    private SimpleJdbcCall getTopCompanyByCountCall;
    private SimpleJdbcCall getResponseTimeCall;

    @PostConstruct
    @Override
    protected void initJdbcCalls() {
        getPopularTopicsCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_popular_topics");
        getActivityCompanyCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_company");
        getActivityTimeCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_time");
        getUserActivityStatsCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_user_activity_stats");
        getUserQuestionCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_user_question_count");
        getUserCommentCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_user_comment_count");
        getTopUserCompanyByCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_top_user_company_by_count");
        getTopCompanyByCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_top_company_by_count");
        getResponseTimeCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_user_response_time");
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

    // 시간대별 활동 분석
    public List<Map<String, Object>> getActivityTimeRepo() {
        Map<String, Object> result = getActivityTimeCall.execute();
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 사용자별 활동 통계
    public List<Map<String, Object>> getUserActivityStatsRepo(String stats) {
        Map<String, Object> result = getUserActivityStatsCall.execute(createParamsMap("p_period", stats));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 사용자가 작성한 질문의 개수
    public int getUserQuestionCountRepo(int uid) {
        Map<String, Object> result = getUserQuestionCountCall.execute(createParamsMap("p_uid", uid));
        return (int) result.get("question_count");
    }

    // 사용자가 작성한 코멘트 개수
    public int getUserCommentCountRepo(int uid) {
        Map<String, Object> result = getUserCommentCountCall.execute(createParamsMap("p_uid", uid));
        return (int) result.get("comment_count");
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
    public List<Map<String, Object>> getTopUserCompanyByCountRepo(String table) {
        Map<String, Object> result = getTopUserCompanyByCountCall.execute(createParamsMap("p_table", table));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 가장 많은 질문 또는 코멘트를 작성한 회사
    public List<Map<String, Object>> getTopCompanyByCountRepo(String table) {
        Map<String, Object> result = getTopCompanyByCountCall.execute(createParamsMap("p_table", table));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }

    // 사용자 응답 시간 분석
    public List<Map<String, Object>> getResponseTimeRepo(int uid) {
        Map<String, Object> result = getResponseTimeCall.execute(createParamsMap("p_uid", uid));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }
}
