package com.example.androidserver.Entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private Long uid;
    private Long rid;
    private String email;
    private String password;
    private String interest;
}
