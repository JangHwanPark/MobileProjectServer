package com.example.androidserver.Comment.repo;
import com.example.androidserver.Comment.mapper.CommentRowMapper;
import com.example.androidserver.Comment.model.Comment;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

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
}
