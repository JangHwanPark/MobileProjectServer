package com.example.androidserver.Question.mapper;

import com.example.androidserver.Question.model.Question;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

// 공통 로직을 추상 클래스로 분리
public abstract class AbstractQuestionRowMapper implements RowMapper<Question> {

    @Override
    public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
        Question question = mapCommonFields(rs);
        mapAdditionalFields(rs, question);
        return question;
    }

    // 공통 필드 매핑
    private Question mapCommonFields(ResultSet rs) throws SQLException {
        Question question = new Question();
        question.setQid(rs.getInt("qid"));
        question.setUid(rs.getInt("uid"));
        question.setTitle(rs.getString("title"));
        question.setContent(rs.getString("content"));
        question.setCategory(rs.getString("category"));
        question.setUpdatedAt(rs.getTimestamp("updateAt"));
        question.setCreatedAt(rs.getTimestamp("createAt"));
        question.setGreat(rs.getInt("great"));
        return question;
    }

    // 추가 필드 매핑 (서브 클래스에서 구현)
    protected abstract void mapAdditionalFields(ResultSet rs, Question question) throws SQLException;
}
