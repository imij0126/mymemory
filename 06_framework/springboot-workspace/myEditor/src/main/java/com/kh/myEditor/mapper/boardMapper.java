package com.kh.myEditor.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kh.myEditor.model.vo.Board;

@Mapper
public interface boardMapper {
	int insertBoard(Board b);
}
