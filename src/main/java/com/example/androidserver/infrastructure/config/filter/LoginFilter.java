package com.example.androidserver.infrastructure.config.filter;

import com.example.androidserver.infrastructure.utils.JWTUtils;
import com.example.androidserver.web.dto.common.CommonResponse;
import com.example.androidserver.web.dto.user.Login;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletInputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.util.StreamUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@RequiredArgsConstructor
public class LoginFilter extends UsernamePasswordAuthenticationFilter {
  private final AuthenticationManager authenticationManager;
  private final JWTUtils jwtUtils;

  @Override
  public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
    Login login;
    try {
      ObjectMapper objectMapper = new ObjectMapper();
      ServletInputStream inputStream = request.getInputStream();
      String messageBody = StreamUtils.copyToString(
              inputStream,
              StandardCharsets.UTF_8
      );
      login = objectMapper.readValue(messageBody, Login.class);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }

    String email = login.email();
    String password = login.password();

    UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(email, password, null);

    return authenticationManager.authenticate(token);
  }

  @Override
  protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authResult) throws IOException {
    String email = authResult.getName();

    Collection<? extends GrantedAuthority> authorities = authResult.getAuthorities();
    Iterator<? extends GrantedAuthority> iterator = authorities.iterator();
    GrantedAuthority auth = iterator.next();
    String role = auth.getAuthority();

    String token = jwtUtils.createJwt(email, role, "user", 1000L * 60 * 60 * 24);

    CommonResponse commonResponse = CommonResponse.success(token);
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    ObjectMapper objectMapper = new ObjectMapper();
    response.getWriter().write(objectMapper.writeValueAsString(commonResponse));
  }

  @Override
  protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) throws ServletException {
    response.setStatus(HttpStatus.UNAUTHORIZED.value());
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    // 실패 응답 데이터 설정
    Map<String, String> errorData = new HashMap<>();
    errorData.put("message", "인증 실패. 아이디 또는 비밀번호를 확인하세요.");

    CommonResponse<Map<String, String>> commonResponse = CommonResponse.fail(
            errorData
    );

    ObjectMapper objectMapper = new ObjectMapper();
    try (PrintWriter writer = response.getWriter()) {
      writer.write(objectMapper.writeValueAsString(commonResponse));
    } catch (IOException e) {
      throw new ServletException(
              "로그인 실패 응답 처리 중 오류가 발생했습니다.",
              e
      );
    }
  }
}
