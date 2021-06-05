package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FdMapper {

	List<Map<String, Object>> fspFd001S01(Map<String, Object> map);

	List<Map<String, Object>> fspFd002S01(Map<String, Object> map);

	List<Map<String, Object>> fspFd002S02(Map<String, Object> map);

	Map<String, Object> fspFd002U01(Map<String, Object> map);

}
