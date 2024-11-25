package com.kh.LCLINIC.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.LCLINIC.model.mapper.CounselMapper;
import com.kh.LCLINIC.model.vo.Counsel;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CounselService {
	private final CounselMapper mapper;
	
	public List<Counsel> selectAllCounsel(String userId){
		return mapper.selectAllCounselByUserId(userId);
	}
}
