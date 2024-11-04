package com.example.androidserver.Comment.repo;

import com.example.androidserver.Comment.model.Comment;
import com.example.androidserver.user.model.User;
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
public class CommentRepo {
    private final JdbcTemplate jdbcTemplate;

    // 댓글 저장
    public int createComment(Comment comment) {
        String sql = "INSERT INTO comment (cid, uid, qid, content, createAt, updateAt) VALUES (?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(
                sql,
                comment.getCid(),
                comment.getUid(),
                comment.getQid(),
                comment.getContent(),
                comment.getCreateAt(),
                comment.getUpdateAt()
        );
    }

    // 댓글 수정
    public int updateComment(Comment comment) {
        String sql = "UPDATE comment SET content = ?, updateAt = ? WHERE cid = ?";
        return jdbcTemplate.update(sql, comment.getContent(), comment.getUpdateAt(), comment.getCid());
    }

    // 질문별 댓글 불러오기
    public List<Comment> selectCommentByQuestionId(int qid) {
        String sql = "select * from comment join user on comment.uid = user.uid where comment.qid = ? group by comment.cid";
        return jdbcTemplate.query(sql, new CommentRowMapper(), qid);
    }

    // 댓글 삭제
    public int deleteComment(int cid) {
        String sql = "DELETE FROM comment WHERE cid = ?";
        return jdbcTemplate.update(sql, cid);
    }

    // 게시글 내 모든 댓글 삭제
    public int deleteAllComment(int qid) {
        String sql = "DELETE FROM comment WHERE qid = ?";
        return jdbcTemplate.update(sql, qid);
    }

    private static class CommentRowMapper implements RowMapper<Comment> {
        private final UserMapper userMapper = new UserMapper(); // UserMapper 인스턴스 생성

        @Override
        public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
            Comment comment = new Comment();
            comment.setCid(rs.getInt("cid"));
            comment.setUid(rs.getInt("uid"));
            comment.setQid(rs.getInt("qid"));
            comment.setContent(rs.getString("content"));
            comment.setCreateAt(rs.getTimestamp("createAt"));
            comment.setUpdateAt(rs.getTimestamp("updateAt"));

            // User 정보 매핑
            User user = userMapper.mapRow(rs, rowNum); // UserMapper 사용
            comment.setUser(user); // Comment에 User 설정
            return comment;
        }
    }

    public static class UserMapper implements RowMapper<User> {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setUid(rs.getLong("uid"));
            user.setName(rs.getString("name"));
            user.setCompany(rs.getString("company"));
            user.setEmail(rs.getString("email"));
            // 다른 필요한 필드가 있다면 추가
            return user;
        }
    }

}
