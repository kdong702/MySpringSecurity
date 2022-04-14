package kr.co.lotson.dao;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Repository;
import kr.co.lotson.model.TbAdmin;
import kr.co.lotson.model.TbRole;
import kr.co.lotson.model.TbRoleMenu;

@Repository
public interface RoleDao {
    TbRole selectRoleInfoByUserId(String adminId);

    List<TbRoleMenu> selectRoleMenuListByRoleId(int roleId);

    List<HashMap<String, Object>> selectRolePermitUrl();
}
