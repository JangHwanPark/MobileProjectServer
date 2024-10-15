package com.example.androidserver.user.service;

import com.example.androidserver.infrastructure.exception.ProjectException;
import com.example.androidserver.infrastructure.exception.ProjectExceptionCode;
import com.example.androidserver.user.model.User;
import com.example.androidserver.user.repo.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
  private final UserRepository repository;

  @Override
  public User getUserByEmail(String email) {
    return repository.findByEmail(email)
            .orElseThrow(() -> new ProjectException(HttpStatus.NOT_FOUND, ProjectExceptionCode.NOT_FOUND_USER));
  }
}
