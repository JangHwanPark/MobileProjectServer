package com.example.androidserver.web.Controller;

import com.example.androidserver.Comment.model.Comment;
import com.example.androidserver.Comment.service.CommentService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/comment")
@AllArgsConstructor
public class CommentController {
    private CommentService commentService;

    // 댓글 등록
    @PostMapping("/post/create")
    public String createComment(@RequestBody Comment comment) {
        int result = commentService.createComment(comment);
        return result == 1 ? "답변이 등록되었습니다." : "답변이 등록되지 않았습니다.";
    }

    // 댓글 수정
    @PostMapping("/post/update")
    public String updateComment(@RequestBody Comment comment) {
        int result = commentService.updateComment(comment);
        return result == 1 ? "답변이 수정되었습니다." : "답변이 등록되지 않았습니다.";
    }

    // 댓글 삭제
    @PostMapping("/post/delete")
    public String deleteComment(@RequestBody int cid) {
        int result = commentService.deleteComment(cid);
        return result == 1 ? "답변이 삭제되었습니다." : "답변 삭제에 실패하였습니다.";
    }
}
