package kr.co.lotson.config;

import java.util.Arrays;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.expression.method.DefaultMethodSecurityExpressionHandler;
import org.springframework.security.access.expression.method.MethodSecurityExpressionHandler;
import org.springframework.security.access.vote.UnanimousBased;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import kr.co.lotson.security.CustomAccessDecisionVoter;
import kr.co.lotson.security.CustomAccessDeniedHandler;
import kr.co.lotson.security.CustomPermissionEvaluator;
import kr.co.lotson.security.LoginFailureHandler;
import kr.co.lotson.security.LoginSuccessHandler;

/**
 * @author kdong
 *
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
    
    @Autowired
    private LoginFailureHandler loginFailureHandler;
    
    @Autowired
    private LoginSuccessHandler loginSuccessHandler;
    
    @Autowired
    private CustomAccessDeniedHandler customAccessDeniedHandler;
    
    @Autowired
    private CustomAccessDecisionVoter customAccessDecisionVoter;
    
    @Override 
    public void configure(WebSecurity web) throws Exception {
        web
            .ignoring()
            .antMatchers("/error", "/login"); // security is not work. 
    }
    
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        
        http
            .httpBasic().
        and()
            .authorizeRequests()
                .antMatchers("/",
                             "/sidadmin/**" ,
                             "/idadmin/**", 
                             "/normal/**", 
                             "/student/**", 
                             "/employee/**", 
                             "/superadmin/**")
                    .authenticated() //  url ???????????? ???????????? ????????????
                .accessDecisionManager(customAccessDecisionManager())
        .and()
            .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/loginProcess")
                .successHandler(loginSuccessHandler)
                .failureHandler(loginFailureHandler)
        .and()
            .logout()
                .permitAll()
                .logoutSuccessUrl("/login")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
        .and()
            .exceptionHandling()
            .accessDeniedHandler(customAccessDeniedHandler) // ?????? ?????? ????????? ????????? ??????
        .and()
            .csrf().disable()
            
            .sessionManagement()
                .invalidSessionUrl("/login") // expiredUrl ??? ??????????????? ?????? invalidSessionUrl ?????? ??????
                .maximumSessions(1) //????????? ????????? ?????? ?????? ?????? ??????
                .maxSessionsPreventsLogin(false) //  false : ?????? ?????? ?????? ??????, true : ?????? ???????????? ?????? ??????
                .expiredUrl("/test"); // ?????? ?????? ?????????
        
    }
    
   
    
    @Bean
    public AccessDecisionManager customAccessDecisionManager() {
        return new UnanimousBased(Arrays.asList(customAccessDecisionVoter));
    }
    
    @Bean
    public PasswordEncoder getPasswordEncoder() {
       return new BCryptPasswordEncoder();
    }
    
    
    
//    @Override
//    public void configure(AuthenticationManagerBuilder auth) throws Exception {
//    auth.userDetailsService(detailsServiceImpl).passwordEncoder(getPasswordEncoder());
//    }

}
