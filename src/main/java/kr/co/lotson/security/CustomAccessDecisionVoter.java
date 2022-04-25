package kr.co.lotson.security;

import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import kr.co.lotson.model.TbAdmin;
import kr.co.lotson.model.TbRoleMenu;
import kr.co.lotson.service.RoleMenuService;


@Component
public class CustomAccessDecisionVoter implements AccessDecisionVoter<Object> {
    
    private final PathMatcher pathMatcher = new AntPathMatcher();
    
    @Autowired
    private RoleMenuService roleMenuService;
    
    @Override
    public boolean supports(ConfigAttribute attribute) { //voter가 특정 구성 속성을 지원하는지 여부 -> 필요하지 않으면 true
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean supports(Class clazz) { //보안 개체 유형에 대해 투표할 수 있는지 여부 -> 필요하지 않으면 true
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public int vote(Authentication authentication, Object object, Collection attributes) {
        HttpServletRequest request = ((FilterInvocation) object).getHttpRequest();
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        TbAdmin tbAdmin = null;
        
        if (principal instanceof UserDetails) {
            tbAdmin = ((TbAdmin)principal);
        } 

        if(tbAdmin != null) {
            List<TbRoleMenu> list = roleMenuService.selectRoleMenuListByRoleId(tbAdmin.getRoleId());
           
            for (TbRoleMenu m : list) {
                if(pathMatcher.match(m.getTbMenu().getMenuUrl(), request.getServletPath())){
                    return ACCESS_GRANTED;
                }
            }
        }

        
        return ACCESS_DENIED;
    }

}
