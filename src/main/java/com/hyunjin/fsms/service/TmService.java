package com.hyunjin.fsms.service;


import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunjin.fsms.dto.SSoHdr;
import com.hyunjin.fsms.dto.TmDto;
import com.hyunjin.fsms.repository.MainMapper;
import com.hyunjin.fsms.repository.TmMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TmService {


	private final TmMapper mapper;

	/*
	 * public List<TmDto> fspTm001S01(TmDto tmDto) { List<TmDto> tmDtos =
	 * mapper.fspTm001S01(tmDto); return tmDtos;
	 *
	 * }
	 */

	public List<Map<String,Object>> fspTm001S01(Map map) {
		List<Map<String,Object>> tmDtos = mapper.fspTm001S01(map);
		return tmDtos;

	}

	public Map<String,Object> fspTm002S01(String soNo) {
		Map<String,Object> map  = mapper.fspTm002S01(soNo);
		return map;
	}

	public Map<String, Object> fspTm002U01(Map<String, Object> map) {
		return mapper.fspTm002U01(map);
	}

	public List<Map<String, Object>> fspTm002S02(Map<String, Object> map) {
		return mapper.fspTm002S02(map);
	}

	public int fspTm002S03(Map<String, Object> map) {
		return mapper.fspTm002S03(map);
	}

	public String fspTm002U02(Map<String, Object> map) {
		return mapper.fspTm002U02(map);
	}

	public List<Map<String, Object>> fspTm002S04(Map<String, Object> map) {
		return mapper.fspTm002S04(map);
	}



	/*
	 * public SSoHdr fspTm002S01(SSoHdr soHdr) {
	 *
	 * return mapper.fspTm002S01(soHdr);
	 *
	 * }
	 *
	 * public void fspTm002S02() {
	 *
	 *
	 * Map<String, Object> fspTm002S02 = mapper.fspTm002S02();
	 *
	 * for (Entry<String, Object> entry : fspTm002S02.entrySet()) {
	 * System.out.println("Key : " + entry.getKey() + " Value : " +
	 * entry.getValue()); }
	 *
	 *
	 * }
	 *
	 *
	 * public void fspTm002S03() {
	 *
	 * Map<String, Object> fspTm002S03 = mapper.fspTm002S03();
	 *
	 * for (Entry<String, Object> entry : fspTm002S03.entrySet()) {
	 * System.out.println("Key : " + entry.getKey() + " Value : " +
	 * entry.getValue()); }
	 *
	 * }
	 */




}
