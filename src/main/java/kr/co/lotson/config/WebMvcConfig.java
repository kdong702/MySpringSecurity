package kr.co.lotson.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import kr.co.lotson.interceptor.MenuInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    
    @Autowired 
    private MenuInterceptor interceptor;
    
    @Override 
    public void addInterceptors(InterceptorRegistry registry) { 
        registry.addInterceptor(interceptor) 
        .addPathPatterns("/**") 
        .excludePathPatterns("/login" ,"/js/**" , "/css/**" , "/images/**","/error");
    }

    
}
