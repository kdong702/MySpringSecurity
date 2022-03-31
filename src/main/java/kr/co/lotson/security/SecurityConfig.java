package kr.co.lotson.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import kr.co.lotson.serviceImpl.LoginServiceImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
    
    @Autowired
    private LoginServiceImpl loginServiceImpl;
    
    @Autowired
    private LoginFailureHandler loginFailureHandler;
    
    @Autowired
    private LoginSuccessHandler loginSuccessHandler;
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.httpBasic().and().authorizeRequests().antMatchers("/login").permitAll()
        .antMatchers("/").authenticated()
        .and().logout().permitAll()
        .and().formLogin().loginPage("/login").loginProcessingUrl("/loginProcess")
        .successHandler(loginSuccessHandler)
        .failureHandler(loginFailureHandler)
        .and().logout().logoutSuccessUrl("/login").invalidateHttpSession(true)
        .and().csrf().disable()
        .sessionManagement()
        .invalidSessionUrl("/login")
        .maximumSessions(1) //동일한 사용자 동시 세션 허용 금지
        .maxSessionsPreventsLogin(false)
        .expiredUrl("/test"); // 세션 시간 초과후 
    }
    
    @Bean
    public PasswordEncoder getPasswordEncoder() {
       return new BCryptPasswordEncoder();
    }
    
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(loginServiceImpl).passwordEncoder(getPasswordEncoder());
    }

}
