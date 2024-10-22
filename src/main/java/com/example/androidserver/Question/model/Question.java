package com.example.androidserver.Question.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import java.util.Date;

@Getter
@Setter
public class Question {
    private int qid;
    private int uid;
    private String title;
    private String content;
    // private String author;
    private String category;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSZ")  // 날짜 포맷 지정
    private Date createdAt;
    private Date updatedAt;
    //private Date createdAt;
    //private Date updatedAt;
}
