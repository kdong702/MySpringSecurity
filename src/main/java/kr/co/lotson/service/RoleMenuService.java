package kr.co.lotson.service;

import java.util.HashMap;
import java.util.List;
import kr.co.lotson.model.TbMenu;
import kr.co.lotson.model.TbRole;
import kr.co.lotson.model.TbRoleMenu;

public interface RoleMenuService {

	public List<TbRoleMenu> selectRoleMenuListByRoleId(int roleId);
	public List<HashMap<String, Object>> selectRolePermitUrl();
}
