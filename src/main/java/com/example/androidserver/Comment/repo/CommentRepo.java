package com.example.androidserver.Comment.repo;
import com.example.androidserver.Comment.mapper.CommentRowMapper;
import com.example.androidserver.Comment.model.Comment;
import com.example.androidserver.utils.AbstractRepo;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Log4j2
@Repository
@RequiredArgsConstructor
public class CommentRepo extends AbstractRepo {
    private final JdbcTemplate jdbcTemplate;
    private SimpleJdbcCall createCommentCall;
    private SimpleJdbcCall updateCommentCall;
    private SimpleJdbcCall deleteCommentCall;
    private SimpleJdbcCall selectCommentByQuestionIdCall;

    @PostConstruct
    @Override
    protected void initJdbcCalls() {
        createCommentCall = new SimpleJdbcCall(jdbcTemplate).withCatalogName("create_comment");
        updateCommentCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("update_comment");
        deleteCommentCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("delete_comment_condition_integer").returningResultSet("result", new CommentRowMapper());
        selectCommentByQuestionIdCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("select_comment_by_question_id");
    }

    // 댓글 저장
    public int createComment(Comment comment) {
        log.info("코멘트: " + comment.toString());
        if (comment.getUid() == null) {
            log.error("UID is null. Cannot create comment without a valid UID.");
            throw new IllegalArgumentException("UID cannot be null");
        }

        Map<String, Object> params = createParamsMap(
                "p_cid", comment.getCid(),
                "p_uid", comment.getUid(),
                "p_qid", comment.getQid(),
                "p_content", comment.getContent(),
                "p_createAt", comment.getCreateAt(),
                "p_updateAt", comment.getUpdateAt()
        );

        try {
            createCommentCall.execute(params);
            return 1;
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure", e);
            return 0;
        }
    }

    // 댓글 수정
    public int updateComment(Comment comment) {
        String sql = "UPDATE comment SET content = ?, updateAt = ? WHERE cid = ?";
        return jdbcTemplate.update(sql, comment.getContent(), comment.getUpdateAt(), comment.getCid());
    }

    // 질문별 댓글 불러오기
    public List<Comment> selectCommentByQuestionId(int qid) {
        String sql = "select * from comment_with_user where comment.qid = ? group by comment.cid";
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
