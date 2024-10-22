package com.example.androidserver.Question.repo;

import com.example.androidserver.Question.model.Question;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
        String sql = "INSERT INTO question (qid, uid, content, category, title, createAt, updateAt) VALUES (?, ?, ?, ?, ?, ?, ?)";

        // JdbcTemplate의 update 메서드를 사용하여 SQL 실행
        return jdbcTemplate.update(
                sql,
                question.getQid(),
                question.getUid(),
                question.getContent(),
                question.getCategory(),
                question.getTitle(),
                //question.getAuthor(),
                question.getCreatedAt(),
                question.getUpdatedAt()
        );
    }

    // db에 저장된 모든 질문을 조회하는 메서드
    public List<Question> selectQuestion() {
        String sql = "SELECT * FROM question";

        // query 메서드를 사용하여 결과를 List<Question>으로 변환
        // query 는 여러개의 데이터 반환
        // queryForObject 는 단일 데이터 반환
        return jdbcTemplate.query(sql, new QuestionRowMapper());
    }

    // RowMapper를 사용해 ResultSet을 Question 객체로 매핑
    private static class QuestionRowMapper implements RowMapper<Question> {
        @Override
        public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
            Question question = new Question();
            question.setQid(rs.getInt("qid"));
            question.setUid(rs.getInt("uid"));
            question.setContent(rs.getString("content"));
            question.setCategory(rs.getString("category"));
            // question.setAuthor(rs.getString("author"));
            question.setUpdatedAt(rs.getTimestamp("updatedAt"));
            question.setCreatedAt(rs.getTimestamp("createAt"));
            return question;
        }
    }
}
