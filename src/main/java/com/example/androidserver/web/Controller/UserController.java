package com.example.androidserver.web.Controller;
import com.example.androidserver.user.model.User;
import com.example.androidserver.user.service.UserService;
import com.example.androidserver.web.dto.common.CommonResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@RestController
public class UserController {
    // Logger 변수 선언
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    private final UserService userService;
    private final PasswordEncoder encoder;
    private final JdbcTemplate jdbcTemplate;

    public UserController(UserService userService, PasswordEncoder encoder, JdbcTemplate jdbcTemplate) {
        this.userService = userService;
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


    @GetMapping("/get/user/info")
    public ResponseEntity<?> getUserInfo(@RequestHeader("Authorization") String token) {
        return ResponseEntity.ok(CommonResponse.success(userService.getUser(token)));
    }


    // 데이터베이스에서 사용자 데이터를 조회하는 API
    @GetMapping("/get/users")
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
