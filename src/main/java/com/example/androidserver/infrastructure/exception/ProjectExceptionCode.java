package com.example.androidserver.infrastructure.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ProjectExceptionCode {
  // Common 한글로 변경 해두 됨
  INVALID_INPUT_VALUE("C001", "Invalid Input Value"),
  NOT_FOUND_USER("C002", "사용자를 찾을 수 없습니다."),;
  private final String code;
  private final String message;
}
