package com.example.androidserver.user.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;
import org.springframework.data.annotation.Id;

import java.util.Date;

@Entity
@Table(name = "user") // 매핑할 테이블 이름 지정
@Getter
@Setter
@ToString
@AllArgsConstructor
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
@RequiredArgsConstructor
public class User {
    @jakarta.persistence.Id
    @Id
    private Long uid;
    private String name;
    private String email;
    private String password;
    private String role;
    private String birth;
    // 관심?
    private String interest;
    private String company;
    private Date createAt;
}
