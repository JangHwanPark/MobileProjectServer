package com.example.androidserver.Controller;
import com.example.androidserver.Entity.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import lombok.RequiredArgsConstructor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final JdbcTemplate jdbcTemplate;

    // 데이터베이스에서 사용자 데이터를 조회하는 API
    @GetMapping("/users")
    public List<User> getAllUsers() {
        String sql = "SELECT * FROM user";  // 간단한 SELECT 문

        return jdbcTemplate.query(sql, new UserRowMapper());
    }

    // 사용자 정보를 매핑하는 RowMapper
    private static class UserRowMapper implements RowMapper<User> {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setUid(rs.getInt("uid"));
            user.setEmail(rs.getString("email"));
            user.setInterest(rs.getString("interest"));
            return user;
        }
    }
}
