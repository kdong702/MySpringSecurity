package kr.co.lotson.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;

@Component
public class SessionTimeOutCookieFilter implements Filter{

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        long serverTime = System.currentTimeMillis();
        long sessionExpiryTime = serverTime + request.getSession().getMaxInactiveInterval() * 1000;
        Cookie cookie = new Cookie("latestTouch", "" + serverTime);
        cookie.setPath("/");
        response.addCookie(cookie);
        cookie = new Cookie("sessionExpiry", "" + sessionExpiryTime);
        cookie.setPath("/");
        response.addCookie(cookie);
        filterChain.doFilter(servletRequest, servletResponse);

        
    }
    
}
