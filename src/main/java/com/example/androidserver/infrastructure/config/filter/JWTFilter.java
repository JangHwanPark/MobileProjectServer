package com.example.androidserver.infrastructure.config.filter;

import com.example.androidserver.infrastructure.config.filter.detail.CUserDetails;
import com.example.androidserver.infrastructure.utils.JWTUtils;
import com.example.androidserver.user.model.User;
import com.example.androidserver.user.service.UserService;
import io.jsonwebtoken.ExpiredJwtException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.io.PrintWriter;

@RequiredArgsConstructor
public class JWTFilter extends OncePerRequestFilter {
  private final JWTUtils jwtUtils;
  private final UserService service;

  @Override
  protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
    String token = request.getHeader("a-project-token");

    if(token == null) {
      filterChain.doFilter(request, response);
      return;
    }

    try {
      jwtUtils.isExpired(token);
    } catch (ExpiredJwtException e) {
      PrintWriter out = response.getWriter();
      out.println("토큰이 만료 되었습니다. 다시 로그인 해주세요.");
      response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
      return;
    }

    if(!jwtUtils.getIssuer(token).equals("project")) {
      PrintWriter out = response.getWriter();
      out.println("잘못된 토큰입니다.");
      response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
      return;
    }

    if(!jwtUtils.getSubject(token).equals("user")) {
      PrintWriter out = response.getWriter();
      out.println("잘못된 토큰입니다.");
      response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
      return;
    }

    String email = jwtUtils.getEmail(token);
    User user = service.getUserByEmail(email);

    CUserDetails userDetails = new CUserDetails(user);

    Authentication authToken = new UsernamePasswordAuthenticationToken(
            userDetails,
            null,
            userDetails.getAuthorities()
    );

    SecurityContextHolder.getContext().setAuthentication(authToken);

    filterChain.doFilter(request, response);
  }
}
