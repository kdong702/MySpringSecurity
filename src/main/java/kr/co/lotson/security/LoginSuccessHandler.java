package kr.co.lotson.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import kr.co.lotson.model.TbAdmin;
import kr.co.lotson.service.LoginService;

@Component
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
    private static final Logger log = LoggerFactory.getLogger(LoginSuccessHandler.class);
    
    @Autowired
    private LoginService loginservice;
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        String userId = ((TbAdmin) authentication.getPrincipal()).getAdminId();
        if (userId != null) {
            log.info("로그인 성공시 passowrd_fail_count 초기화");
            loginservice.resetFailCount(userId);
            /* request.getSession().setMaxInactiveInterval(15 * 60); */ // 세션유효시간
        }
        super.setDefaultTargetUrl("/");
        super.onAuthenticationSuccess(request, response, authentication);
    }

}
