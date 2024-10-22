package com.example.androidserver.Question.service;

import com.example.androidserver.Question.model.Question;
import com.example.androidserver.Question.repo.QuestionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {

    @Autowired
    private QuestionRepo questionRepo;

    public int saveQuestion(Question question) {
        return questionRepo.saveQuestion(question); // 질문 저장 로직 호출
    }
}
