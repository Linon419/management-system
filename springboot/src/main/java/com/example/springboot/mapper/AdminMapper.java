package com.example.springboot.mapper;

import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.controller.request.LoginRequest;
import com.example.springboot.controller.request.UserPageRequest;
import com.example.springboot.entity.Admin;
import com.example.springboot.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    void save(Admin admin);

    List<Admin> listByCondition(BaseRequest baseRequest);

    List<Admin> list();

    Admin getById(int id);

    void updateById(Admin admin);

    void deleteById(int id);

    Admin getByUsernameAndPassword(LoginRequest request);

    Admin getByUsername(String username);
}
