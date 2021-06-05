package com.hyunjin.fsms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hyunjin.fsms.dto.TmDto;
import com.hyunjin.fsms.service.TmService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MobileController {

	private final TmService tmService;

	@GetMapping("/mobile")
	public String mobile() {
		return "main/mobile";
	}

	@GetMapping("/mobile/index")
	public String index() {
		return "mobile/mobileIndex";
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

	/*
	 * @PostMapping("/mobile/teamSearchContent") public String
	 * teamSearchContent(Model model, TmDto tmDto) { tmDto.setBpCd("C1091");
	 * tmDto.setMajorCd("XS001"); List<TmDto> tmDtos = tmService.fspTm001S01(tmDto);
	 * System.out.println(tmDtos); model.addAttribute("tmDtos", tmDtos);
	 *
	 * return "mobile/teamSearchContent"; }
	 */

	/*
	 * @PostMapping("/mobile/teamRegContent") public String teamRegContent() {
	 *
	 * tmService.fspTm002S01();
	 *
	 * tmService.fspTm002S02(); tmService.fspTm002S03();
	 *
	 * return "mobile/teamRegContent"; }
	 */

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

	@GetMapping("/mobile/dispatchReqSearchContent")
	public String dispatchReqSearchContent() {
		return "mobile/dispatchReqSearchContent";
	}

	@PostMapping("/mobile/dispatchReqRegContent")
	public String dispatchReqRegContent() {
		return "mobile/dispatchReqRegContent";
	}

	@GetMapping("/mobile/dispatchSearchContent")
	public String dispatchSearchContent() {
		return "mobile/dispatchSearchContent";
	}

	@PostMapping("/mobile/dispatchRegContent")
	public String dispatchRegContent() {
		return "mobile/dispatchRegContent";
	}

	@GetMapping("/mobile/driveRegSearchContent")
	public String driveRegSearchContent() {
		return "mobile/driveRegSearchContent";
	}

	@PostMapping("/mobile/driveRegRegContent")
	public String driveRegRegContent() {
		return "mobile/driveRegRegContent";
	}

}
