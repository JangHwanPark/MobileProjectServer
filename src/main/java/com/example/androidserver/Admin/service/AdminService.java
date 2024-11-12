package com.example.androidserver.Admin.service;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

@Service
public class AdminService {
    // 최근 인기있는 주제 분석
    public int getPopularTopicsService() {
        return 1;
    }

    // 소속 회사별 활동 현황 분석
    public int getActivityCompanyService() {
        return 1;
    }

    // 시간대별 활동 분석
    public int getActivityTimeService() {
        return 1;
    }

    // 사용자별 활동 통계
    public int getUserActivityStatsService(@RequestBody String stats) {
        return 1;
    }

    // 사용자가 작성한 질문의 개수
    public int getUserQuestionCountService(@PathVariable int uid) {
        return 1;
    }

    // 사용자가 작성한 코멘트 개수
    public int getUserCommentCountService(@PathVariable int uid) {
        return 1;
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
    public int getTopUserCompanyByCntService() {
        return 1;
    }

    // 가장 많은 질문 또는 코멘트를 작성한 회사
    public int getTopCompanyByCntService() {
        return 1;
    }

    // 사용자 응답 시간 분석
    public int getResponseTimeService(@PathVariable int uid) {
        return 1;
    }
}
