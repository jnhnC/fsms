package com.hyunjin.fsms.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hyunjin.fsms.domain.MMenu;
import com.hyunjin.fsms.dto.MenuDto;

@Mapper
public interface MainMapper {
	List<MenuDto> selectMenu();
}
