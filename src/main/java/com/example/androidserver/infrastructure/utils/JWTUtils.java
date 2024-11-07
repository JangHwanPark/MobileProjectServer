package com.example.androidserver.infrastructure.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;

@Component
public class JWTUtils {
  private final SecretKey secretKey;

  public JWTUtils(@Value("${spring.jwt.secret}") String secret) {
    this.secretKey = Keys.hmacShaKeyFor(secret.getBytes());
  }

  private Claims getClaims(String token) {
    return Jwts.parser()
            .verifyWith(secretKey)
            .build()
            .parseSignedClaims(token)
            .getPayload();
  }

  public String getEmail(String token) {
      return getClaims(token).get("email", String.class);
  }

  public String getRole(String token) {
    return getClaims(token).get("role", String.class);
  }

  public String getSubject(String token) {
    return getClaims(token).getSubject();
  }

  public String getIssuer(String token) {
    return getClaims(token).getIssuer();
  }

  public Boolean isExpired(String token) {
    return getClaims(token).getExpiration().before(new Date());
  }

  // 토큰 생성 메서드
  // 1000L * 60 * 60 * 24 * 7 = 7일 마지막 숫자가 일수
  public String createJwt(
          String email,
          String role,
          String sub,
          Long expire) {
    return Jwts.builder()
            //.claim("uid", uid)
            .claim("email", email)
            .claim("role", role)
            .subject(sub)
            // 발급자? 같은 거임
            .issuer("project")
            .expiration(new Date(System.currentTimeMillis() + expire))
            .signWith(secretKey, SignatureAlgorithm.HS256)
            .compact();
  }


}
