package com.example.springboot.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import com.example.springboot.controller.request.UserPageRequest;
import com.example.springboot.entity.User;
import com.example.springboot.mapper.UserMapper;
import com.example.springboot.service.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserService implements IUserService {

    @Autowired
    UserMapper userMapper;



    @Override
    public List<User> list() {
        return userMapper.list();
    }

    @Override
    public Object page(UserPageRequest userPageRequest) {
//        String name = userPageRequest.getName();
//        String phone  = userPageRequest.getPhone();
        PageHelper.startPage(userPageRequest.pageNum,userPageRequest.pageSize);
        List<User> users = userMapper.listByCondition(userPageRequest);
        return new PageInfo<>(users);
    }

    @Override
    public void save(User user) {
        Date date = new Date();
        user.setUsername(DateUtil.format(date,"ddmmyyyy")+IdUtil.fastSimpleUUID());
        userMapper.save(user);
    }

    @Override
    public User getById( int id) {
         return userMapper.getById(id);
    }
}