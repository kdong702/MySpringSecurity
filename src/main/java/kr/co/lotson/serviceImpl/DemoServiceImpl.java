package kr.co.lotson.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.lotson.dao.DemoDao;
import kr.co.lotson.service.DemoService;

@Service
public class DemoServiceImpl implements DemoService{
    
    @Autowired
    private DemoDao demoDao;
    
    @Override
    public String selectAdminInfo() {
        return demoDao.selectAdminInfo();
    }

}
