package com.example.androidserver.Answer.repo;

import com.example.androidserver.Answer.model.Answer;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class AnswerRepo {
    private final JdbcTemplate jdbcTemplate;

    private static class AnswerRowMapper implements RowMapper<Answer> {
        @Override
        public Answer mapRow(ResultSet rs, int rowNum) throws SQLException {
            Answer answer = new Answer();
            answer.setQid(rs.getInt("qid"));
            answer.setContent(rs.getString("content"));
            answer.setCreateAt(rs.getTimestamp("createAt"));
            answer.setUpdateAt(rs.getTimestamp("updateAt"));
            return answer;
        }
    }

    // 답변 조회
    public List<Answer> selectAnswerByQid(int qid) {
        String sql = "select * from answers where qid = ?";
        return jdbcTemplate.query(sql, new AnswerRowMapper(), qid);
    }

    // 답변 등록
    public int createAnswer(Answer answer) {
        String sql = "INSERT INTO answer (qid, uid, content, createAt) VALUES (?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                answer.getQid(),
                answer.getUid(),
                answer.getContent(),
                answer.getCreateAt(),
                answer.getUpdateAt()
        );
    }

    // 답변 수정
    public int updateAnswer(Answer answer) {
        String sql = "UPDATE answer SET content = ?, updateAt = ? WHERE qid = ?";
        return jdbcTemplate.update(
                sql,
                answer.getQid(),
                answer.getContent(),
                answer.getUpdateAt()
        );
    }

    // 답변 삭제
    public int deleteAnswer(int ansid) {
        String sql = "DELETE FROM answer WHERE ansid = ?";
        return jdbcTemplate.update(sql, ansid);
    }
}
