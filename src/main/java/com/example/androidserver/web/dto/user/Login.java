package com.example.androidserver.web.dto.user;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

// @JsonIgnoreProperties(ignoreUnknown = true)
public record Login(
        String email,
        String password
) {
}
