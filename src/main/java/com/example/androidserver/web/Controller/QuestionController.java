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
    private final JdbcTemplate jdbcTemplate;
    private final QuestionService questionService;


    @PostMapping("/save")
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
