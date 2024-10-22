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
    private QuestionService questionService;

    // 생성자
    public QuestionController(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @PostMapping("/question/save")
    public String saveQuestion(@RequestBody Question question) {
        int result = questionService.saveQuestion(question);
        return result == 1 ? "successfully!" : "Failed";
    }

    // 프로시저 호출 api
    @GetMapping("/question")
    public List<Question> getAllQuestion() {
        return callGetAllQuestionProcedure();
    }

    // 프로시저를 호출하는 메소드
    private List<Question> callGetAllQuestionProcedure() {
        return jdbcTemplate.execute((Connection conn) -> {
            CallableStatement callableStatement = conn.prepareCall("{call getAllQuestion()}");
            ResultSet rs = callableStatement.executeQuery();

            List<Question> questions = new ArrayList<>();
            while (rs.next()) {
                Question question = new Question();
                question.setQid(rs.getInt("qid"));
                question.setContent(rs.getString("content"));
                question.setCategory(rs.getString("category"));
                question.setCreateAt(rs.getDate("createAt"));
            }
            return questions;
        });
    }
}
