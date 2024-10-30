package com.example.androidserver.web.Controller;
import com.example.androidserver.user.model.User;
import com.example.androidserver.user.service.UserService;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    public User getUserInfo() {
        // SecurityContext에서 현재 인증된 사용자 정보 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            throw new RuntimeException("User is not authenticated");
        }

        // 인증 정보에서 사용자 이메일 추출
        String email = authentication.getName();

        // 이메일 로그 출력
        logger.debug("Authenticated user email: {}", email);

        // 이메일로 사용자 정보 조회
        User user = userService.getUserByEmail(email);

        // 사용자 정보 로그 출력
        logger.debug("Retrieved user details: {}", user);
        return user;
    }


    // 데이터베이스에서 사용자 데이터를 조회하는 API
    @GetMapping("/api/get/users")
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
