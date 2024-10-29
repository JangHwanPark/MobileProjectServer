package com.example.androidserver.web.Controller;

import com.example.androidserver.Answer.model.Answer;
import com.example.androidserver.Answer.service.AnswerService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
public class AnswerController {
    private AnswerService answerService;

    // 답변 출력
    @GetMapping("/get/answer")
    public List<Answer> getAnswer(@RequestBody int qid){
        return answerService.selectAnswerByQid(qid);
    }

    // 답변 등록
    @PostMapping("/post/answer/save")
    public String saveAnswer(@RequestBody Answer answer) {
        int result = answerService.createAnswer(answer);
        return result == 1 ? "답변이 등록되었습니다." : "Failed";
    }

    // 답변 수정
    @PostMapping("/post/answer/update")
    public String updateAnswer(@RequestBody Answer answer) {
        int result = answerService.updateAnswer(answer);
        return result == 1 ? "답변이 수정되었습니다." : "Failed";
    }

    // 답변 삭제
    @PostMapping("/post/answer/delete")
    public String deleteAnswer(@RequestBody int answerId) {
        int result = answerService.deleteAnswer(answerId);
        return result == 1 ? "답변이 삭제되었습니다." : "Failed";
    }
}
