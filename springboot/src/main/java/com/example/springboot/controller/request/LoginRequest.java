package com.example.springboot.controller.request;

import lombok.Data;

@Data
public class LoginRequest extends BaseRequest{
    private String username;
    private String password;

}
