package com.example.springboot.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class Admin {
    private int id;
    private String username;
    private String password;
    private String phone;
    @JsonFormat(pattern = "dd-mm-yyyy", timezone = "GTM+11")
    private Date createtime;
    @JsonFormat(pattern = "dd-mm-yyyy", timezone = "GTM+11")
    private Date updatetime;

    public boolean status;
}
