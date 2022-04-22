package kr.co.lotson.security;

import java.io.IOException;
import java.util.List;
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
import kr.co.lotson.model.TbRoleMenu;
import kr.co.lotson.service.LoginService;
import kr.co.lotson.service.RoleMenuService;

@Component
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
    private static final Logger log = LoggerFactory.getLogger(LoginSuccessHandler.class);
    
    @Autowired
    private LoginService loginservice;
    
    @Autowired
    private RoleMenuService roleMenuService;
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        TbAdmin user = (TbAdmin) authentication.getPrincipal();
        if (user != null) {
            log.info("로그인 성공시 passowrd_fail_count 초기화");
            loginservice.resetFailCount(user.getAdminId());
            List<TbRoleMenu> roleMenuList = roleMenuService.selectRoleMenuListByRoleId(user.getRoleId());
//            request.getSession().setAttribute("aaa", roleMenuList);
            request.setAttribute("aaa", roleMenuList);
            request.getSession().setMaxInactiveInterval(5 * 60); // 세션 유효기간
//            user.setRoleMenuList(roleMenuList);
            
            
        }
        super.setDefaultTargetUrl("/");
        super.onAuthenticationSuccess(request, response, authentication);
    }

}
