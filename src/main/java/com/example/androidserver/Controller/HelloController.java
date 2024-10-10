package com.example.androidserver.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public Map<String, String> sayHello() {
        // JSON 응답으로 반환할 데이터를 Map에 넣습니다.
        Map<String, String> response = new HashMap<>();
        response.put("message", "Hello Android!");

        // Map이 자동으로 JSON 형식으로 변환되어 반환됩니다.
        return response;
    }
}
