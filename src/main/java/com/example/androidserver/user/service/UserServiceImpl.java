package com.example.androidserver.user.service;

import com.example.androidserver.infrastructure.exception.ProjectException;
import com.example.androidserver.infrastructure.exception.ProjectExceptionCode;
import com.example.androidserver.infrastructure.utils.JWTUtils;
import com.example.androidserver.user.model.User;
import com.example.androidserver.user.repo.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
  private final UserRepository repository;
  private final JWTUtils util;

  @Override
  public User getUserByEmail(String email) {
    return repository.findByEmail(email)
            .orElseThrow(() -> new ProjectException(HttpStatus.NOT_FOUND, ProjectExceptionCode.NOT_FOUND_USER));
  }

  @Override
  public User getUser(String token) {
    log.info("Get user by token: {}", token);
    String email = util.getEmail(token);
    log.info("Get user by email: {}", email);
    return getUserByEmail(email);
  }
}
