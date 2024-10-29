package com.example.androidserver.web.Controller;
import com.example.androidserver.user.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@RestController
public class UserController {
    private final PasswordEncoder encoder;
    private final JdbcTemplate jdbcTemplate;

    public UserController(PasswordEncoder encoder, JdbcTemplate jdbcTemplate) {
        this.encoder = encoder;
        this.jdbcTemplate = jdbcTemplate;
    }

    // 사용자 등록
    @PostMapping("/post/user/register")
    public User registerUser(@RequestBody User user) {
        // 비밀번호 암호화
        String encodedPassword = encoder.encode(user.getPassword());
        String sql = "INSERT INTO user (udid, email, password, interest, role) VALUES (?, ?, ?, ?, 'customer')";

        // 사용자 정보 삽입
        jdbcTemplate.update(sql, user.getUdid(), user.getEmail(), encodedPassword, user.getInterest(), user.getRole());

        // 방금 등록한 사용자 데이터를 조회하여 반환
        String query = "SELECT * FROM user WHERE email = ?";
        return jdbcTemplate.queryForObject(query, new Object[]{user.getEmail()}, new UserRowMapper());
    }


    // 데이터베이스에서 사용자 데이터를 조회하는 API
    @GetMapping("/users")
    public List<User> getAllUsers() {
        String sql = "SELECT * FROM user";

        return jdbcTemplate.query(sql, new UserRowMapper());
    }

    // 사용자 정보를 매핑하는 RowMapper
    private static class UserRowMapper implements RowMapper<User> {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setUid(rs.getLong("uid"));
            user.setUdid(rs.getString("udid"));
            user.setEmail(rs.getString("email"));
            user.setInterest(rs.getString("interest"));
            user.setRole(rs.getString("role"));
            user.setPassword(rs.getString("password"));
            return user;
        }
    }
}
