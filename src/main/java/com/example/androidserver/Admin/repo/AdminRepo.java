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
    private SimpleJdbcCall getActivityByCompanyCall;
    private SimpleJdbcCall getResponseTimeCall;

    @PostConstruct
    @Override
    protected void initJdbcCalls() {
        getPopularTopicsCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_popular_topics");
        getActivityCompanyCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_company");
        getActivityTimeCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_time");
        getUserActivityStatsCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_user_activity_stats");
        getUserQuestionCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_top_user_by_cnt");
        getUserCommentCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_top_user_by_cnt");
        getTopUserCompanyByCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_top_user_company_by_count");
        getActivityByCompanyCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("get_activity_by_company");
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

    // 사용자가 작성한 질문의 개수
    public int getUserQuestionCountRepo(String table, int uid) {
        Map<String, Object> result = getUserQuestionCountCall.execute(
                createParamsMap("p_tableName", table, "p_colCount", uid));
        return (int) result.get("question_count");
    }

    // 사용자가 작성한 코멘트 개수
    public int getUserCommentCountRepo(int uid) {
        Map<String, Object> result = getUserCommentCountCall.execute(
                createParamsMap("p_colCount", uid));
        return (int) result.get("comment_count");
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

    // 사용자 응답 시간 분석
    public List<Map<String, Object>> getResponseTimeRepo(int uid) {
        Map<String, Object> result = getResponseTimeCall.execute(createParamsMap("p_uid", uid));
        return (List<Map<String, Object>>) result.get("#result-set-1");
    }
}
