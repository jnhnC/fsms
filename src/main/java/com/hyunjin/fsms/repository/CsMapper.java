package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CsMapper {

	List<Map<String, Object>> fspCs001S01(Map<String, Object> map);

	Map<String, Object> fspCs002S01(Map<String, Object> map);

	Map<String, Object> fspCs002S02(Map<String, Object> map);

	Map<String, Object> fspCs002S03(Map<String, Object> map);

}
