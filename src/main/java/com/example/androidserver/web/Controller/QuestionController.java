package com.example.androidserver.web.Controller;

import com.example.androidserver.Question.model.Question;
import com.example.androidserver.Question.service.QuestionService;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public class QuestionController {
    private final QuestionService questionService;

    // 생성자
    public QuestionController(
            QuestionService questionService
    ) {
        this.questionService = questionService;
    }

    // 질문 저장
    @PostMapping("/post/question/save")
    public String saveQuestion(@RequestBody Question question) {
        int result = questionService.saveQuestion(question);
        return result == 1 ? "successfully!" : "Failed";
    }

    // 질문 수정
    @PostMapping("/post/question/update")
    public int updateQuestion(@RequestBody Question question) {
        return questionService.updateQuestion(question);
    }

    // 질문 삭제
    @PostMapping("/post/question/delete")
    public int deleteQuestion(@RequestBody int questionId) {
        return questionService.deleteQuestion(questionId);
    }

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
