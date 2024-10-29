package com.example.androidserver.Comment.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Table(name = "comment")
@Entity
@Getter
@Setter
public class Comment {
    @Id
    private int cid;
    private int uid;
    private int qid;
    private String content;
    private Date createAt;
    private Date updateAt;
}
