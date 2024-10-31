package com.example.androidserver.Comment.service;

import com.example.androidserver.Comment.model.Comment;
import com.example.androidserver.Comment.repo.CommentRepo;
import com.example.androidserver.infrastructure.utils.JWTUtils;
import com.example.androidserver.user.repo.UserRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentRepo commentRepo;
    private final JWTUtils utils;
    private final UserRepo userRepo;

    public int createComment(Comment comment, String token) {
        String email = utils.getEmail(token);
        Integer uid = userRepo.findUidByEmail(email);
        comment.setUid(uid);
        return commentRepo.createComment(comment);
    }

    public int updateComment(Comment comment) {
        return commentRepo.updateComment(comment);
    }

    public int deleteComment(int commentId) {
        return commentRepo.deleteComment(commentId);
    }
}
