package kr.co.lotson.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.lotson.dao.UserDao;
import kr.co.lotson.dao.RoleDao;
import kr.co.lotson.model.TbMenu;
import kr.co.lotson.model.TbRole;
import kr.co.lotson.model.TbRoleMenu;
import kr.co.lotson.service.UserService;
import kr.co.lotson.service.RoleMenuService;

@Service
public class RoleMenuServiceImpl implements RoleMenuService{
    
    @Autowired
    private RoleDao roleDao;

    @Override
    public List<TbRoleMenu> selectRoleMenuListByRoleId(int roleId) {
        
        return roleDao.selectRoleMenuListByRoleId(roleId);
    }

    @Override
    public List<HashMap<String, Object>> selectRolePermitUrl() {
        return roleDao.selectRolePermitUrl();
    }

}
