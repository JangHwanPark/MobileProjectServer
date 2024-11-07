package com.example.androidserver.Question.repo;

import com.example.androidserver.Question.mapper.QuestionRowMapper;
import com.example.androidserver.Question.mapper.QuestionWithUserRowMapper;
import com.example.androidserver.Question.model.Question;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j2
@Repository
@RequiredArgsConstructor
public class QuestionRepo {
    // JdbcTemplate 주입
    private final JdbcTemplate jdbcTemplate;
    private SimpleJdbcCall createQuestionCall;
    private SimpleJdbcCall updateQuestionCall;
    private SimpleJdbcCall deleteQuestionCall;
    private SimpleJdbcCall incrementGreatCall;
    private SimpleJdbcCall selectGreatCountCall;

    @PostConstruct
    private void init() {
        createQuestionCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("create_question");
        updateQuestionCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("update_question");
        deleteQuestionCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("delete_question");
        incrementGreatCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("increment_great");
        selectGreatCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("select_great_count");
    }

    // 질문을 데이터베이스에 저장하는 메서드
    public boolean createRepoQuestion(Question question) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedCreatedAt = dateFormat.format(question.getCreatedAt());
        String formattedUpdatedAt = dateFormat.format(question.getUpdatedAt());

        Map<String, Object> params = new HashMap<>();
        params.put("p_qid", question.getQid());
        params.put("p_uid", question.getUid());
        params.put("p_content", question.getContent());
        params.put("p_category", question.getCategory());
        params.put("p_title", question.getTitle());
        params.put("p_createAt", Timestamp.valueOf(formattedCreatedAt));
        params.put("p_updateAt", Timestamp.valueOf(formattedUpdatedAt));

        try {
            createQuestionCall.execute(params);
            return true; // 성공적으로 실행된 경우
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure", e);
            return false; // 실패 시 false 반환
        }
    }

    // 질문 수정
    public int updateQuestion(Question question) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedUpdatedAt = dateFormat.format(question.getUpdatedAt());

        Map<String, Object> params = new HashMap<>();
        params.put("p_qid", question.getQid());
        params.put("p_content", question.getContent());
        params.put("p_category", question.getCategory());
        params.put("p_title", question.getTitle());
        params.put("p_updateAt", Timestamp.valueOf(formattedUpdatedAt));

        try {
            updateQuestionCall.execute(params);
            return question.getQid();
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure", e);
            return 0;
        }
    }

    // 질문 삭제
    public int deleteQuestion(int qid) {
        Map<String, Object> params = new HashMap<>();
        params.put("p_qid", qid);

        try {
            deleteQuestionCall.execute(params);
            return 1;
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure", e);
            return 0;
        }
    }

    // 카테고리별 데이터 조회
    public List<Question> selectQuestionByCategory(String category) {
        String sql = "select * from question as q join user as u on q.uid = u.uid where q.category = ? group by q.qid";
        return jdbcTemplate.query(sql, new QuestionWithUserRowMapper(), category);
    }

    // 특정 사용자별 데이터 조회
    public List<Question> getMyQuestion(int uid) {
        String sql = "select * from question join user on question.uid = user.uid where question.uid = ?";
        return jdbcTemplate.query(sql, new QuestionWithUserRowMapper(), uid);
    }

    // 질문 검색
    public List<Question> selectQuestionByCategoryAndTitle(String category, String title) {
        String sql = "SELECT * FROM question WHERE category = ? AND title = ?";
        return jdbcTemplate.query(sql, new QuestionRowMapper(), category, title);
    }

    // 좋아요 수 증가
    public void incrementGreat(int qid) {
        Map<String, Object> params = new HashMap<>();
        params.put("p_qid", qid);
        incrementGreatCall.execute(params);
    }

    // 좋아요 수 조회
    public int getGreatCount(int qid) {
        Map<String, Object> params = new HashMap<>();
        params.put("p_qid", qid);

        try {
            selectGreatCountCall.execute(params);
            return 1;
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure", e);
            return 0;
        }
    }
}
