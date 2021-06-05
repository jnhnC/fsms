package com.hyunjin.fsms.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.hyunjin.fsms.repository.CrMapper;
import com.hyunjin.fsms.repository.FcMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FcService {
	private final FcMapper fcMapper;

	public Map<String, Object> fspFc002U01(Map<String, Object> map) {
		return fcMapper.fspFc002U01(map);
	}

	public Map<String, Object> fspFc001S01(Map<String, Object> map) {
		return fcMapper.fspFc002S01(map);
	}

}
