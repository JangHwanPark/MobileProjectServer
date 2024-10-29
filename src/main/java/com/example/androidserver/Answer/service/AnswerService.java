package com.example.androidserver.Answer.service;

import com.example.androidserver.Answer.model.Answer;
import com.example.androidserver.Answer.repo.AnswerRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AnswerService {
    private final AnswerRepo answerRepo;

    public List<Answer> selectAnswerByQid(int qid) {
        return answerRepo.selectAnswerByQid(qid);
    }

    public int createAnswer(Answer answer) {
        return answerRepo.createAnswer(answer);
    }

    public int updateAnswer(Answer answer) {
        return answerRepo.updateAnswer(answer);
    }

    public int deleteAnswer(int answerId) {
        return answerRepo.deleteAnswer(answerId);
    }
}
