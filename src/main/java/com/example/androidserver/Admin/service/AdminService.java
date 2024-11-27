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

    // 모든 질문, 코멘트, 사용자 수 출력
    public List<Map<String, Object>> getAllDataService() { return adminRepo.getAllDataRepo(); }

    // 주제별 활동 분석
    public List<Map<String, Object>> getActivityByTopicService() {
        return adminRepo.getActivityByTopicRepo();
    }

    // 소속 회사별 활동 현황 분석
    public List<Map<String, Object>> getActivityCompanyService() {
        return adminRepo.getActivityCompanyRepo();
    }

    // 사용자별 활동 통계
    public List<Map<String, Object>> getUserActivityStatsService(String stats) {
        return adminRepo.getUserActivityStatsRepo(stats);
    }

    // 사용자 활동 순위 (활동이 가장 많은 사용자)
    public List<Map<String, Object>> getTopActivityUsersService() {
        return adminRepo.getTopActivityUsersRepo();
    }

    // 사용자별 활동 요약 (최근 활동한 사용자)
    public List<Map<String, Object>> getUserActivitySummaryService(int uid) {
        return adminRepo.getUserActivitySummaryRepo(uid);
    }

    public List<Map<String, Object>> getPeriodQuestionCountService() {
        return adminRepo.getPeriodQuestionCountRepo();
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
    public List<Map<String, Object>> getTopUserCompanyByCountService(String company, String table) {
        return adminRepo.getTopUserCompanyByCountRepo(company, table);
    }

    // 가장 많은 질문 또는 코멘트를 작성한 회사
    public List<Map<String, Object>> getActivityByCompanyService() {
        return adminRepo.getActivityByCompanyRepo();
    }

    // 회사별 연도별 질문 및 댓글 작성 횟수 분석
    public List<Map<String, Object>> getCompanyByKeyword(String keyword) {
        return adminRepo.getCompanyByKeywordRepo(keyword);
    }

    // 월별 질문, 코멘트 등록 횟수
    public List<Map<String, Object>> postMonthQuestionCountService(String keyword, int year) {
        return adminRepo.postMonthQuestionCountRepo(keyword, year);
    }

    // 댓글/질문 비율 분석
    public List<Map<String, Object>> getQuestionCommentRatioService() {
        return adminRepo.getQuestionCommentRatioRepo();
    }

    // 년별 질문 등록 횟수
    public List<Map<String, Object>> getYearlyQuestionCountService() {
        return adminRepo.getYearlyQuestionCountRepo();
    }
}
