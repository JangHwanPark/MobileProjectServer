package com.example.androidserver.web.Controller;

import com.example.androidserver.Comment.service.CommentService;
import com.example.androidserver.Question.model.Question;
import com.example.androidserver.Question.service.QuestionService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Log4j2
@RestController
@RequestMapping("/api/v1/question")
@AllArgsConstructor
public class QuestionController {
    private final QuestionService questionService;
    private final CommentService commentService;

    // 질문 저장
    @PostMapping("/post/save")
    public ResponseEntity<String> createControllerQuestion(
            @RequestHeader("Authorization") String token,
            @RequestBody Question question) {
        boolean result = questionService.createServiceQuestion(question, token);
        if (result) {
            return ResponseEntity.ok("Question saved successfully!");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save question");
        }
    }

    // 질문 수정
    @PostMapping("/post/{qid}/update")
    public int updateQuestion(@RequestBody Question question) {
        return questionService.updateQuestion(question);
    }

    // 질문 삭제
    @PostMapping("/post/{qid}/delete")
    public ResponseEntity<String> deleteQuestion(@PathVariable int qid) {
        // 모든 관련 댓글 삭제
        int commentResult = commentService.deleteAllComment(qid);

        // 질문 삭제 로직
        int questionResult = questionService.deleteQuestion(qid);
        if (commentResult == 1 && questionResult == 1) {
            return ResponseEntity.ok("Question deleted successfully!");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to delete question");
        }
    }

    // 카테고리가 질문하기인 데이터 출력
    @GetMapping("/get/category/question")
    public List<Question> getCategoryQuestion() {
        return questionService.getCategoryQuestions("질문답변");
    }

    // 카테고리가 자유게시판인 데이터 출력
    @GetMapping("/get/category/free-board")
    public List<Question> getCategoryFreeBoard() {
        return questionService.getCategoryQuestions("자유 게시판");
    }

    // 카테고리 또는 질문을 사용하여 데이터 검색
    @PostMapping("/post/{keyword}/question")
    public List<Question> searchQuestionsByKeywordController(@PathVariable String keyword) {
        return questionService.searchQuestionsByKeywordService(keyword);
    }

    // 특정 사용자가 작성한 데이터 출력
    @GetMapping("/get/my-post/{uid}")
    public List<Question> getMyQuestion(@PathVariable int uid) {
        return questionService.getMyQuestion(uid);
    }

    // 좋아요 버튼 클릭
    @PostMapping("/post/{qid}/great")
    public int greatQuestion(@PathVariable int qid) {
        return questionService.greatQuestion(qid);
    }
}
