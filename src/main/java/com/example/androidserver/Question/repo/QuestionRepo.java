package com.example.androidserver.Question.repo;

import com.example.androidserver.Question.model.Question;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class QuestionRepo {

    private final JdbcTemplate jdbcTemplate;

    // 질문을 데이터베이스에 저장하는 메서드
    public int saveQuestion(Question question) {
        String sql = "INSERT INTO questions (qid, uid, content, category, createAt) VALUES (?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, question.getQid(), question.getUid(), question.getContent(), question.getCategory(), question.getCreateAt());
    }
}
