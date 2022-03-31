package kr.co.lotson.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebErrorController implements ErrorController{
  
    
    @GetMapping("/error")
    public String handleError(HttpServletRequest request,ModelMap model) {
        String msg = "관리자에게 문의바랍니다.";
        
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        
        if(status != null){
            int statusCode = Integer.valueOf(status.toString());

            if(statusCode == HttpStatus.NOT_FOUND.value()) {
                msg ="요청하신 페이지가 존재하지 않습니다.";
                
            } else if(statusCode == HttpStatus.BAD_REQUEST.value()) {
                msg = "400 관리자에게 문의 바랍니다." ; // 400
            } else if(statusCode == HttpStatus.UNAUTHORIZED.value()) {
                msg = "401 세션이 만료되었거나 로그인이 필요한 서비스입니다." ; // 401
            } else if(statusCode == HttpStatus.FORBIDDEN.value()) {
                msg = "권한이 없습니다." ; // 403
            }else {
                msg = "시스템 에러가 발생하였습니다.\n관리자에게 문의해 주세요." ; //500
            }
            model.addAttribute("code",statusCode);
            model.addAttribute("msg", msg);
        }

        return "commons/error";
    }

}
