package kr.co.lotson.serviceImpl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import kr.co.lotson.dao.RoleDao;
import kr.co.lotson.model.TbRoleMenu;
import kr.co.lotson.service.RoleMenuService;

@Service
public class RoleMenuServiceImpl implements RoleMenuService{
    
    @Autowired
    private RoleDao roleDao;

    @Override
    @Cacheable(value = "menu", key ="#roleId")
    public List<TbRoleMenu> selectRoleMenuListByRoleId(int roleId) {
        return roleDao.selectRoleMenuListByRoleId(roleId);
    }

    @Override
    public List<HashMap<String, Object>> selectRolePermitUrl() {
        return roleDao.selectRolePermitUrl();
    }

}
