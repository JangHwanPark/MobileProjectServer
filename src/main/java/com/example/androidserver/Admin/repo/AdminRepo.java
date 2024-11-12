package com.example.androidserver.Admin.repo;

import org.springframework.stereotype.Repository;

@Repository
public class AdminRepo {
    // 최근 인기있는 주제 분석
    public int getPopularTopicsRepo() {
        return 1;
    }

    // 소속 회사별 활동 현황 분석
    public int getActivityCompanyRepo() {
        return 1;
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
    public int getTopUserCompanyByCntRepo() {
        return 1;
    }

    // 가장 많은 질문 또는 코멘트를 작성한 회사
    public int getTopCompanyByCntRepo() {
        return 1;
    }

    // 사용자 응답 시간 분석
    public int getResponseTimeRepo(int uid) {
        return 1;
    }
}
