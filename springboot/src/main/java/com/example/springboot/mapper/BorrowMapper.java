package com.example.springboot.mapper;

import com.example.springboot.controller.request.BaseRequest;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Return;
import com.example.springboot.mapper.po.BorrowReturnCountPO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BorrowMapper {

    List<Borrow> list();

    List<Borrow> listByCondition(BaseRequest baseRequest);

    List<Return> listReturByCondition(BaseRequest baseRequest);

    void save(Borrow obj);

    void saveRetur(Return obj);

    Borrow getById(Integer id);

    void updateById(Borrow user);

    void deleteById(Integer id);

    void deleteReturById(Integer id);

    void updateStatus(String status, Integer id);

    List<BorrowReturnCountPO> getCountByTimeRange(@Param("timeRange") String timeRange, @Param("type") int type);  // 1 borrow  2 return
}