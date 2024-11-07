package com.example.androidserver.user.repo;

import com.example.androidserver.user.mapper.UserRowMapper;
import com.example.androidserver.user.model.User;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class UserRepo {
    // JdbcTemplate 주입
    private final JdbcTemplate jdbcTemplate;
    private final PasswordEncoder encoder;

    private SimpleJdbcCall registerUserCall;
    private SimpleJdbcCall selectAllUsersCall;
    private SimpleJdbcCall findUidByEmailCall;

    @PostConstruct
    private void init() {
        registerUserCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("create_user");
        selectAllUsersCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("select_all_data").returningResultSet("result", new UserRowMapper());
        findUidByEmailCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("select_uid_by_email");
    }

    // 회원가입
    public int registerUserRepo(User user) {
        String encodedPassword = encoder.encode(user.getPassword());

        // 생년월일 String을 Date로 변환
        Date sqlBirthDate;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd"); // 생년월일이 "20240101" 형식으로 제공되는 경우
            java.util.Date parsedDate = dateFormat.parse(user.getBirth());
            sqlBirthDate = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            // 잘못된 날짜 형식에 대한 로직 추가: 실패 시 적절한 예외 반환 또는 0 반환
            return 0;
        }

        Map<String, Object> params = new HashMap<>();
        params.put("p_name", user.getName());
        params.put("p_email", user.getEmail());
        params.put("p_password", encodedPassword);
        params.put("p_interest", user.getInterest());
        params.put("p_role", "customer");
        params.put("p_birth", sqlBirthDate);
        params.put("p_company", user.getCompany());

        try {
            registerUserCall.execute(params);
            return 1; // 성공 시 1 반환
        } catch (Exception e) {
            e.printStackTrace();
            return 0; // 실패 시 0 반환
        }
    }

    // 사용자 데이터 조회
    // select_all_data 적용
    public List<User> selectAllUsersRepo() {
        try {
            Map<String, Object> result = selectAllUsersCall.execute();
            return (List<User>) result.get("result");
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // 예외 발생 시 빈 리스트 반환
        }
    }

    // 이메일로 사용자 UID 조회
    public Integer findUidByEmailRepo(String email) {
        Map<String, Object> params = new HashMap<>();
        params.put("p_email", email);

        try {
            Map<String, Object> result = findUidByEmailCall.execute(params);
            return (Integer) result.get("uid");
        } catch (Exception e) {
            e.printStackTrace();
            return null; // 예외 발생 시 null 반환
        }
    }
}
