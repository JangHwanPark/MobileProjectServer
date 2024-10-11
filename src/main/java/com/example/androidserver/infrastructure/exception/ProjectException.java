package com.example.androidserver.infrastructure.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class ProjectException extends RuntimeException{
  private final HttpStatus httpStatus;
  private final String code;
  private final String message;

  public ProjectException(HttpStatus httpStatus, ProjectExceptionCode c) {
    this.httpStatus = httpStatus;
    this.code = c.getCode();
    this.message = c.getMessage();
  }
}
