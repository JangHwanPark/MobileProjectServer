package com.example.androidserver.Question.service;

import com.example.androidserver.Question.model.Question;
import com.example.androidserver.Question.repo.QuestionRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QuestionService {
    private final QuestionRepo questionRepo;
  
    public int saveQuestion(Question question) {
        return questionRepo.saveQuestion(question); // 질문 저장 로직 호출
    }

    public List<Question> getCategoryQuestions(String category) {
        return questionRepo.selectQuestionByCategory(category);
    }
}
