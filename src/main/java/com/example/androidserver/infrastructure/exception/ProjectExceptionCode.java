package com.example.androidserver.infrastructure.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ProjectExceptionCode {
  // Common 한글로 변경 해두 됨
  INVALID_INPUT_VALUE("C001", "Invalid Input Value"),
  NOT_FOUND_USER("C002", "사용자를 찾을 수 없습니다."),
  UNAUTHORIZED_USER("C003", "접근 권한이 없습니다: 계속하려면 로그인해 주세요");
  private final String code;
  private final String message;
}
