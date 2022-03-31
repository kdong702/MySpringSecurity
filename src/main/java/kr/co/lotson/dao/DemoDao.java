package kr.co.lotson.dao;

import org.springframework.stereotype.Repository;
import kr.co.lotson.model.TbAdmin;

@Repository
public interface DemoDao {
    String selectAdminInfo();

    TbAdmin findByUserName(String adminId);

    int checkFailCount(String adminId);

    void upFailCount(String adminId);

    void lockStatus(String adminId);

    void resetFailCount(String adminId);
}
