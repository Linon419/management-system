package com.example.springboot.mapper;

import com.example.springboot.controller.request.UserPageRequest;
import com.example.springboot.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {

    void save(User user);

    List<User> listByCondition(UserPageRequest userPageRequest);

    //@Select("select * from user")
    List<User> list();

    User getById(int id);

    void updateById(User user);

    void deleteById(int id);
}