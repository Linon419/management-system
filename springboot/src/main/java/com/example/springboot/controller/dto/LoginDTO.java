package com.example.springboot.controller.dto;

import lombok.Data;

@Data
public class LoginDTO {
    private int id;
    private String username;
    private String phone;
    private String email;
}
