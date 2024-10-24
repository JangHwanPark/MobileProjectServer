package com.example.androidserver.web.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AnswerController {

    // 답변 출력
    @GetMapping("/get/answer")
    public int getAnswer(){
        return 1;
    }

    // 답변 등록
    @PostMapping("/post/answer/save")
    public int saveAnswer() {
        return 1;
    }

    // 답변 수정
    @PostMapping("/post/answer/update")
    public int updateAnswer() {
        return 1;
    }

    // 답변 삭제
    @PostMapping("/post/answer/delete")
    public int deleteAnswer() {
        return 1;
    }
}
