package com.example.androidserver.user.repo;

import com.example.androidserver.user.mapper.UserRowMapper;
import com.example.androidserver.user.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class UserRepo {
    // JdbcTemplate 주입
    private final JdbcTemplate jdbcTemplate;
    private final PasswordEncoder encoder;

    // 회원가입
    public int registerUserRepo(User user) {
        String encodedPassword = encoder.encode(user.getPassword());
        String sql = "INSERT INTO user (name, email, password, interest, role, birth, company) VALUES (?, ?, ?, ?, 'customer', ?, ?)";

        // 사용자 정보 삽입
        return jdbcTemplate.update(sql, user.getName(), user.getEmail(), encodedPassword, user.getInterest(), user.getRole(), user.getBirth(), user.getCompany());
    }

    // 사용자 데이터 조회
    // select_all_data 적용
    public List<User> selectAllUsersRepo() {
        String sql = "SELECT * FROM user";
        return jdbcTemplate.query(sql, new UserRowMapper());
    }

    // 이메일로 사용자 UID 조회
    public Integer findUidByEmailRepo(String email) {
        String sql = "SELECT uid FROM user WHERE email = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{email}, Integer.class);
    }
}
