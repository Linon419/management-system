package com.example.springboot.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class User {
    private int id;
    private String name;
    private String username;
    private int age;
    private Integer account;
    private Integer score;
    private String sex;
    private String phone;
    private String address;
    @JsonFormat(pattern = "dd-mm-yyyy", timezone = "GTM+11")
    private Date createtime;
    @JsonFormat(pattern = "dd-mm-yyyy", timezone = "GTM+11")
    private Date updatetime;
    private boolean status;


}
