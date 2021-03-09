package com.hyunjin.fsms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	
	@GetMapping("/")
	public String login() {
		return "main/login";
	}
	
	@GetMapping("/test")
	public String test() {
		return "main/test";
	}
	
	@GetMapping("/main")
	public String index() {
		return "layout/main";
	}
	
	@GetMapping("/home")
	public String home() {
		return "main/index";
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
