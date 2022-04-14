package kr.co.lotson.security;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.vote.UnanimousBased;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import kr.co.lotson.serviceImpl.RoleMenuServiceImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
    
    @Autowired
    private UserDetailsServiceImpl detailsServiceImpl;
    
    @Autowired
    private RoleMenuServiceImpl roleMenuServiceImpl;
    
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
        
        //setAntMatchers(http); //DB에서 조회 후 url별 권한 부여
        
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
                    .authenticated() //  url 인증받은 사용자만 사용가능
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
            .accessDeniedHandler(customAccessDeniedHandler) // 권한 없는 페이지 접속시 처리
        .and()
            .csrf().disable()
            
            .sessionManagement()
                .invalidSessionUrl("/login") // expiredUrl 과 동시사용의 경우 invalidSessionUrl 우선 적용
                .maximumSessions(1) //동일한 사용자 동시 세션 허용 금지
                .maxSessionsPreventsLogin(false) //  false : 기존 유저 세션 만료, true : 신규 사용자의 인증 실패
                .expiredUrl("/test"); // 세션 시간 초과후
        
    }
    
    private void setAntMatchers(HttpSecurity http) { // 첫번째 방법 --> voter 사용으로 바꿔봄
        List<HashMap<String, Object>> list = roleMenuServiceImpl.selectRolePermitUrl();
        HashMap<String, String> menuRoleList = new HashMap<>(); // antMatchers 마지막껄로 뒤덮이는거 방지
        
        
        for(HashMap<String, Object> m : list) {
            String menuUrl =  m.get("MENU_URL").toString();
            String role = m.get("ROLE_NAME_E").toString().replace("ROLE_", "");
            //System.out.println("menuUrl:  " + menuUrl + "  /role : " + role);
            if(!menuRoleList.containsKey(menuUrl)) {
                menuRoleList.put(menuUrl, role);
            }else {
                menuRoleList.put(menuUrl, menuRoleList.get(menuUrl)+"," + role);
            }
           
        }
        menuRoleList.forEach((key,value) -> {
            // System.out.println("key :" + key + " value : " + value);
            String[] roles = value.split(",");
            try {
                http.authorizeRequests().antMatchers(key).hasAnyRole(roles);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        });
        
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
