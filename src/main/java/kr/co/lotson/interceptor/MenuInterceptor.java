package kr.co.lotson.interceptor;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import kr.co.lotson.model.TbAdmin;
import kr.co.lotson.model.TbRoleMenu;
import kr.co.lotson.service.RoleMenuService;


@Component
public class MenuInterceptor implements HandlerInterceptor {
    
    @Autowired
    private RoleMenuService roleMenuService;
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        TbAdmin tbAdmin = null;
       
        if (principal instanceof UserDetails) {
            tbAdmin = ((TbAdmin)principal);
        }
        
        if(tbAdmin != null) {
            List<TbRoleMenu> list = roleMenuService.selectRoleMenuListByRoleId(tbAdmin.getRoleId());
            request.setAttribute("list", list);
        }
        
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
   

}
