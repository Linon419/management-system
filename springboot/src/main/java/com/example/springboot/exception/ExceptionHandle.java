package com.example.springboot.exception;

import cn.hutool.core.util.StrUtil;
import com.example.springboot.common.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class ExceptionHandle {

    @ExceptionHandler(value = ServiceException.class)
    public Result serviceExceptionError(ServiceException e) {
        log.error("service exception", e);
        String code = e.getCode();
//        if (StrUtil.isNotBlank(code)) {
//            return Result.error(code, e.getMessage());
//        }
        return Result.error(e.getMessage());
    }

    @ExceptionHandler(value = Exception.class)
    public Result exceptionError(Exception e) {
        log.error("system exception", e);
        return Result.error("system exception");
    }
}
