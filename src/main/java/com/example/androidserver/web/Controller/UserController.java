package com.example.androidserver.web.Controller;
import com.example.androidserver.user.model.User;
import com.example.androidserver.user.service.UserService;
import com.example.androidserver.user.service.UserServiceImpl;
import com.example.androidserver.web.dto.common.CommonResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
public class UserController {
    // Logger 변수 선언
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    private final UserService userService;
    private final UserServiceImpl serviceImpl;

    public UserController(UserService userService, PasswordEncoder encoder, JdbcTemplate jdbcTemplate) {
        this.userService = userService;
        this.encoder = encoder;
        this.jdbcTemplate = jdbcTemplate;
    }

    // 사용자 등록
    // 이걸 이렇게 적으면 POST /api/v1/user/register 이렇게 됨 ㅇㅋ ㅇㅇ 또 뭐 좋은게 있을라나~
    @PostMapping("/post/register")
    public String registerUser(@RequestBody User user) {
        int result = serviceImpl.registerUser(user);
        return result == 1 ? "successfully" : "failed";
    }

    // 데이터베이스에서 사용자 데이터를 조회하는 API
    @GetMapping("/get/select-all")
    public List<User> getAllUsers() {
        return serviceImpl.selectAllUser();
    }

    @GetMapping("/get/info")
    public ResponseEntity<?> getUserInfo(@RequestHeader(value = "Authorization") String token) {
        return ResponseEntity.ok(CommonResponse.success(userService.getUser(token)));
    }
}
