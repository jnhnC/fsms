package com.hyunjin.fsms.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hyunjin.fsms.dto.FileupdDto;
import com.hyunjin.fsms.dto.MenuDto;
import com.hyunjin.fsms.dto.SSoHdr;
import com.hyunjin.fsms.dto.TmDto;

@Mapper
public interface MainMapper {
	List<MenuDto> selectMenu();
	String selectSign();
	void insertSign(FileupdDto fileupdDto);


	/*
	 * List<TmDto> fspTm001S01(TmDto tmDto);
	 *
	 * SSoHdr fspTm002S01(SSoHdr sSoHdr); Map<String, Object> fspTm002S02();
	 * Map<String, Object> fspTm002S03();
	 */
}
