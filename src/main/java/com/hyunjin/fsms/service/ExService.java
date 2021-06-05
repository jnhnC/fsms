package com.hyunjin.fsms.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyunjin.fsms.repository.ExMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ExService {

	private final ExMapper exMapper;

	public List<Map<String, Object>> fspEx001S01(Map<String, Object> map) {
		return exMapper.fspEx001S01(map);
	}

	public Map<String, Object> fspEx002S01(String soNo) {
		return exMapper.fspEx002S01(soNo);
	}

	public List<Map<String, Object>> fspEx002S02(Map<String, Object> map) {
		return exMapper.fspEx002S02(map);
	}


	@Transactional
	public Map<String, Object> fspEx002U01(Map<String, Object> map) {
		return exMapper.fspEx002U01(map);
	}

	public Map<String, Object> fspEx002U02(Map<String, Object> map) {
		return exMapper.fspEx002U02(map);
	}

	public Map<String, Object> fspEx002U03(Map<String, Object> map) {
		return exMapper.fspEx002U03(map);
	}

	public Map<String, Object> fspEx002U04(Map<String, Object> map) {
		return exMapper.fspEx002U04(map);
	}



}
