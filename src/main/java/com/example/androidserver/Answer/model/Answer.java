package com.example.androidserver.Answer.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Table(name = "answer")
@Entity
@Getter
@Setter
public class Answer {
    @Id
    private int ansid;
    private int qid;
    private int uid;
    private String content;
    private Date createAt;
    private Date updateAt;
}
