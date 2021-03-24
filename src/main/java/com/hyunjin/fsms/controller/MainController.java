package com.hyunjin.fsms.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hyunjin.fsms.dto.FileupdDto;
import com.hyunjin.fsms.dto.MenuDto;
import com.hyunjin.fsms.service.MainService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {

	private final MainService mainService;

	@GetMapping("/")
	public String index(Model model) throws Exception {
//		List<MenuDto> allMenues = mainService.selectMenu();
//
//		List<MenuDto> categroies = new ArrayList<>();
//		List<MenuDto> menues = new ArrayList<>();
//		for (MenuDto menu : allMenues) {
//			if (menu.getPaMenuId().equals("")) {
//				categroies.add(menu);
//			} else {
//				menues.add(menu);
//			}
//		}
//
//		model.addAttribute("categroies", categroies);
//		model.addAttribute("menues", menues);
//		return "layout/main";


		String signImage = mainService.selectSign();


		model.addAttribute("img", signImage	);
		return "main/mobile";
	}

	@PostMapping("/login")
	public String login(@PathVariable("loginId") String loginId, @PathVariable("loginPw") String loginPw) {
		// LoginDto loginDto = mainService.selectLogin();

		return "main/login";
	}

	@GetMapping("/home")
	public String home() {
		// LoginDto loginDto = mainService.selectLogin();
		return "main/index";
	}

	@GetMapping("/sign")
	public String sign() {
		return "main/sign";
	}

	@PostMapping("/fileupload")
	public ResponseEntity<Map<String, Object>> fileupload(Model model, @RequestParam(value="file", required=true) MultipartFile [] files) throws Exception {

		Map<String,Object> resultMap = new HashMap<String,Object>();

		FileupdDto fileupdDto = new FileupdDto();


		String fileName = files[0].getOriginalFilename();
		byte[] bytes = files[0].getBytes();

		/*
		 * System.out.println("fileName:"+fileName); System.out.println("bytes:"+bytes);
		 * System.out.println("fileSize:"+files[0].getSize());
		 */

		fileupdDto.setItemImage(bytes);

		mainService.insertSign(fileupdDto);


		model.addAttribute("img", files[0]	);

		File file = new File(files[0].getOriginalFilename());
		file.createNewFile();
		FileOutputStream fos = new FileOutputStream(file);
		fos.write(files[0].getBytes());
		fos.close();

		System.out.println(fos);


		return new ResponseEntity<Map<String, Object>>(resultMap,HttpStatus.OK);


	}

	@GetMapping("/main")
	public String main(Model model) throws Exception {
		List<MenuDto> allMenues = mainService.selectMenu();

		List<MenuDto> categroies = new ArrayList<>();
		List<MenuDto> menues = new ArrayList<>();
		for (MenuDto menu : allMenues) {
			if (menu.getPaMenuId().equals("")) {
				categroies.add(menu);
			} else {
				menues.add(menu);
			}
		}

		model.addAttribute("categroies", categroies);
		model.addAttribute("menues", menues);
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
