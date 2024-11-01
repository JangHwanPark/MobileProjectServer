package com.example.androidserver.Question.repo;

import com.example.androidserver.Question.model.Question;
import com.example.androidserver.user.model.User;
import com.example.androidserver.user.service.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Log4j2
@Repository
@RequiredArgsConstructor
public class QuestionRepo {
    // JdbcTemplate 주입
    private final JdbcTemplate jdbcTemplate;

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
                question.getCreatedAt(),
                question.getUpdatedAt()
        );
    }

    // 카테고리별 데이터 조회
    public List<Question> selectQuestionByCategory(String category) {
        String sql = "select * from question as q join user as u on q.uid = u.uid where q.category = ? group by q.qid";
        return jdbcTemplate.query(sql, new QuestionRowMapper(), category);
    }

    // 질문 검색
    public List<Question> selectQuestionByCategoryAndTitle(String category, String title) {
        String sql = "SELECT * FROM question WHERE category = ? AND title = ?";
        return jdbcTemplate.query(sql, new QuestionRowMapper(), category, title);
    }

    // 질문 수정
    public int updateQuestion(Question question) {
        String sql = "UPDATE question SET content = ?, category = ?, title = ?, updateAt = ? WHERE qid = ?";
        return jdbcTemplate.update(
                sql,
                question.getContent(),   // INSERT/UPDATE 시 사용될 content 값
                question.getCategory(),  // INSERT/UPDATE 시 사용될 category 값
                question.getTitle(),     // INSERT/UPDATE 시 사용될 title 값
                question.getUpdatedAt(), // INSERT/UPDATE 시 사용될 updateAt 값
                question.getQid()        // WHERE 조건에 사용될 qid 값
        );
    }

    // 질문 삭제
    public int deleteQuestion(int qid) {
        String sql = "DELETE FROM question WHERE qid = ?";
        return jdbcTemplate.update(sql, qid);
    }

    // RowMapper를 사용해 ResultSet을 Question 객체로 매핑
    private static class QuestionRowMapper implements RowMapper<Question> {
        @Override
        public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
            Question question = new Question();
            question.setQid(rs.getInt("qid"));
            question.setUid(rs.getInt("uid"));
            question.setTitle(rs.getString("title"));
            question.setContent(rs.getString("content"));
            question.setCategory(rs.getString("category"));
            question.setUpdatedAt(rs.getTimestamp("updateAt"));
            question.setCreatedAt(rs.getTimestamp("createAt"));

            User user = new User();
            user.setName(rs.getString("name"));
            user.setCompany(rs.getString("company"));
            question.setAuthor(user);
            return question;
        }
    }
}
