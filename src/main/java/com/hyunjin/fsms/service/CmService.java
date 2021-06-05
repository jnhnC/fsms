package com.hyunjin.fsms.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hyunjin.fsms.repository.CmMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CmService {

	private final CmMapper cmMapper;

	public Map<String, Object> fspZSoS01(Map<String, Object> map) {
		return cmMapper.fspZSoS01(map);
	}

	public List<Map<String, Object>> fspZSosS01(Map<String, Object> map) {
		return cmMapper.fspZSosS01(map);
	}

	public Map<String, Object> fspZAmtS01(Map<String, Object> map) {
		return cmMapper.fspZAmtS01(map);
	}

	public Map<String, Object> fspZpayU01(Map<String, Object> map) {
		return cmMapper.fspZpayU01(map);
	}

	public List<Map<String, Object>> fspZpayS01(Map<String, Object> map) {
		return cmMapper.fspZpayS01(map);
	}

	public Map<String, Object> fspZimgI01(Map<String, Object> map) {
		return cmMapper.fspZimgI01(map);
	}

	public List<Map<String, Object>> fspZbminorS01(Map<String, Object> map) {
		return cmMapper.fspZbminorS01(map);
	}

	public List<Map<String, Object>> fspZimgS01(Map<String, Object> map) {
		return cmMapper.fspZimgS01(map);
	}

	public Map<String, Object> fspZimgD01(Map<String, Object> map) {
		return cmMapper.fspZimgD01(map);
	}

	public Map<String, Object> fspZSoS02(Map<String, Object> map) {
		return cmMapper.fspZSoS02(map);
	}

	public Map<String, Object> fspZmmsI01(Map<String, Object> map) {
		return cmMapper.fspZmmsI01(map);
	}

	public List<Map<String, Object>> fspZptnS01() {
		return cmMapper.fspZptnS01();
	}

	public Map<String, Object> fspZLoginS01(Map<String, Object> map) {
		return cmMapper.fspZLoginS01();
	}

	public List<Map<String, Object>> fspZaddItemS(Map<String, Object> map) {
		return cmMapper.fspZaddItemS(map);
	}

	public List<Map<String, Object>> fspZSosS02(Map<String, Object> map) {
		return cmMapper.fspZSosS02(map);
	}

	public Map<String, Object> wspZzUserLogin(Map<String, Object> map) {
		return cmMapper.wspZzUserLogin(map);
	}





}
