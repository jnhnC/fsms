package com.hyunjin.fsms.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hyunjin.fsms.repository.FdMapper;
import com.hyunjin.fsms.repository.MgMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MgService {
	private final MgMapper mgMapper;

	public Map<String, Object> fspMg002U01(Map<String, Object> map) {
		return mgMapper.fspMg002U01(map);
	}

	public List<Map<String, Object>> fspMg002S01(Map<String, Object> map) {
		return mgMapper.fspMg002S01(map);
	}

	public List<Map<String, Object>> fspMg002S02() {
		return mgMapper.fspMg002S02();
	}

	public List<Map<String, Object>> fspMg002S03() {
		return mgMapper.fspMg002S03();
	}


}
