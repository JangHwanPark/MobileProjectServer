package com.example.androidserver.infrastructure.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class ProjectException extends RuntimeException{
  private final HttpStatus httpStatus;
  private final String code;
  private final String message;

  public ProjectException(HttpStatus httpStatus, String code, String message) {
    this.httpStatus = httpStatus;
    this.code = code;
    this.message = message;
  }
}
