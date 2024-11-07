package com.example.androidserver.Comment.model;

import com.example.androidserver.user.model.User;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Table(name = "comment")
@Entity
@Getter
@Setter
@ToString
public class Comment {
    @Id
    private int cid;
    private Long uid;
    private int qid;
    private String content;
    private Date createAt;
    private Date updateAt;

    @ManyToOne(fetch = FetchType.LAZY) // 다대일 관계 설정
    @JoinColumn(name = "uid", insertable = false, updatable = false) // 외래 키 매핑
    private User user;
}
