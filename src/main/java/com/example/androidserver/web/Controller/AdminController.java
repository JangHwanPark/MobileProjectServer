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
    public List<Map<String, Object>> getUserActivityStats(@RequestBody String stats) {
        return adminService.getUserActivityStatsService(stats);
    }

    // 사용자가 작성한 질문의 개수
    @PostMapping("/post/question/{uid}/count")
    public int getUserQuestionCount(@PathVariable int uid) {
        return adminService.getUserQuestionCountService(uid);
    }

    // 사용자가 작성한 코멘트 개수
    @PostMapping("/post/comment/{uid}/count")
    public int getUserCommentCount(@PathVariable int uid) {
        return adminService.getUserCommentCountService(uid);
    }

    // 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
    @PostMapping("/post/company/{table}/top/user")
    public List<Map<String, Object>> getTopUserCompanyByCount(@PathVariable String table) {
        return adminService.getTopUserCompanyByCountService(table);
    }

    // 가장 많은 질문 또는 코멘트를 작성한 회사
    @PostMapping("/post/company/{table}/top")
    public List<Map<String, Object>> getTopCompanyByCount(@PathVariable String table) {
        return adminService.getTopCompanyByCountService(table);
    }

    // 사용자 응답 시간 분석
    @PostMapping("/post/{uid}/response/time")
    public List<Map<String, Object>> getResponseTime(@PathVariable int uid) {
        return adminService.getResponseTimeService(uid);
    }
}
