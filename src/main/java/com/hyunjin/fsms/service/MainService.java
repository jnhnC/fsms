package com.hyunjin.fsms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyunjin.fsms.dto.FileupdDto;
import com.hyunjin.fsms.dto.MenuDto;
import com.hyunjin.fsms.repository.MainMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainService {

	@Autowired
	MainMapper mapper;

	public List<MenuDto> selectMenu() {
		List<MenuDto> mMenu = mapper.selectMenu();
		return mMenu;

	}

	public String selectSign() {
		return mapper.selectSign();

	}

	public void insertSign(FileupdDto fileupdDto) {
		 mapper.insertSign(fileupdDto);

	}

	/*
	 * public void insertSign() { return mapper.insertSign();
	 *
	 * }
	 */

}
