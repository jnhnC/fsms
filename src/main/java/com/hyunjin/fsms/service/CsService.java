package com.hyunjin.fsms.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.hyunjin.fsms.repository.CrMapper;
import com.hyunjin.fsms.repository.CsMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CsService {

	private final CsMapper csMapper;

	public List<Map<String, Object>> fspCs001S01(Map<String, Object> map) {
		return csMapper.fspCs001S01(map);
	}

	public Map<String, Object> fspCs002S01(Map<String, Object> map) {
		return csMapper.fspCs002S01(map);
	}

	public Map<String, Object> fspCs002S02(Map<String, Object> map) {
		return csMapper.fspCs002S02(map);
	}

	public Map<String, Object> fspCs002S03(Map<String, Object> map) {
		return csMapper.fspCs002S03(map);
	}


}
