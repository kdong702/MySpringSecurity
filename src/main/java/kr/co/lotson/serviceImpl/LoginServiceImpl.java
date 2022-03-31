package kr.co.lotson.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import kr.co.lotson.dao.DemoDao;
import kr.co.lotson.model.TbAdmin;
import kr.co.lotson.service.LoginService;


@Service
public class LoginServiceImpl implements UserDetailsService,LoginService {
    
    private static final Logger log = LoggerFactory.getLogger(LoginServiceImpl.class);
    @Autowired
    private DemoDao demoDao;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        TbAdmin tbAdmin = demoDao.findByUserName(username);
        if (tbAdmin == null){
            throw new UsernameNotFoundException("User not found.");
        }
        log.info(tbAdmin.getName()+ "이름") ; 
        return tbAdmin;
    }

    @Override
    public int checkFailCount(String username) {
        int failCount = demoDao.checkFailCount(username);
        return failCount;
    }

    @Override
    public void upFailCount(String username) {
       demoDao.upFailCount(username);
        
    }

    @Override
    public void lockStatus(String username) {
        demoDao.lockStatus(username);
        
    }

    @Override
    public void resetFailCount(String username) {
        demoDao.resetFailCount(username);
        
    }

}
