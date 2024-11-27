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

    // Home
    // 최근 인기있는 주제 분석
    @GetMapping("/get/popular/topics")
    public List<Map<String, Object>> getPopularTopics() {
        return adminService.getPopularTopicsService();
    }

    // 모든 질문, 코멘트, 사용자 수 출력
    @GetMapping("/get/all/data")
    public List<Map<String, Object>> getAllData() { return adminService.getAllDataService(); }

    // Topic
    // 주제별 활동 분석
    @GetMapping("/get/activity/topics")
    public List<Map<String, Object>> getActivityByTopic() {
        return adminService.getActivityByTopicService();
    }

    // 질문 (Question)
    // 월별 질문, 코멘트 등록 횟수 통계
    @PostMapping("/post/{year}/{keyword}/count")
    public List<Map<String, Object>> postMonthQuestionCount(@PathVariable String keyword, @PathVariable int year) {
        return adminService.postMonthQuestionCountService(keyword, year);
    }

    // 댓글/질문 비율 분석
    @GetMapping("/get/question/comment/ratio")
    public List<Map<String, Object>> getQuestionCommentRatio() {
        return adminService.getQuestionCommentRatioService();
    }

    // 년별 질문 등록 횟수 통계
    @GetMapping("/get/yearly/question/count")
    public List<Map<String, Object>> getYearlyQuestionCount() {
        return adminService.getYearlyQuestionCountService();
    }

    @GetMapping("/get/question/period/count")
    public List<Map<String, Object>> getPeriodQuestionCount() {
        return adminService.getPeriodQuestionCountService();
    }

    // 사용자 (User)
    // 사용자 활동 순위 (활동이 가장 많은 사용자)
    @GetMapping("/get/top/activity/users")
    public List<Map<String, Object>> getTopActivityUsers() {
        return adminService.getTopActivityUsersService();
    }

    // 사용자별 활동 요약 (최근 활동한 사용자)
    @PostMapping("/post/user/activity/summary/{uid}")
    public List<Map<String, Object>> getUserActivitySummary(@PathVariable int uid) {
        return adminService.getUserActivitySummaryService(uid);
    }

    // 월별 사용자 생성 수
    @GetMapping("/get/monthly/user/signup/count")
    public List<Map<String, Object>> getMonthlyUserSignupCount() {
        return adminService.getMonthlyUserSignupCountService();
    }

    // 년도별 사용자 생성 수
    @GetMapping("/get/yearly/user/signup/count")
    public List<Map<String, Object>> getYearlyUserSignupCount() {
        return adminService.getYearlyUserSignupCountService();
    }

    // 회사 (Company)
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

    // 가장 많은 질문 또는 코멘트를 작성한 회사
    // 소속 회사별 활동 현황 분석
    @GetMapping("/post/company/question/top")
    public List<Map<String, Object>> getTopCompanyByCount() {
        return adminService.getActivityByCompanyService();
    }

    // 회사별 연도별 질문 및 댓글 작성 횟수 분석
    @PostMapping("/post/company/{keyword}")
    public List<Map<String, Object>> getCompanyByKeyword(@PathVariable String keyword) {
        return adminService.getCompanyByKeyword(keyword);
    }
}
