package kr.co.lotson.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;
import kr.co.lotson.model.TbAdmin;
import kr.co.lotson.service.LoginService;

@Component
public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{
    final private static String FAILED_URL = "/login?error=";

    private static final String INVALID_ID = "0011"; // 유효하지 않은 ID
    private static final String INVALID_PW = "0001"; // 유효하지 않은 pw
    private static final String FAIL_EXPIRED_ACCOUNT = "0003"; // 만료된 계정
    private static final String FAIL_EXCEED_PASSWORD_MATCH_COUNT = "0004"; // 비밀번호 인증 실패 회수 초과
    private static final String FAIL_ACCOUNT_STATUS = "0005"; // 관리자에 의해 잠긴 계정
    private static final String FAIL_DUPLICATE_LOGIN = "0006"; // 중복로그인 시도
    private static final String FAIL_SYSTEM = "0009"; // 시스템 에러
    private static String FAIL_COUNT = "";

    private static final Logger log = LoggerFactory.getLogger(LoginFailureHandler.class);

    @Autowired
    private LoginService loginservice;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        log.info("id : " + username + "pw : " + password);
        if (exception instanceof AccountExpiredException) { // 계정 유효기간
            super.setDefaultFailureUrl(FAILED_URL + FAIL_EXPIRED_ACCOUNT);
        } else if (exception instanceof BadCredentialsException) { // 비밀번호 입력 오류
            loginFailCount(username);
            int failCount = checkFailcount(username);
            FAIL_COUNT = "&count=" + failCount;
            super.setDefaultFailureUrl(FAILED_URL + INVALID_PW + FAIL_COUNT);
        } else if (exception instanceof UsernameNotFoundException) { // ID입력 오류 // 여기로 갈수가 없다 BadCredentialsException이 더 상위(보안 측면)
            super.setDefaultFailureUrl(FAILED_URL + INVALID_ID);
        } else if (exception instanceof SessionAuthenticationException) { //중복 로그인 방지
            super.setDefaultFailureUrl(FAILED_URL + FAIL_DUPLICATE_LOGIN);
        } else if (exception instanceof LockedException) { // 비밀번호5회이상 입력 오류
            super.setDefaultFailureUrl(FAILED_URL + FAIL_EXCEED_PASSWORD_MATCH_COUNT);
        } else if (exception instanceof DisabledException) { // 관리자에 의해 잠긴 계정
            super.setDefaultFailureUrl(FAILED_URL + FAIL_ACCOUNT_STATUS);
        } else if (exception instanceof AuthenticationServiceException) { // 시스템 에러
            super.setDefaultFailureUrl(FAILED_URL + FAIL_SYSTEM);
        } else { // 시스템 에러
            super.setDefaultFailureUrl(FAILED_URL + FAIL_SYSTEM);
        }
        super.onAuthenticationFailure(request, response, exception);
    }
    
    protected void loginFailCount(String username) {
        int failCount = checkFailcount(username);
        if (failCount < 5) {
            loginservice.upFailCount(username);
        }else if(failCount==5) {
            loginservice.lockStatus(username);
            
        } 
    }

    protected int checkFailcount(String username) {
        return loginservice.checkFailCount(username);
    }
}
