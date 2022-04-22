package kr.co.lotson.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import kr.co.lotson.model.TbAdmin;

@Repository
public interface UserDao {
    String selectAdminInfo();

    TbAdmin findByUserName(String adminId);

    int checkFailCount(String adminId);

    void upFailCount(String adminId);

    void lockStatus(String adminId);

    void resetFailCount(String adminId);

    List<TbAdmin> selectList();
}
