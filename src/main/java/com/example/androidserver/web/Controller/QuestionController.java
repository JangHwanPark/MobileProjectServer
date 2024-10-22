package com.example.androidserver.web.Controller;

import com.example.androidserver.Question.model.Question;
import com.example.androidserver.Question.service.QuestionService;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@RestController
public class QuestionController {
    private final JdbcTemplate jdbcTemplate;
    private final QuestionService questionService;

    // 생성자
    public QuestionController(
            JdbcTemplate jdbcTemplate,
            QuestionService questionService
    ) {
        this.jdbcTemplate = jdbcTemplate;
        this.questionService = questionService;
    }

    // 모든 질문 쿼리
    @GetMapping("/question/all")
    public List<Question> getAllQuestions() {
        return questionService.getAllQuestions();
    }

    // 질문 저장
    @PostMapping("/question/save")
    public String saveQuestion(@RequestBody Question question) {
        int result = questionService.saveQuestion(question);
        return result == 1 ? "successfully!" : "Failed";
    }
}
