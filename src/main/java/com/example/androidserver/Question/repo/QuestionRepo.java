package com.example.androidserver.Question.repo;
import com.example.androidserver.Question.mapper.QuestionWithUserRowMapper;
import com.example.androidserver.Question.model.Question;
import com.example.androidserver.utils.AbstractRepo;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Log4j2
@Repository
@RequiredArgsConstructor
public class QuestionRepo extends AbstractRepo {
    // JdbcTemplate 주입
    private final JdbcTemplate jdbcTemplate;
    private SimpleJdbcCall createQuestionCall;
    private SimpleJdbcCall selectQuestionByCategoryCall;
    private SimpleJdbcCall selectMyQuestionCall;
    private SimpleJdbcCall selectQuestionByKeywordCall;
    private SimpleJdbcCall updateQuestionCall;
    private SimpleJdbcCall deleteQuestionCall;
    private SimpleJdbcCall incrementGreatCall;
    private SimpleJdbcCall selectGreatCountCall;

    @PostConstruct
    @Override
    protected void initJdbcCalls() {
        createQuestionCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("create_question");
        selectQuestionByCategoryCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("select_question_by_category").returningResultSet("result", new QuestionWithUserRowMapper());
        selectMyQuestionCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("select_my_question").returningResultSet("result", new QuestionWithUserRowMapper());
        selectQuestionByKeywordCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("select_question_by_keyword").returningResultSet("result", new QuestionWithUserRowMapper());
        updateQuestionCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("update_question");
        deleteQuestionCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("delete_question");
        incrementGreatCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("increment_great");
        selectGreatCountCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("select_great_count");
    }

    // 질문을 데이터베이스에 저장하는 메서드
    public boolean createRepoQuestionRepo(Question question) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedCreatedAt = dateFormat.format(question.getCreatedAt());
        String formattedUpdatedAt = dateFormat.format(question.getUpdatedAt());

        Map<String, Object> params = createParamsMap(
                "p_qid", question.getQid(),
                "p_uid", question.getUid(),
                "p_interest", question.getInterest(),
                "p_content", question.getContent(),
                "p_category", question.getCategory(),
                "p_title", question.getTitle(),
                "p_createAt", Timestamp.valueOf(formattedCreatedAt),
                "p_updateAt", Timestamp.valueOf(formattedUpdatedAt)
        );

        try {
            createQuestionCall.execute(params);
            return true; // 성공적으로 실행된 경우
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure", e);
            return false; // 실패 시 false 반환
        }
    }

    // 질문 수정
    public int updateQuestionRepo(Question question) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedUpdatedAt = dateFormat.format(question.getUpdatedAt());

        Map<String, Object> params = createParamsMap(
                "p_qid", question.getQid(),
                "p_content", question.getContent(),
                "p_category", question.getCategory(),
                "p_title", question.getTitle(),
                "p_updateAt", Timestamp.valueOf(formattedUpdatedAt)
        );

        try {
            updateQuestionCall.execute(params);
            return question.getQid();
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure", e);
            return 0;
        }
    }

    // 질문 삭제
    public int deleteQuestionRepo(int qid) {
        Map<String, Object> params = createParamsMap("p_qid", qid);

        try {
            deleteQuestionCall.execute(params);
            return 1;
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure", e);
            return 0;
        }
    }

    // 카테고리별 데이터 조회
    public List<Question> selectQuestionByCategoryRepo(String category) {
        Map<String, Object> params = createParamsMap("p_category", category);

        try {
            Map<String, Object> result = selectQuestionByCategoryCall.execute(params);
            return (List<Question>) result.get("result");
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure 'select_question_by_category'", e);
            return new ArrayList<>(); // 예외 발생 시 빈 리스트 반환
        }
    }

    // 특정 사용자별 데이터 조회
    public List<Question> selectMyQuestionRepo(int uid) {
        Map<String, Object> params = createParamsMap("p_uid", uid);

        try {
            Map<String, Object> result = selectMyQuestionCall.execute(params);
            return (List<Question>) result.get("result");
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure 'select_my_question'", e);
            return new ArrayList<>(); // 예외 발생 시 빈 리스트 반환
        }
    }

    // 질문 검색
    public List<Question> selectQuestionByKeywordRepo(String keyword) {
        Map<String, Object> params = createParamsMap("p_keyword", keyword);

        try {
            Map<String, Object> result = selectQuestionByKeywordCall.execute(params);
            return (List<Question>) result.get("result");
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure 'select_question_by_keyword'", e);
            return new ArrayList<>(); // 예외 발생 시 빈 리스트 반환
        }
    }

    // 좋아요 수 증가
    public void incrementGreatRepo(int qid) {
        Map<String, Object> params = createParamsMap("p_qid", qid);
        incrementGreatCall.execute(params);
    }

    // 좋아요 수 조회
    public int getGreatCountRepo(int qid) {
        Map<String, Object> params = createParamsMap("p_qid", qid);
        try {
            selectGreatCountCall.execute(params);
            return 1;
        } catch (Exception e) {
            log.error("Error occurred while executing stored procedure", e);
            return 0;
        }
    }
}
