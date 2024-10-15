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

  @Bean
  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    http.csrf(AbstractHttpConfigurer::disable);
    http.formLogin(AbstractHttpConfigurer::disable);
    http.httpBasic(AbstractHttpConfigurer::disable);
    http.authorizeHttpRequests(req ->
            req
                    // 권한이 필요 없는 api 주소
                    .requestMatchers("/api/join")
                    .permitAll()
                    // 권한이 ROLE_USER 인 api 주소
                    .requestMatchers("/api/user/info")
                    .hasRole("USER")
                    .anyRequest()
                    .authenticated());
    http.cors(cors ->
            cors.configurationSource(
                    new CorsConfigurationSource() {
                      @Override
                      public CorsConfiguration getCorsConfiguration(
                              HttpServletRequest request
                      ) {
                        CorsConfiguration config = new CorsConfiguration();
                        config.setAllowedOrigins(List.of("*"));
                        config.setAllowedMethods(
                                List.of("GET", "POST", "PUT", "DELETE", "OPTIONS")
                        ); // 허용할 HTTP 메서드
                        config.setAllowCredentials(true);
                        config.setAllowedHeaders(List.of("*"));
                        config.setMaxAge(1000L * 60 * 60 * 24 * 1000);
                        config.setExposedHeaders(List.of("x-access-token"));
                        return config;
                      }
                    }
            )
    );
    http.sessionManagement(session ->
            session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
    );

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
