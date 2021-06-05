package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hyunjin.fsms.dto.TmDto;

@Mapper
public interface TmMapper {

//	List<TmDto> fspTm001S01(TmDto tmDto);
	List<Map<String,Object>> fspTm001S01(Map map);
	Map<String, Object> fspTm002S01(String soNo);
	List<Map<String, Object>> fspTm002S02(Map<String, Object> map);
	int fspTm002S03(Map<String, Object> map);

	Map<String, Object> fspTm002U01(Map<String, Object> map);
	String fspTm002U02(Map<String, Object> map);
	List<Map<String, Object>> fspTm002S04(Map<String, Object> map);

}
