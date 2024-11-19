package com.example.androidserver.web.Controller;

import com.example.androidserver.Admin.service.AdminService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/v1/admin")
public class AdminController {

    private final AdminService adminService;

    // 최근 인기있는 주제 분석
    @GetMapping("/get/popular/topics")
    public List<Map<String, Object>> getPopularTopics() {
        return adminService.getPopularTopicsService();
    }

    // 주제별 활동 분석
    @GetMapping("/get/activity/topics")
    public List<Map<String, Object>> getActivityByTopic() {
        return adminService.getActivityByTopicService();
    }

    // 질문
    // 월별 질문, 코멘트 등록 횟수 통계
    @PostMapping("/post/{year}/{month}/{keyword}/count")
    public List<Map<String, Object>> postMonthQuestionCount(@PathVariable String keyword, @PathVariable int month, @PathVariable int year) {
        return adminService.postMonthQuestionCountService(keyword, month, year);
    }

    // 년별 질문 등록 횟수 통계
    @GetMapping("/get/yearly/question/count")
    public List<Map<String, Object>> getYearlyQuestionCount() {
        return adminService.getYearlyQuestionCountService();
    }

    // 사용자
    // 사용자별 활동 통계
    @PostMapping("/post/activity/user/stats")
    public List<Map<String, Object>> getUserActivityStats(@RequestBody Map<String, String> requestBody) {
        // "stats"라는 키로 값이 넘어온다고 가정
        String stats = requestBody.get("stats");

        // stats 값이 null이 아닌지 확인
        if (stats == null || stats.isEmpty()) {
            throw new IllegalArgumentException("Period parameter 'stats' is missing or empty");
        }

        return adminService.getUserActivityStatsService(stats);
    }

    // 회사
    // 소속 회사별 활동 현황 분석
    @GetMapping("/get/activity/company")
    public List<Map<String, Object>> getActivityCompany() {
        return adminService.getActivityCompanyService();
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자 - 변경 (회사별 사용자 통계)
    @PostMapping("/post/{company}/{table}/top/user")
    public List<Map<String, Object>> getTopUserCompanyByCount(@PathVariable String company, @PathVariable String table) {
        return adminService.getTopUserCompanyByCountService(company, table);
    }

    // 가장 많은 질문 또는 코멘트를 작성한 회사 - 변경
    @PostMapping("/post/company/{table}/top")
    public List<Map<String, Object>> getTopCompanyByCount(@PathVariable String table) {
        return adminService.getActivityByCompanyService(table);
    }

    // 회사별 연도별 질문 및 댓글 작성 횟수 분석
    @PostMapping("/post/company/{keyword}")
    public List<Map<String, Object>> getCompanyByKeyword(@PathVariable String keyword) {
        return adminService.getCompanyByKeyword(keyword);
    }
}
