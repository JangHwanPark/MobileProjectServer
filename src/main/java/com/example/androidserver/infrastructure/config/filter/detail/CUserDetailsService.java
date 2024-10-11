package com.example.androidserver.infrastructure.config.filter.detail;

import com.example.androidserver.infrastructure.exception.ProjectException;
import com.example.androidserver.infrastructure.exception.ProjectExceptionCode;
import com.example.androidserver.user.model.User;
import com.example.androidserver.user.repo.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CUserDetailsService implements UserDetailsService {
  private final UserRepository repository;
  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    User user = repository.findByEmail(username)
            .orElseThrow(() -> new ProjectException(HttpStatus.NOT_FOUND, ProjectExceptionCode.NOT_FOUND_USER));
    return org.springframework.security.core.userdetails.User.builder()
            .username(user.getEmail())
            .password(user.getPassword())
            .roles(user.getRole())
            .build();
  }
}
