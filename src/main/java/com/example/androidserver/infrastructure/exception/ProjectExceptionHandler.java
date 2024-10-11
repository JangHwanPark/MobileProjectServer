package com.example.androidserver.infrastructure.exception;

import com.example.androidserver.web.dto.common.CommonResponse;
import jakarta.validation.ConstraintViolationException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@ControllerAdvice
public class ProjectExceptionHandler {
  @ExceptionHandler(ProjectException.class)
  public ResponseEntity<?> handleProjectException(ProjectException e) {
    log.error("ProjectException: {}", e.getMessage());
    Map<String, Object> body = Map.of(
      "code", e.getCode(),
      "message", e.getMessage()
    );

    return ResponseEntity.status(e.getHttpStatus()).body(CommonResponse.fail(body));
  }

  // 전역적으로 에러를 반환해야하는 경우
  // 아래 코드 처럼 에러 헨들러를 생성 하여 반환 값을 지정해 주시면 됩니다.

  /**
   * {@link ConstraintViolationException} 발생 시 처리하는 메서드입니다.
   *
   * @param e 발생한 {@link ConstraintViolationException}
   * @return HTTP 400 상태 코드와 유효성 검사 실패 메시지를 반환합니다.
   */
  @ExceptionHandler(ConstraintViolationException.class)
  @ResponseStatus(HttpStatus.BAD_REQUEST)
  public ResponseEntity<?> handleConstraintViolationException(
          ConstraintViolationException e
  ) {
    // 에러 로그 남기기
    log.error("ConstraintViolationException 발생: {}", e.getMessage(), e);

    Map<String, Object> res = new HashMap<>();
    res.put("errorCode", "VALIDATION_ERROR");
    res.put("message", e.getMessage());
    return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
            CommonResponse.fail(res)
    );
  }

  /**
   * {@link RuntimeException} 발생 시 처리하는 메서드입니다.
   *
   * @param e 발생한 {@link RuntimeException}
   * @return HTTP 500 상태 코드와 런타임 예외 메시지를 반환합니다.
   */
  @ExceptionHandler(RuntimeException.class)
  @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
  public ResponseEntity<?> handleRuntimeException(RuntimeException e) {
    // 에러 로그 남기기
    log.error("RuntimeException 발생: {}", e.getMessage(), e);

    Map<String, Object> res = new HashMap<>();
    res.put("errorCode", "RUNTIME_EXCEPTION");
    res.put("message", e.getMessage());
    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
            CommonResponse.fail(res)
    );
  }

  /**
   * 모든 {@link Exception} 유형의 예외를 처리하는 메서드입니다.
   *
   * @param e 발생한 일반 예외
   * @return HTTP 500 상태 코드와 서버 내부 오류 메시지를 반환합니다.
   */
  @ExceptionHandler(Exception.class)
  @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
  public ResponseEntity<?> handleException(Exception e) {
    // 에러 로그 남기기
    log.error("Exception 발생: {}", e.getMessage(), e);

    Map<String, Object> res = new HashMap<>();
    res.put("errorCode", "INTERNAL_SERVER_ERROR");
    res.put("message", e.getMessage());
    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
            CommonResponse.fail(res)
    );
  }
}
