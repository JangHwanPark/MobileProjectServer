package com.example.androidserver.Review.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Table(name = "review")
@Entity
@Getter
@Setter
public class Review {
    @Id
    private long rvid;
    private int uid;
    private int qid;
    private String content;
    private Date createAt;
    private Date updateAt;
}
