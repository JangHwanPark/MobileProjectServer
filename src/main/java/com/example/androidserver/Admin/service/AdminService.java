package com.example.androidserver.Admin.service;

import com.example.androidserver.Admin.repo.AdminRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AdminService {
    private final AdminRepo adminRepo;

    // 최근 인기있는 주제 분석
    public List<Map<String, Object>> getPopularTopicsService() {
        return adminRepo.getPopularTopicsRepo();
    }

    // 소속 회사별 활동 현황 분석
    public List<Map<String, Object>> getActivityCompanyService() {
        return adminRepo.getActivityCompanyRepo();
    }

    // 시간대별 활동 분석
    public List<Map<String, Object>> getActivityTimeService() {
        return adminRepo.getActivityTimeRepo();
    }

    // 사용자별 활동 통계
    public List<Map<String, Object>> getUserActivityStatsService(String stats) {
        return adminRepo.getUserActivityStatsRepo(stats);
    }

    // 사용자가 작성한 질문의 개수
    public int getUserQuestionCountService(String table, int uid) {
        return adminRepo.getUserQuestionCountRepo(table, uid);
    }

    // 사용자가 작성한 코멘트 개수
    public int getUserCommentCountService(int uid) {
        return adminRepo.getUserCommentCountRepo(uid);
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
    public List<Map<String, Object>> getTopUserCompanyByCountService(String company, String table) {
        return adminRepo.getTopUserCompanyByCountRepo(company, table);
    }

    // 가장 많은 질문 또는 코멘트를 작성한 회사
    public List<Map<String, Object>> getActivityByCompanyService(String table) {
        return adminRepo.getActivityByCompanyRepo(table);
    }

    // 사용자 응답 시간 분석
    public List<Map<String, Object>> getResponseTimeService(int uid) {
        return adminRepo.getResponseTimeRepo(uid);
    }
}
