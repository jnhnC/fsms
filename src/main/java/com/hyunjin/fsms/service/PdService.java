package com.hyunjin.fsms.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hyunjin.fsms.repository.PdMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PdService {

	private final PdMapper pdMapper;

	public List<Map<String, Object>> fspPd001S04(Map<String, Object> request) {
		return  pdMapper.fspPd001S04(request);
	}

	public List<Map<String, Object>> fspPd001S05(Map<String, Object> request) {
		return  pdMapper.fspPd001S05(request);
	}

	public List<Map<String, Object>> fspPd001S06(Map<String, Object> request) {
		return  pdMapper.fspPd001S06(request);
	}

}
