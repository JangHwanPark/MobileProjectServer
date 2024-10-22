package com.example.androidserver.Question.repo;

import com.example.androidserver.Question.model.Question;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionRepo {
    // JdbcTemplate 주입
    private final JdbcTemplate jdbcTemplate;

    // 생성자 주입
    public QuestionRepo(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // 질문을 데이터베이스에 저장하는 메서드
    public int saveQuestion(Question question) {
        String sql = "INSERT INTO question (qid, uid, content, category, createAt) VALUES (?, ?, ?, ?, ?)";

        // JdbcTemplate의 update 메서드를 사용하여 SQL 실행
        return jdbcTemplate.update(
                sql,
                question.getQid(),
                question.getUid(),
                question.getContent(),
                question.getCategory(),
                question.getCreateAt()
        );
    }
}
