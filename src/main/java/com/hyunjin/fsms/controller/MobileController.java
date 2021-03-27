package com.hyunjin.fsms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MobileController {


	@GetMapping("/mobile")
	public String mobile() {
		return "main/mobile";
	}

	@GetMapping("/mobile/index")
	public String index() {
		return "mobile/index";
	}


	@GetMapping("/mobile/main")
	public String mobilMain() {
		return "mobile/layout/main";
	}



	@GetMapping("/mobile/header")
	public String mobileHeader() {
		return "mobile/header";
	}

	@GetMapping("/mobile/button")
	public String button() {
		return "mobile/button";
	}

	@GetMapping("/mobile/buttonbar")
	public String mobileButtonbar() {
		return "mobile/buttonbar";
	}

	@GetMapping("/mobile/search")
	public String mobileSearch() {
		return "mobile/search";
	}

	@GetMapping("/mobile/table")
	public String table() {
		return "mobile/table";
	}

	@GetMapping("/mobile/selectSearch")
	public String selectSearch() {

		return "mobile/selectSearch";
	}

	@GetMapping("/mobile/datepicker")
	public String datepicker() {

		return "mobile/datepicker";
	}

	@GetMapping("/mobile/teamContent")
	public String teamContent() {
		return "mobile/teamContent";
	}

	@GetMapping("/mobile/teamSearchContent")
	public String teamSearchContent() {
		return "mobile/teamSearchContent";
	}

	@PostMapping("/mobile/teamRegContent")
	public String teamRegContent() {
		return "mobile/teamRegContent";
	}
	@GetMapping("/mobile/exSearchContent")
	public String exSearchContent() {
		return "mobile/exSearchContent";
	}

	@GetMapping("/mobile/exRegContent")
	public String exRegContent() {
		return "mobile/exRegContent";
	}

	@GetMapping("/mobile/productSearchContent")
	public String productSearchContent() {
		return "mobile/productSearchContent";
	}

	@GetMapping("/mobile/callSearchContent")
	public String callSearchContent() {
		return "mobile/callSearchContent";
	}

	@PostMapping("/mobile/callRegContent")
	public String callRegContent() {
		return "mobile/callRegContent";
	}



}
