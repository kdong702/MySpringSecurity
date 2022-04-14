package kr.co.lotson.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.lotson.dao.UserDao;
import kr.co.lotson.service.UserService;

@Service
public class UserServiceImpl implements UserService{
    
    @Autowired
    private UserDao userDao;
    
    @Override
    public String selectAdminInfo() {
        return userDao.selectAdminInfo();
    }

}
