package com.hyunjin.fsms.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hyunjin.fsms.dto.FileupdDto;
import com.hyunjin.fsms.dto.MenuDto;

@Mapper
public interface MainMapper {
	List<MenuDto> selectMenu();
	String selectSign();
	void insertSign(FileupdDto fileupdDto);
}
