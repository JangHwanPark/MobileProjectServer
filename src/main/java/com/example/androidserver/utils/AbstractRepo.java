package com.example.androidserver.utils;

import org.springframework.jdbc.core.JdbcTemplate;
import java.util.HashMap;
import java.util.Map;

public abstract class AbstractRepo {
    protected JdbcTemplate jdbcTemplate;

    // 가변 인자 keyValuePairs는 여러 개의 키-값 쌍을 인자로 받을 수 있음
    // for 루프는 i를 0부터 시작해 2씩 증가시키며 각 반복에서 두 개의 요소(key와 value)를 처리
    // key는 keyValuePairs[i]로 가져오고, value는 keyValuePairs[i + 1]로 가져와 Map에 추가
    // 반복이 끝나면 모든 키-값 쌍이 Map에 저장
    protected Map<String, Object> createParamsMap(Object... keyValuePairs) {
        Map<String, Object> params = new HashMap<>();
        for (int i = 0; i < keyValuePairs.length; i += 2) {
            String key = (String) keyValuePairs[i];
            Object value = keyValuePairs[i + 1];
            params.put(key, value);
        }
        return params;
    }

    protected abstract void initJdbcCalls();
}
