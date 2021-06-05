package com.hyunjin.fsms.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hyunjin.fsms.dto.MenuDto;
import com.hyunjin.fsms.service.MainService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {

	private final MainService mainService;

	@GetMapping("/")
	public String login(Model model) throws Exception {
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



		/*
		 * String signImage = mainService.selectSign();
		 *
		 * model.addAttribute("img", signImage );
		 */

		return "main/login";
	}

	@GetMapping("/index")
	public String index(Model model) throws Exception {
		return "br/br001";
	}

	@GetMapping("/alert")
	public String alert(Model model) throws Exception {
		return "component/alert";
	}


	@GetMapping("/main")
	public String main(Model model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		
		
		session.setAttribute("bpCd", "C1091");
		session.setAttribute("majorCd", "XS001");
		session.setAttribute("empNo", "F1022");



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

	@GetMapping("/productSelectSearchContent")
	public String productSelectSearchContent() {
		return "tablet/productSelectSearchContent";
	}


	@PostMapping("/productSelectRegContent")
	public String productSelectRegContent() {
		return "tablet/productSelectRegContent";
	}

	@GetMapping("/consultResultSearchContent")
	public String consultResultSearchContent() {
		return "tablet/consultResultSearchContent";
	}


	@PostMapping("/consultResultRegContent")
	public String consultResultRegContent() {
		return "tablet/consultResultRegContent";
	}

	@GetMapping("/customSignSearchContent")
	public String customSignSearchContent() {
		return "tablet/customSignSearchContent";
	}

	@PostMapping("/customSignRegContent")
	public String customSignRegContent() {
		return "tablet/customSignRegContent";
	}

	@GetMapping("/fdSearchContent")
	public String fdSearchContent() {
		return "tablet/fdSearchContent";
	}

	@PostMapping("/fdRegContent")
	public String fdRegContent() {
		return "tablet/fdRegContent";
	}


	@GetMapping("/addDedSearchContent")
	public String addDedSearchContent() {
		return "tablet/addDedSearchContent";
	}

	@PostMapping("/addDedRegContent")
	public String addDedRegContent() {
		return "tablet/addDedRegContent";
	}


	@GetMapping("/customPaySearchContent")
	public String customPaySearchContent() {
		return "tablet/customPaySearchContent";
	}

	@PostMapping("/customPayRegContent")
	public String customPayRegContent() {
		return "tablet/customPayRegContent";
	}




}
