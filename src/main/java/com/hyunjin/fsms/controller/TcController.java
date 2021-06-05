package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyunjin.fsms.controller.CmController.SoRequest;
import com.hyunjin.fsms.controller.PsController.AcResponse;
import com.hyunjin.fsms.controller.PsController.BmResponse;
import com.hyunjin.fsms.controller.PsController.CsResponse;
import com.hyunjin.fsms.controller.PsController.ItemResponse;
import com.hyunjin.fsms.controller.PsController.PsRequest;
import com.hyunjin.fsms.controller.PsController.RsResponse;
import com.hyunjin.fsms.controller.PsController.SoResponse;
import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.PsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TcController {

	//private final TcService tcService;
	private final CmService cmService;
	private final PsService psService;

	@GetMapping("/tc")
	public String tc001() throws Exception {
		return "tc/tc001";
	}

	@GetMapping("/tc/{soNo}")
	public String tc003(Model model,@PathVariable("soNo") String soNo) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soNo",  soNo);


		//so_no
		Map<String, Object> so = cmService.fspZSoS02(map);


		map.put("soldToParty", so.get("SOLD_TO_PARTY") );
		map.put("hsType",  so.get("HS_TYPE") );

		List<Map<String, Object>> items = psService.fspPs002S04(map);



		SoResponse soResponse = new SoResponse(so);
		List<ItemResponse> itemResponses = items.stream().map(ItemResponse::new).collect(toList());


		model.addAttribute("so",soResponse);
		model.addAttribute("items",itemResponses);

		return "tc/tc003";
	}




	@GetMapping("/api/tc")
	public @ResponseBody List<SoResponse> tmList(SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "TC");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("startDate", soRequest.getStartDate());
		map.put("endDate", soRequest.getEndDate() );


//		List<Map<String,Object>> soInfos = exService.fspEx001S01(map);
		List<Map<String,Object>> sos = cmService.fspZSosS01(map);


		List<SoResponse> soResponses = sos.stream().map(SoResponse::new).collect(toList());

		return soResponses;
	}



	@PostMapping("/tc/1")
	public String ex002(Model model, PsRequest psRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soNo",  psRequest.getSoNo());
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo"));
		map.put("majorCd", session.getAttribute("majorCd") );
		map.put("poBpCd", psRequest.getPoBpCd() );
		map.put("itemCd", psRequest.getItemCd() );
		map.put("hsType", psRequest.getHsType());
		map.put("hsCode", psRequest.getHsCode() );
		map.put("orderDt1", psRequest.getOrderDt1() );
		map.put("startDate", psRequest.getStartDate() );
		map.put("endDate", psRequest.getEndDate() );
		map.put("adPackItem", psRequest.getAdPackItem() );
		map.put("soldToParty", psRequest.getSoldToParty() );
		map.put("bMinors", psRequest.getBMinors() );


		 //so_no
		 Map<String, Object> so = cmService.fspZSoS01(map);


		 List<Map<String, Object>> items = psService.fspPs002S04(map);

		  so.put("SOLD_TO_PARTY",psRequest.getSoldToParty() );
		  so.put("HS_TYPE",psRequest.getHsType() );


		 List<Map<String, Object>> comSupports = psService.fspPs002S05(map);
		 List<Map<String, Object>> alterSupports = psService.fspPs002S07(map);

		 List<Map<String, Object>> bMinors = psService.fspPs002S08(map);

		 Map<String, Object> adSupCds  = psService.fspPs002S09(map);

		  SoResponse soResponse = new SoResponse(so);
		  List<ItemResponse> itemResponses = items.stream().map(ItemResponse::new).collect(toList());
		  List<CsResponse> csResponses = comSupports.stream().map(CsResponse::new).collect(toList());
		  List<BmResponse> bmResponses = bMinors.stream().map(BmResponse::new).collect(toList());


		  List<CsResponse>  atResponses = alterSupports.stream().map(CsResponse::new).collect(toList());


		  model.addAttribute("so" ,soResponse);
		  model.addAttribute("items" ,itemResponses);
		  model.addAttribute("comSupports" ,csResponses);
		  model.addAttribute("bMinors" ,bmResponses);
		  model.addAttribute("alterSupports" ,atResponses);

		  if(adSupCds !=  null) {
			  AcResponse acResponse = new AcResponse(adSupCds);
			  model.addAttribute("adSupCds" ,acResponse);
		  }

		return "tc/tc002";
	}


	@PostMapping("/tc")
	public @ResponseBody RsResponse saveTc(Model model, SoRequest soRequest, HttpSession session) throws Exception {

		return null;
	}






}
