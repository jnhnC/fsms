package com.hyunjin.fsms.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.hyunjin.fsms.dto.MenuDto;
import com.hyunjin.fsms.service.MainService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {

	private final MainService mainService;

	@GetMapping("/")
	public String index() {
		return "main/login";
	}

	@PostMapping("/login")
	public String login(@PathVariable("loginId") String loginId,
						@PathVariable("loginPw") String loginPw) {
		//LoginDto loginDto = mainService.selectLogin();

		return "main/login";
	}


	@GetMapping("/main")
	public String main(Model model) throws Exception {
		List<MenuDto> allMenues = mainService.selectMenu();

		List<MenuDto> categroies = new ArrayList<>();
		List<MenuDto> menues = new ArrayList<>();
		for (MenuDto menu : allMenues) {
			if(menu.getPaMenuId().equals("")) {
				categroies.add(menu);
			}else {
				menues.add(menu);
			}
		}

		model.addAttribute("categroies",categroies);
		model.addAttribute("menues",menues);
		return "layout/main";
	}

	@GetMapping("/1")
	public String test1() {
		return "main/test1";
	}


	@GetMapping("/2")
	public String test2() {
		return "main/test2";
	}

	@GetMapping("/3")
	public String test3() {
		return "main/test3";
	}

	@GetMapping("/4")
	public String test4() {
		return "main/test4";
	}

	@GetMapping("/5")
	public String test5() {
		return "main/test5";
	}


}
