package com.example.androidserver.web.Controller;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/api/v1/admin")
public class AdminController {
    // 최근 인기있는 주제 분석
    @GetMapping("/get/popular/topics")
    public int getPopularTopics() {
        return 1;
    }

    // 소속 회사별 활동 현황 분석
    @GetMapping("/get/activity/company")
    public int getActivityCompany() {
        return 1;
    }

    // 시간대별 활동 분석
    @GetMapping("/get/activity/time")
    public int getActivityTime() {
        return 1;
    }

    // 사용자별 활동 통계
    @PostMapping("/post/activity/user/stats")
    public int getUserActivityStats(@RequestBody String stats) {
        return 1;
    }

    // 사용자가 작성한 질문의 개수
    @PostMapping("/post/question/{uid}/count")
    public int getUserQuestionCount(@PathVariable int uid) {
        return 1;
    }

    // 사용자가 작성한 코멘트 개수
    @PostMapping("/post/comment/{uid}/count")
    public int getUserCommentCount(@PathVariable int uid) {
        return 1;
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
    public int getTopUserCompanyByCnt() {
        return 1;
    }

    // 가장 많은 질문 또는 코멘트를 작성한 회사
    public int getTopCompanyByCnt() {
        return 1;
    }

    // 사용자 응답 시간 분석
    @PostMapping("/post/{uid}/response/time")
    public int getResponseTime(@PathVariable int uid) {
        return 1;
    }
}
