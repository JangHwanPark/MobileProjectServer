package com.example.androidserver.Comment.service;

import com.example.androidserver.Comment.model.Comment;
import com.example.androidserver.Comment.repo.CommentRepo;
import com.example.androidserver.infrastructure.utils.JWTUtils;
import com.example.androidserver.user.repo.UserRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentRepo commentRepo;
    private final JWTUtils utils;
    private final UserRepo userRepo;

    public List<Comment> selectCommentByQuestionId(int qid) {
        return commentRepo.selectCommentByQuestionId(qid);
    }

    public int createComment(Comment comment, String token) {
        String email = utils.getEmail(token);
        Long uid = userRepo.findUidByEmailRepo(email);
        comment.setUid(uid);
        log.info("createComment: " + comment.toString());
        log.info("createComment uid: " + uid);
        log.info("createComment email: " + email);
        return commentRepo.createComment(comment);
    }

    public int updateComment(Comment comment) {
        return commentRepo.updateComment(comment);
    }

    public int deleteComment(int cid) {
        return commentRepo.deleteComment(cid);
    }

    public int deleteAllComment(int qid) {
        return commentRepo.deleteAllComment(qid);
    }
}
