package com.example.androidserver.Question.mapper;
import com.example.androidserver.Question.model.Question;
import java.sql.ResultSet;

public class QuestionRowMapper extends AbstractQuestionRowMapper {
    // RowMapper를 사용해 ResultSet을 Question 객체로 매핑
    // 추가 필드가 없으므로 구현할 내용 없음
    @Override
    protected void mapAdditionalFields(ResultSet rs, Question question) {}
}