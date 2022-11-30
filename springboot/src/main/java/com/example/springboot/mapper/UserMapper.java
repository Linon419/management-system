package com.example.springboot.mapper;

import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    void save(User user);

    List<User> listByCondition(BaseRequest userPageRequest);

    //@Select("select * from user")
    List<User> list();

    User getById(int id);

    void updateById(User user);

    void deleteById(int id);
    User getByUsername(String username);

}
