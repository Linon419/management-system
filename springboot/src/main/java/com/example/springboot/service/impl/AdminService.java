package com.example.springboot.service.impl;

import com.example.springboot.controller.dto.LoginDTO;
import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.controller.request.LoginRequest;
import com.example.springboot.entity.Admin;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.AdminMapper;
import com.example.springboot.service.IAdminService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Slf4j
@Service
public class AdminService implements IAdminService {

    @Autowired
    AdminMapper adminMapper;



    @Override
    public List<Admin> list() {
        return adminMapper.list();
    }

    @Override
    public PageInfo<Admin> page(BaseRequest baseRequest) {
//        String name = userPageRequest.getName();
//        String phone  = userPageRequest.getPhone();
        PageHelper.startPage(baseRequest.pageNum,baseRequest.pageSize);
        List<Admin> admin = adminMapper.listByCondition(baseRequest);
        return new PageInfo<>(admin);
    }

    @Override
    public void save(Admin admin) {
        adminMapper.save(admin);
    }

    @Override
    public Admin getById(int id) {
         return adminMapper.getById(id);
    }

    @Override
    public void update(Admin admin) {
        admin.setUpdatetime(new Date());
        adminMapper.updateById(admin);
    }

    @Override
    public void deleteById(int id) {
        adminMapper.deleteById(id);
    }

    @Override
    public LoginDTO login(LoginRequest request) {
        try {
            Admin admin = adminMapper.getByUsernameAndPassword(request);
            if (admin == null){
                throw new ServiceException("Wrong username or password");
            }
            LoginDTO loginDTO = new LoginDTO();
            BeanUtils.copyProperties(admin,loginDTO);
            return loginDTO;

        }catch (Exception e){
            log.error("Login error");
            return null;
        }
    }
}
