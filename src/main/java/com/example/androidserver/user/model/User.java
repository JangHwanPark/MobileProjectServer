package com.example.androidserver.user.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import jakarta.persistence.Table;
import lombok.*;
import org.springframework.data.annotation.Id;

@Table(name = "user")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class User {
    @Id
    private Long id;
    // udid 값은 기기 고유 값인데 아마 string 일 거임
    private String udid;
    // 이건 알아서 하셈
    private int rid;
    private String email;
    private String password;
    private String role;
    // 관심?
    private String interest;
}
