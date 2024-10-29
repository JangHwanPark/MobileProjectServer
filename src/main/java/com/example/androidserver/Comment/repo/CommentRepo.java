package com.example.androidserver.Comment.repo;

import com.example.androidserver.Comment.model.Comment;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class CommentRepo {
    private final JdbcTemplate jdbcTemplate;

    // 댓글 저장
    public int createComment(Comment comment) {
        String sql = "INSERT INTO comment (cid, uid, qid, content, createAt, updateAt) VALUES (?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, comment);
    }

    // 댓글 수정
    public int updateComment(Comment comment) {
        String sql = "UPDATE comment SET qid = ?, content = ?, updateAt = ? WHERE id = ?";
        return jdbcTemplate.update(sql, comment);
    }

    // 댓글 삭제
    public int deleteComment(int cid) {
        String sql = "DELETE FROM comment WHERE id = ?";
        return jdbcTemplate.update(sql, cid);
    }

    // 질문별 댓글 불러오기
    public List<Comment> selectCommentByQuestionId(int questionId) {
        String sql = "select * from comment where question_id=?";
        return jdbcTemplate.query(sql, new CommentRowMapper(), questionId);
    }

    private static class CommentRowMapper implements RowMapper<Comment> {
        @Override
        public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
            Comment comment = new Comment();
            comment.setUid(rs.getInt("uid"));
            comment.setQid(rs.getInt("qid"));
            comment.setContent(rs.getString("content"));
            comment.setCreateAt(rs.getTimestamp("createAt"));
            comment.setUpdateAt(rs.getTimestamp("updateAt"));
            return comment;
        }
    }
}
