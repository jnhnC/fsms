package com.hyunjin.fsms.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hyunjin.fsms.repository.CrMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CrService {

	private final CrMapper crMapper;

	public List<Map<String, Object>> fspCr001S01(Map<String, Object> map) {
		return crMapper.fspCr001S01(map);
	}

	public Map<String, Object> fspCr002S01(Map<String, Object> map) {
		return crMapper.fspCr002S01(map);
	}

	public List<Map<String, Object>> fspCr002S02(Map<String, Object> map) {
		return crMapper.fspCr002S02(map);
	}

	public Map<String, Object> fspCr002U01(Map<String, Object> map) {
		return crMapper.fspCr002U01(map);
	}

	public List<Map<String, Object>> fspCr002S03(Map<String, Object> map) {
		return crMapper.fspCr002S03(map);
	}

}
