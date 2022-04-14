package kr.co.lotson.security;

import java.util.Arrays;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import kr.co.lotson.dao.UserDao;
import kr.co.lotson.dao.RoleDao;
import kr.co.lotson.model.TbAdmin;


@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    
    private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);
    
    @Autowired
    private UserDao demoDao;
    
    @Autowired
    private RoleDao roleDao;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        TbAdmin tbAdmin = demoDao.findByUserName(username);
        if (tbAdmin == null){
            throw new UsernameNotFoundException("User not found.");
        }
        log.info(tbAdmin.getName()+ "이름") ;
        List<String> authorities = Arrays.asList(roleDao.selectRoleInfoByUserId(username).getRoleNameE().split(","));
        
        
        tbAdmin.setAuthorities(authorities);
        return tbAdmin;
    }

}
