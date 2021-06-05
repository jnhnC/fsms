package com.hyunjin.fsms.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hyunjin.fsms.repository.AdMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdService {

	private final AdMapper adMapper;

	public List<Map<String, Object>> fspAd001S01(Map<String, Object> map) {
		return adMapper.fspAd001S01(map);
	}

	public List<Map<String, Object>> fspAd002S01(Map<String, Object> map) {
		return adMapper.fspAd002S01(map);
	}


	public List<Map<String, Object>> fspAd002S03() {
		return adMapper.fspAd002S03();
	}

	public Map<String, Object> fspAd002U01(Map<String, Object> map) {
		return adMapper.fspAd002U01(map);
	}

	public List<Map<String, Object>> fspAd002S04() {
		return adMapper.fspAd002S04();
	}

	public List<Map<String, Object>> fspAd002S02(Map<String, Object> map) {
		return adMapper.fspAd002S02(map);
	}

}
