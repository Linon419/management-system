package com.example.springboot.service;

import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Return;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface IBorrowService {

    List<Borrow> list();

    PageInfo<Borrow> page(BaseRequest baseRequest);

    void save(Borrow obj);

    PageInfo<Return> pageRetur(BaseRequest baseRequest);

    void saveRetur(Return obj);

    Borrow getById(Integer id);

    void update(Borrow obj);

    void deleteById(Integer id);

    void deleteReturById(Integer id);

    Map<String, Object> getCountByTimeRange(String timeRange);
}