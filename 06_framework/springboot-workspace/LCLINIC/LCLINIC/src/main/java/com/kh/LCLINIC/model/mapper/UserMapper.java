package com.kh.LCLINIC.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kh.LCLINIC.model.vo.User;

@Mapper
public interface UserMapper {
	
	User loginUser(String id, String password);
	
}
