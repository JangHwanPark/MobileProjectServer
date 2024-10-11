package com.example.androidserver.infrastructure.config.filter.detail;

import com.example.androidserver.user.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;

@RequiredArgsConstructor
public class CUserDetails implements UserDetails {
  private final User user;

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    Collection<GrantedAuthority> auth = new ArrayList<>();
    auth.add(
            new GrantedAuthority() {
              @Override
              public String getAuthority() {
                return user.getRole();
              }
            }
    );
    return auth;
  }

  @Override
  public String getPassword() {
    return user.getPassword();
  }

  @Override
  public String getUsername() {
    return user.getEmail();
  }
}
