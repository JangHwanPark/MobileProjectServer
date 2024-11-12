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
    public int getActivityTimeRepo() {
        return 1;
    }

    // 사용자별 활동 통계
    public int getUserActivityStatsRepo(String stats) {
        return 1;
    }

    // 사용자가 작성한 질문의 개수
    public int getUserQuestionCountRepo(int uid) {
        return 1;
    }

    // 사용자가 작성한 코멘트 개수
    public int getUserCommentCountRepo(int uid) {
        return 1;
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
    public int getTopUserCompanyByCountRepo(String table) {
        return 1;
    }

    // 가장 많은 질문 또는 코멘트를 작성한 회사
    public int getTopCompanyByCountRepo(String table) {
        return 1;
    }

    // 사용자 응답 시간 분석
    public int getResponseTimeRepo(int uid) {
        return 1;
    }
}
