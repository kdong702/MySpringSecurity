package kr.co.lotson.serviceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import kr.co.lotson.dao.UserDao;
import kr.co.lotson.model.TbAdmin;
import kr.co.lotson.service.UserService;

@Service
public class UserServiceImpl implements UserService{
    
    @Autowired
    private UserDao userDao;
    
    @Override
    public String selectAdminInfo() {
        return userDao.selectAdminInfo();
    }


    @Override
    public List<TbAdmin> selectList() {
        
        return userDao.selectList();
    }
    

}
