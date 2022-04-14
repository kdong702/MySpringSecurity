package kr.co.lotson.controller;

import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.lotson.model.TbAdmin;
import kr.co.lotson.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
    
    @Autowired
    private UserService userService;
    
    @RequestMapping("/")
    public String welcome() {
        
        return "main";
    }
    
    @RequestMapping("/test")
    public String test(ModelMap model) {
        String test = userService.selectAdminInfo();
        model.addAttribute("test", test);
        return "test";
    }
    
    @RequestMapping("/login")
    public String login() {
        return "loginForm";
    }
    
    
    @GetMapping("/session-info")
    public String sessionInfo(HttpServletRequest request , ModelMap model){
        HttpSession session = request.getSession(false);
        if (session == null){
            model.addAttribute("sessionId", "없음");
            model.addAttribute("maxInactiveInterval", "없음");
            model.addAttribute("creationTime", "없음");
            model.addAttribute("lastAccessTime", "없음");
            model.addAttribute("isNew","없음");
            return "sessionInfo";
        }

        log.info("sessionId={}", session.getId());
        log.info("maxInactiveInterval={}", session.getMaxInactiveInterval());
        log.info("creationTime={}", new Date(session.getCreationTime()));
        log.info("lastAccessTime={}",new Date(session.getLastAccessedTime()));
        log.info("isNew={}", session.isNew());
        model.addAttribute("sessionId", session.getId());
        model.addAttribute("maxInactiveInterval", session.getMaxInactiveInterval());
        model.addAttribute("creationTime", new Date(session.getCreationTime()));
        model.addAttribute("lastAccessTime", new Date(session.getLastAccessedTime()));
        model.addAttribute("isNew",session.isNew());
        
        return "sessionInfo";
    }
    
    
    
   
}
