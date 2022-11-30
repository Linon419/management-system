package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.controller.dto.LoginDTO;
import com.example.springboot.controller.request.AdminPageRequest;
import com.example.springboot.controller.request.LoginRequest;
import com.example.springboot.controller.request.PasswordRequest;
import com.example.springboot.controller.request.UserPageRequest;
import com.example.springboot.entity.Admin;
import com.example.springboot.service.IAdminService;
import com.example.springboot.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    IAdminService adminService;
    @PostMapping("/login")
    public Result login(@RequestBody LoginRequest request){
        LoginDTO login = adminService.login(request);
        return Result.success(login);
    }
    @PostMapping("/add")
    public Result save(@RequestBody Admin admin){
        adminService.save(admin);
        return Result.success();
    }
    @PutMapping("/update")
    public Result update(@RequestBody Admin admin){
        adminService.update(admin);
        return Result.success();
    }
    @PutMapping("/password")
    public Result password(@RequestBody PasswordRequest request){
        adminService.changePass(request);
        return Result.success();
    }
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable int id){
        adminService.deleteById(id);
        return Result.success();
    }
    @GetMapping("/{id}")
    public Result getById(@PathVariable int id){
        Admin admin = adminService.getById(id);
        return Result.success(admin);
    }
    @GetMapping("/list")
    public Result list(){
        List<Admin> users = adminService.list();
        return Result.success(users);
    }
    @GetMapping("/page")
    public Result page(AdminPageRequest adminPageRequest){
        adminService.page(adminPageRequest);
        return Result.success(adminService.page(adminPageRequest));
    }
}
