package com.example.androidserver.Question.model;

import com.example.androidserver.user.model.User;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class Question {
    private int qid;
    private Long uid;
    private String interest;
    private String title;
    private String content;
    private String category;
    private int great;

    // 날짜 포맷 지정
    // @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSZ", timezone = "Asia/Seoul")
    private Date createdAt;
    private Date updatedAt;

    // 사용자 데이터
    private User author;
}
