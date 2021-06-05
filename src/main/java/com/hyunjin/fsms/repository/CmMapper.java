package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CmMapper {

	Map<String, Object> fspZSoS01(Map<String, Object> map);
	List<Map<String, Object>> fspZSosS01(Map<String, Object> map);
	Map<String, Object> fspZAmtS01(Map<String, Object> map);
	Map<String, Object> fspZpayU01(Map<String, Object> map);
	List<Map<String, Object>> fspZpayS01(Map<String, Object> map);
	Map<String, Object> fspZimgI01(Map<String, Object> map);
	List<Map<String, Object>> fspZbminorS01(Map<String, Object> map);
	List<Map<String, Object>> fspZimgS01(Map<String, Object> map);
	Map<String, Object> fspZimgD01(Map<String, Object> map);
	Map<String, Object> fspZSoS02(Map<String, Object> map);
	Map<String, Object> fspZmmsI01(Map<String, Object> map);
	List<Map<String, Object>> fspZptnS01();
	Map<String, Object> fspZLoginS01();
	List<Map<String, Object>> fspZaddItemS(Map<String, Object> map);
	List<Map<String, Object>> fspZSosS02(Map<String, Object> map);
	Map<String, Object> wspZzUserLogin(Map<String, Object> map);


}
