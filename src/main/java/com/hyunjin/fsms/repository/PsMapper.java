package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PsMapper {

	List<Map<String, Object>> fspPs001S01(Map<String, Object> map);

	Map<String, Object> fspPs002S01(Map<String, Object> map);

	List<Map<String, Object>> fspPs002S02(Map<String, Object> map);

	List<Map<String, Object>> fspPs002S04(Map<String, Object> map);

	List<Map<String, Object>> fspPs002S05(Map<String, Object> map);

	List<Map<String, Object>> fspPs002S06(Map<String, Object> map);

	List<Map<String, Object>> fspPs002S08(Map<String, Object> map);

	List<Map<String, Object>> fspPs002S07(Map<String, Object> map);

	Map<String, Object> fspPs002S09(Map<String, Object> map);

	Map<String, Object> fspPs002U01(Map<String, Object> map);

	Map<String, Object> fspPs002D01(Map<String, Object> map);

	Map<String, Object> fspPs002I01(Map<String, Object> map);



}
