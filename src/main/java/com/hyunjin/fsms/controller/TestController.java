package com.hyunjin.fsms.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.filechooser.FileSystemView;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.hyunjin.fsms.dto.FileupdDto;
import com.hyunjin.fsms.service.MainService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TestController {

	private final MainService mainService;

	/*
	 * @PostMapping("/login") public String login(@PathVariable("loginId") String
	 * loginId, @PathVariable("loginPw") String loginPw) { // LoginDto loginDto =
	 * mainService.selectLogin();
	 *
	 * return "main/login"; }
	 */
	@GetMapping("/qr")
	public String qr() {

		return "main/qr";
	}

	@GetMapping("/posco")
	public String posco() {

		return "main/posco";
	}

	@GetMapping("/camera")
	public String camera() {

		return "main/camera";
	}

	@GetMapping("/fileUpload")
	public String fileEx() {

		return "main/fileUpload";
	}

	// 단일파일 업로드
	@PostMapping("/upload")
	public String upload(@RequestParam("file") MultipartFile file) throws Exception {
		String rootPath = FileSystemView.getFileSystemView().getHomeDirectory().toString();
		String basePath = rootPath + "/" + "savefile";
		String filePath = basePath + "/" + file.getOriginalFilename();
		System.out.println(filePath);
		File dest = new File(filePath);
		file.transferTo(dest); // 파일 업로드 작업 수행
		return "uploaded";
	}

	@GetMapping("/home")
	public String home() {
		// LoginDto loginDto = mainService.selectLogin();
		return "main/index";
	}

	@GetMapping("/myPage")
	public String myPage() {
		// LoginDto loginDto = mainService.selectLogin();
		return "component/myPage";
	}

	@GetMapping("/sign")
	public String sign(Model model) {

		String signImage = mainService.selectSign();
		System.out.println("1232");
		System.out.println("test:" + signImage);
		model.addAttribute("img", signImage);

		return "main/sign";
	}

	@GetMapping("/search")
	public String search() {
		return "component/search";
	}

	@GetMapping("/swiper")
	public String swiper() {
		return "component/swiper";
	}

	@PostMapping("/fileupload")
	public ResponseEntity<Map<String, Object>> fileupload(Model model,
			@RequestParam(value = "file", required = true) MultipartFile[] files) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();

		FileupdDto fileupdDto = new FileupdDto();

		String fileName = files[0].getOriginalFilename();
		byte[] bytes = files[0].getBytes();

		/*
		 * System.out.println("fileName:"+fileName); System.out.println("bytes:"+bytes);
		 * System.out.println("fileSize:"+files[0].getSize());
		 */

		fileupdDto.setItemImage(bytes);

		mainService.insertSign(fileupdDto);

		model.addAttribute("img", files[0]);

		File file = new File(files[0].getOriginalFilename());
		file.createNewFile();
		FileOutputStream fos = new FileOutputStream(file);
		fos.write(files[0].getBytes());
		fos.close();

		System.out.println(fos);

		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);

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
