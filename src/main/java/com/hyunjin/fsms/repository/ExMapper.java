package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ExMapper {

	List<Map<String, Object>> fspEx001S01(Map<String, Object> map) ;

	Map<String, Object> fspEx002S01(String soNo);

	List<Map<String, Object>> fspEx002S02(Map<String, Object> map);

	Map<String, Object> fspEx002U01(Map<String, Object> map);

	Map<String, Object> fspEx002U02(Map<String, Object> map);

	Map<String, Object> fspEx002U03(Map<String, Object> map);

	Map<String, Object> fspEx002U04(Map<String, Object> map);

}
