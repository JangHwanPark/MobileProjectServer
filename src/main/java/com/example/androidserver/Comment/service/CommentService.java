package com.example.androidserver.Comment.service;

import com.example.androidserver.Comment.model.Comment;
import com.example.androidserver.Comment.repo.CommentRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentRepo commentRepo;

    public int createComment(Comment comment) {
        return commentRepo.createComment(comment);
    }

    public int updateComment(Comment comment) {
        return commentRepo.updateComment(comment);
    }

    public int deleteComment(int commentId) {
        return commentRepo.deleteComment(commentId);
    }
}
