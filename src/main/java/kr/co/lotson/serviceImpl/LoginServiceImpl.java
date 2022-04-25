package kr.co.lotson.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.lotson.dao.UserDao;
import kr.co.lotson.service.LoginService;


@Service
public class LoginServiceImpl implements LoginService {
    
    private static final Logger log = LoggerFactory.getLogger(LoginServiceImpl.class);
    
    @Autowired
    private UserDao demoDao;
    
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
