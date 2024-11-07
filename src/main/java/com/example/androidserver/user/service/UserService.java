package com.example.androidserver.user.service;

import com.example.androidserver.user.model.User;

public interface UserService {
  User getUserByEmailService(String email);

  /**
   * 토큰을 받아서 사용자 정보를 반환하는 메서드
   * @param token 사용자의 토큰
   * @return {@link User} 사용자 정보
   */
  User getUserService(String token);
}
