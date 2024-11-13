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

    // 소속 회사별 활동 현황 분석
    @GetMapping("/get/activity/company")
    public List<Map<String, Object>> getActivityCompany() {
        return adminService.getActivityCompanyService();
    }

    // 시간대별 활동 분석
    @GetMapping("/get/activity/time")
    public List<Map<String, Object>> getActivityTime() {
        return adminService.getActivityTimeService();
    }

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

    // 사용자가 작성한 질문의 개수 X
    @PostMapping("/post/{table}/{uid}/count")
    public int getUserQuestionCount(@PathVariable String table, @PathVariable int uid) {
        return adminService.getUserQuestionCountService(table, uid);
    }

    // 사용자가 작성한 코멘트 개수 X
    @PostMapping("/post/comment/{uid}/count")
    public int getUserCommentCount(@PathVariable int uid) {
        return adminService.getUserCommentCountService(uid);
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
    @PostMapping("/post/{company}/{table}/top/user")
    public List<Map<String, Object>> getTopUserCompanyByCount(@PathVariable String company, @PathVariable String table) {
        return adminService.getTopUserCompanyByCountService(company, table);
    }

    // 소속 회사별 활동 현황 분석
    @PostMapping("/post/company/{table}/top")
    public List<Map<String, Object>> getActivityByCompany(@PathVariable String table) {
        return adminService.getActivityByCompanyService(table);
    }

    // 시간대별 활동 분석

    // 사용자 응답 시간 분석
    @PostMapping("/post/{uid}/response/time")
    public List<Map<String, Object>> getResponseTime(@PathVariable int uid) {
        return adminService.getResponseTimeService(uid);
    }
}
