package com.example.androidserver.infrastructure.config.security;

import com.example.androidserver.infrastructure.config.filter.CLogoutFilter;
import com.example.androidserver.infrastructure.config.filter.JWTFilter;
import com.example.androidserver.infrastructure.config.filter.LoginFilter;
import com.example.androidserver.infrastructure.utils.JWTUtils;
import com.example.androidserver.user.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {
  private final AuthenticationConfiguration authenticationConfiguration;
  private final JWTUtils jwtUtil;
  private final UserService userService;

  @Bean
  public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
    return authenticationConfiguration.getAuthenticationManager();
  }

  // 전역적으로 사용할 CORS 설정 Bean
  @Bean
  public CorsConfigurationSource corsConfigurationSource() {
    CorsConfiguration configuration = new CorsConfiguration();
    configuration.setAllowedOrigins(List.of("http://localhost:5173")); // React 개발 서버 도메인
    configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS")); // 허용할 HTTP 메서드
    configuration.setAllowedHeaders(List.of("*")); // 모든 헤더 허용
    configuration.setExposedHeaders(List.of("x-access-token")); // 노출할 헤더 설정
    configuration.setAllowCredentials(true); // 인증 정보 허용 (쿠키 등)
    configuration.setMaxAge(3600L); // Preflight 요청 캐싱 시간 (초)

    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
    source.registerCorsConfiguration("/**", configuration); // 모든 경로에 CORS 설정 적용
    return source;
  }

  @Bean
  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    // CSRF 비활성화
    http.csrf(AbstractHttpConfigurer::disable);

    // 기본 로그인 폼과 HTTP Basic 인증 비활성화
    http.formLogin(AbstractHttpConfigurer::disable);
    http.httpBasic(AbstractHttpConfigurer::disable);

    // 권한 및 인증 설정
    http.authorizeHttpRequests(req ->
            req
                    // 인증 없이 접근 가능한 경로 설정 (권한이 필요 없는 api 주소)
                    .requestMatchers("/**").permitAll()

                    // 권한이 ROLE_USER 인 api 주소
                    .requestMatchers("/**")
                    .hasRole("USER")
                    .anyRequest()
                    .authenticated());

    // CORS 설정
    /*http.cors(cors ->
            cors.configurationSource(
                    new CorsConfigurationSource() {
                      @Override
                      public CorsConfiguration getCorsConfiguration(
                              HttpServletRequest request
                      ) {
                        CorsConfiguration config = new CorsConfiguration();
                        config.setAllowedOrigins(List.of("*")); // 모든 도메인 허용
                        config.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS")); // 허용할 HTTP 메서드
                        config.setAllowCredentials(true);
                        config.setAllowedHeaders(List.of("*")); // 모든 헤더 허용
                        config.setMaxAge(3600L); // CORS preflight 요청 캐싱 시간 (초)
                        config.setExposedHeaders(List.of("x-access-token")); // 노출할 헤더 설정
                        return config;
                      }
                    }
            )
    );

    http.sessionManagement(session ->
            session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
    );*/

    // 커스텀 필터 추가
    // 필터 추가
    LoginFilter loginFilter = new LoginFilter(authenticationManager(authenticationConfiguration), jwtUtil);

    // 로그인 주소 설정
    loginFilter.setFilterProcessesUrl("/api/login");
    http.addFilterAt(loginFilter, UsernamePasswordAuthenticationFilter.class);

    // 로그아웃 필터
    CLogoutFilter cLogoutFilter = new CLogoutFilter();
    http.addFilterBefore(cLogoutFilter, LoginFilter.class);

    // jwt 필터
    // jwt 토큰의 유효성을 검사함
    JWTFilter jwtFilter = new JWTFilter(jwtUtil, userService);
    http.addFilterBefore(jwtFilter, LoginFilter.class);

    return http.build();
  }
}
