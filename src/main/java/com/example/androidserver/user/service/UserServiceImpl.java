package com.example.androidserver.user.service;

import com.example.androidserver.infrastructure.exception.ProjectException;
import com.example.androidserver.infrastructure.exception.ProjectExceptionCode;
import com.example.androidserver.infrastructure.utils.JWTUtils;
import com.example.androidserver.user.model.User;
import com.example.androidserver.user.repo.UserRepo;
import com.example.androidserver.user.repo.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
  private final UserRepository repository;
  private final UserRepo userRepo;
  private final JWTUtils util;

  @Override
  public User getUserByEmail(String email) {
    return repository.
            findByEmail(email).orElseThrow(() ->
                    new ProjectException(
                            HttpStatus.NOT_FOUND,
                            ProjectExceptionCode.NOT_FOUND_USER));
  }

  @Override
  public User getUser(String token) {
    String email = util.getEmail(token);
    return getUserByEmail(email);
  }

  public int registerUser(User user) {
    return userRepo.registerUser(user);
  }

  public List<User> selectAllUser() {
    return userRepo.selectAllUsers();
  }
}
