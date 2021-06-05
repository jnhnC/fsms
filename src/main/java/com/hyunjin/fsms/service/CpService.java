package com.hyunjin.fsms.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.hyunjin.fsms.repository.CpMapper;
import com.hyunjin.fsms.repository.CrMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CpService {

	private final CpMapper cpMapper;

	public Map<String, Object> fspCp002U01(Map<String, Object> map) {
		return cpMapper.fspCp002U01(map);
	}

	public String fspCp002S01(Map<String, Object> map) {
		return cpMapper.fspCp002S01(map);
	}

	public Map<String, Object> fspCp002U02(Map<String, Object> map) {
		return cpMapper.fspCp002U02(map);
	}
}
