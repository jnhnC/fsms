package com.hyunjin.fsms.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FcMapper {

	Map<String, Object> fspFc002U01(Map<String, Object> map);

	Map<String, Object> fspFc002S01(Map<String, Object> map);

}
