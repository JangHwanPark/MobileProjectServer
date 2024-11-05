package com.example.androidserver.Question.mapper;

import com.example.androidserver.Question.model.Question;
import com.example.androidserver.user.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class QuestionWithUserRowMapper extends AbstractQuestionRowMapper {

    @Override
    protected void mapAdditionalFields(ResultSet rs, Question question) throws SQLException {
        User user = new User();
        user.setName(rs.getString("name"));
        user.setCompany(rs.getString("company"));
        question.setAuthor(user);
    }
}
