package com.kh.myEditor.service;

import org.springframework.stereotype.Service;

import com.kh.myEditor.mapper.boardMapper;
import com.kh.myEditor.model.vo.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {
	private final boardMapper bMapper;
	public int insertBoard(Board b) {
		return bMapper.insertBoard(b);
	}
}
