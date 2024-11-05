package com.example.androidserver.Question.service;

import com.example.androidserver.Question.model.Question;
import com.example.androidserver.Question.repo.QuestionRepo;
import com.example.androidserver.infrastructure.utils.JWTUtils;
import com.example.androidserver.user.repo.UserRepo;
import com.example.androidserver.user.service.UserService;
import com.example.androidserver.user.service.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class QuestionService {
    private final QuestionRepo questionRepo;
    private final UserRepo userRepo;
    private final UserServiceImpl userService;
    private final JWTUtils utils;

    /**
     * 새로운 질문을 저장하는 메서드
     * @param question 저장할 질문 객체
     * @return 저장된 질문의 결과 값
     */
    public int saveQuestion(Question question, String token) {
        String email = utils.getEmail(token);           // 토큰에서 이메일 추출
        Integer uid = userRepo.findUidByEmail(email);   // 이메일로 UID 조회
        question.setUid(uid);                           // UID를 Question 객체에 설정

        // 질문 저장 로직 호출
        return questionRepo.saveQuestion(question);
    }

    /**
     * 카테고리별 질문 목록을 가져오는 메서드
     * @param category 조회할 카테고리
     * @return 카테고리에 해당하는 질문 목록
     */
    public List<Question> getCategoryQuestions(String category) {
        return questionRepo.selectQuestionByCategory(category); // 카테고리별 질문 조회
    }

    public List<Question> getMyQuestion(int uid) {
        return questionRepo.getMyQuestion(uid);
    }

    /**
     * 카테고리와 제목을 기반으로 질문을 검색하는 메서드
     * @param category 질문의 카테고리
     * @param title 질문의 제목
     * @return 카테고리와 제목에 맞는 질문 목록
     */
    public List<Question> searchQuestionsByCategoryAndTitle(String category, String title) {
        return questionRepo.selectQuestionByCategoryAndTitle(category, title); // 카테고리와 제목을 기반으로 질문 검색
    }

    /**
     * 질문을 수정하는 메서드
     * @param question 수정할 질문 객체
     * @return 수정 결과 값 (성공 시 1, 실패 시 0)
     */
    public int updateQuestion(Question question) {
        return questionRepo.updateQuestion(question); // 질문 수정 로직 호출
    }

    /**
     * 질문을 삭제하는 메서드
     * @param qid 삭제할 질문의 ID
     * @return 삭제 결과 값 (성공 시 1, 실패 시 0)
     */
    public int deleteQuestion(int qid) {
        return questionRepo.deleteQuestion(qid); // 질문 삭제 로직 호출
    }
}
