package kr.co.lotson.service;

public interface LoginService {
    int checkFailCount(String username);

    void upFailCount(String username);

    void lockStatus(String username);

    void resetFailCount(String userId);
}
