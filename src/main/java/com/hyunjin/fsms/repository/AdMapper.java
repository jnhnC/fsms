package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdMapper {

	List<Map<String, Object>> fspAd001S01(Map<String, Object> map);

	List<Map<String, Object>> fspAd002S01(Map<String, Object> map);

	List<Map<String, Object>> fspAd002S02(Map<String, Object> map);

	List<Map<String, Object>> fspAd002S02();

	List<Map<String, Object>> fspAd002S03();

	Map<String, Object> fspAd002U01(Map<String, Object> map);

	List<Map<String, Object>> fspAd002S04();


}
