package kr.co.lotson.service;

import java.util.List;
import org.springframework.security.access.prepost.PostFilter;
import kr.co.lotson.model.TbAdmin;

public interface UserService {

    String selectAdminInfo();

//    @PostAuthorize("hasPermission(returnObject, '9')") // postAuthorize는 단일객체일떄 사용
    @PostFilter("hasPermission(filterObject,'9')")
    List<TbAdmin> selectList();

}
