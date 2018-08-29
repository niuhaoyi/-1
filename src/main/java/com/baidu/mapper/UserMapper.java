package com.baidu.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.baidu.dto.User;

@Mapper
public interface UserMapper {

	User toLogin(User user);
}
