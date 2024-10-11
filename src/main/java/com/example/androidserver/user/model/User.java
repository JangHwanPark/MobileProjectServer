package com.example.androidserver.user.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private int uid;
    private int rid;
    private String email;
    private String password;
    private String interest;
}
