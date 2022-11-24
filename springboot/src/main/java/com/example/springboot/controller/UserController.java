package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.controller.request.UserPageRequest;
import com.example.springboot.entity.User;
import com.example.springboot.service.IUserService;
import com.example.springboot.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin(origins = "http://localhost:8080")
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService userService;
    @PostMapping("/add")
    public Result save(@RequestBody User user){
        userService.save(user);
        return Result.success();
    }
    @GetMapping("/list")
    public Result list(){
        List<User> users = userService.list();
        return Result.success(users);
    }
    @GetMapping("/page")
    public Result page(UserPageRequest userPageRequest){
        userService.page(userPageRequest);
        return Result.success(userService.page(userPageRequest));
    }
}
