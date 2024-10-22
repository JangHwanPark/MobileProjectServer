package com.example.androidserver.user.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;
import org.springframework.data.annotation.Id;

@Entity
@Table(name = "user") // 매핑할 테이블 이름 지정
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class User {
    @jakarta.persistence.Id
    @Id
    private Long uid;
    // udid 값은 기기 고유 값인데 아마 string 일 거임
    private String udid;
    private String email;
    private String password;
    private String role;
    // 관심?
    private String interest;
}
