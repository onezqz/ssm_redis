package mapper;

import domain.User;

import java.util.List;

public interface UserMapper {
    // 获得所有用户
    List<User> getAllUser();
    // 根据关键信息查用户 id username,age...
    List<User> findUserByKeyword(String keyword);
    // 根据uid删除用户
    void delUserById(String uid);
    // 插入新用户
    void insertUser(User user);
    // 根据id更新用户
    void updateUser(User user);
    // 根据uid获得用户
    User findUserByUid(String uid);
}
