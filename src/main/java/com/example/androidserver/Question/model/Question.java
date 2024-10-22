package com.example.androidserver.Question.model;

import lombok.Getter;
import lombok.Setter;
import java.util.Date;

@Getter
@Setter
public class Question {
    private int qid;
    private int uid;
    private String content;
    private String category;
    private Date createAt;
}
