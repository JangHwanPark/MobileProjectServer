package com.example.androidserver.web.Controller;

import com.example.androidserver.Question.model.Question;
import com.example.androidserver.Question.service.QuestionService;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@RestController
// 이 컨트롤러의 모든 요청은 /question으로 시작
@RequestMapping("/question")
// @autowired 와 생성자를 대체하는 어노테이션
@RequiredArgsConstructor
public class QuestionController {
    private final QuestionService questionService;

    public String saveQuestion(@RequestBody Question question) {
        int result = questionService.saveQuestion(question);
        return result == 1 ? "successfully!" : "Failed";
    }

    // 질문 수정

    // 질문 삭제

    // 카테고리가 질문하기인 데이터 출력
    @GetMapping("/get/category/question")
    public List<Question> getCategoryQuestion() {
        return questionService.getCategoryQuestions("질문하기");
    }

    // 카테고리가 자유게시판인 데이터 출력
    @GetMapping("/get/category/free-board")
    public List<Question> getCategoryFreeBoard() {
        return questionService.getCategoryQuestions("자유 게시판");
    }
}
