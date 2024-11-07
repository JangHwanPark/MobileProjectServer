package com.example.androidserver.web.Controller;
import com.example.androidserver.user.model.User;
import com.example.androidserver.user.service.UserService;
import com.example.androidserver.user.service.UserServiceImpl;
import com.example.androidserver.web.dto.common.CommonResponse;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/v1/user")
@AllArgsConstructor
public class UserController {
    private final UserService userService;
    private final UserServiceImpl serviceImpl;

    // 사용자 등록
    // 이걸 이렇게 적으면 POST /api/v1/user/register 이렇게 됨 ㅇㅋ ㅇㅇ 또 뭐 좋은게 있을라나~
    @PostMapping("/post/register")
    public String registerUserController(@RequestBody User user) {
        int result = serviceImpl.registerUserService(user);
        return result == 1 ? "successfully" : "failed";
    }

    // 데이터베이스에서 사용자 데이터를 조회하는 API
    @GetMapping("/get/all/users")
    public List<User> getAllUsersController() {
        return serviceImpl.selectAllUserService();
    }

    @GetMapping("/get/info")
    public ResponseEntity<?> getUserInfoController(@RequestHeader(value = "Authorization") String token) {
        return ResponseEntity.ok(CommonResponse.success(userService.getUserService(token)));
    }
}
