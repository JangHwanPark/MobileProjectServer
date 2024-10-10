package com.example.androidserver.Entity;

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
