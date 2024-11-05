package com.example.androidserver.user.mapper;

import com.example.androidserver.user.model.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

// 사용자 정보를 매핑하는 RowMapper
public class UserRowMapper implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setUid(rs.getLong("uid"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setInterest(rs.getString("interest"));
        user.setRole(rs.getString("role"));
        user.setPassword(rs.getString("password"));
        user.setBirth(rs.getString("birth"));
        return user;
    }
}
