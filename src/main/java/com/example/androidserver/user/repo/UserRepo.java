package com.example.androidserver.user.repo;

import com.example.androidserver.user.mapper.UserRowMapper;
import com.example.androidserver.user.model.User;
import com.example.androidserver.utils.AbstractRepo;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Log4j2
@Repository
@RequiredArgsConstructor
public class UserRepo extends AbstractRepo {
    // JdbcTemplate 주입
    private final JdbcTemplate jdbcTemplate;
    private final PasswordEncoder encoder;

    private SimpleJdbcCall registerUserCall;
    private SimpleJdbcCall selectAllUsersCall;
    private SimpleJdbcCall findUidByEmailCall;

    @PostConstruct
    @Override
    protected void initJdbcCalls() {
        registerUserCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("create_user");
        selectAllUsersCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("select_all_users");
        findUidByEmailCall = new SimpleJdbcCall(jdbcTemplate).withProcedureName("select_uid_by_email");
    }

    // 회원가입
    public int registerUserRepo(User user) {
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

        // 현재 시간으로 CreateAt 설정
        Date sqlCreateAt = new Date(System.currentTimeMillis());

        Map<String, Object> params = createParamsMap(
                "p_name", user.getName(),
                "p_email", user.getEmail(),
                "p_password", encoder.encode(user.getPassword()),
                "p_interest", user.getInterest(),
                "p_role", "customer",
                "p_birth", sqlBirthDate,
                "p_company", user.getCompany(),
                "p_createAt", sqlCreateAt
        );

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
            return (List<User>) result.get("#result-set-1");
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // 예외 발생 시 빈 리스트 반환
        }
    }

    // 이메일로 사용자 UID 조회
    // tlqkf 왜 null 이 뜨냐 프로시저는 잘돌아가는데
    public Long findUidByEmailRepo(String email) {
        Map<String, Object> params = createParamsMap("p_email", email);

        try {
            Map<String, Object> result = findUidByEmailCall.execute(params);
            // 결과가 #result-set-1에 있을 경우 처리
            List<Map<String, Object>> resultSet = (List<Map<String, Object>>) result.get("#result-set-1");

            if (resultSet != null && !resultSet.isEmpty()) {
                Long uid = ((Number) resultSet.get(0).get("uid")).longValue(); // 형 변환
                return uid;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null; // 예외 발생 시 null 반환
        }
    }
}
