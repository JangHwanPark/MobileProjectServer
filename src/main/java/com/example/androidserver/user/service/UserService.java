package com.example.androidserver.user.service;

import com.example.androidserver.user.model.User;

public interface UserService {
  User getUserByEmail(String email);
}
