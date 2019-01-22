package service.impl;

import domain.User;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.UserService;

import java.util.List;

/**
 * 缓存机制说明：所有的查询结果都放进了缓存，也就是把MySQL查询的结果放到了redis中去，
 * 然后第二次发起该条查询时就可以从redis中去读取查询的结果，从而不与MySQL交互，从而达到优化的效果，
 * redis的查询速度之于MySQL的查询速度相当于 内存读写速度 /硬盘读写速度
 *
 * @Cacheable("a")注解的意义就是把该方法的查询结果放到redis中去，下一次再发起查询就去redis中去取，存在redis中的数据的key就是a；
 * @CacheEvict(value={"a","b"},allEntries=true) 的意思就是执行该方法后要清除redis中key名称为a, b的数据；
 */
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    // 获得所有的用户
    @Cacheable("getAllUser")
    @Override
    public List <User> getAllUser() {
        return userMapper.getAllUser();
    }

    // 根据关键信息查用户 id username,age...
    @Cacheable("findUserByKeyword")
    @Override
    public List <User> findUserByKeyword(String keyword) {
        return userMapper.findUserByKeyword(keyword);
    }

    // 根据uid删除用户
    @CacheEvict(value = {"getAllUser","findUserByKeyword","findUserByUid"},allEntries = true)
    @Override
    public void delUserById(String uid) {
        userMapper.delUserById(uid);
    }

    // 插入新用户
    @CacheEvict(value = {"getAllUser","findUserByKeyword","findUserByUid"},allEntries = true)
    @Override
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    // 根据id更新用户
    @CacheEvict(value = {"getAllUser","findUserByKeyword","findUserByUid"},allEntries = true)
    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    //根据uid获得用户
    @Cacheable("findUserByUid")
    @Override
    public User findUserByUid(String uid) {
        return userMapper.findUserByUid(uid);
    }
}
