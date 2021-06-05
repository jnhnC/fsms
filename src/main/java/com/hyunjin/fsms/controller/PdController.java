package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hyunjin.fsms.controller.ExController.ExResponse;
import com.hyunjin.fsms.service.ExService;
import com.hyunjin.fsms.service.PdService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class PdController {

	private final PdService pdService;

	@GetMapping("/pd001")
	public String pd001(Model model, PdRequest pdRequest) throws Exception {

		Map<String,Object> request = new HashMap<>();
		request.put("bpCd", "A3069");
		request.put("itemCd", "C0200045");
		request.put("hsType", "S1");
		request.put("hsCode", "A03");

		List<Map<String,Object>> pdPrices = pdService.fspPd001S04(request);
		List<Map<String,Object>> pakages = pdService.fspPd001S05(request);
		List<Map<String,Object>> custSupprts = pdService.fspPd001S06(request);

		List<PriceResponse> priceResponse = pdPrices.stream().map(PriceResponse::new).collect(toList());
		List<PakageResponse> pakageResponse = pakages.stream().map(PakageResponse::new).collect(toList());
		List<custSupprtResponse> custSupprtResponse = custSupprts.stream().map(custSupprtResponse::new).collect(toList());

		model.addAttribute("prices",priceResponse);
		model.addAttribute("pakages",pakageResponse);
		model.addAttribute("custSupprts",custSupprtResponse);

		return "pd/pd001";
	}



	@Data
	static class PdRequest {
		private String bpCd;
		private String majorCd;
		private String startDate;
		private String endDate;
		private String soNo;
		private String empNo;
		private String updtUserId;
		private String itemNm;
	}


	@Data
	@ToString
	static public class PriceResponse {
		private int listPrice;
		private int discountAmt;
		private int totalAmt;

		public PriceResponse(Map<String,Object> map) {
			this.listPrice 	=  	(int)Double.parseDouble(String.valueOf(map.get("LIST_PRICE"))) ;
			this.discountAmt 	=  	(int)Double.parseDouble(String.valueOf(map.get("DISCOUNT_AMT"))) ;
			this.totalAmt 	=  	(int)Double.parseDouble(String.valueOf(map.get("TOTAL_AMT"))) ;

		}
	}

	@Data
	@ToString
	static public class PakageResponse {
		private String minorNm;
		private String colDesc;
		private String colHead;

		public PakageResponse(Map<String,Object> map) {
			this.minorNm   	= 	(String) map.get("MINOR_NM");
			this.colDesc 	=   (String) map.get("COL_DESC");
			this.colHead 	= 	(String) map.get("COL_HEAD");

		}
	}

	@Data
	@ToString
	static public class custSupprtResponse {
		private String colDesc;
		private String colHead;

		public custSupprtResponse(Map<String,Object> map) {
			this.colDesc   = (String) map.get("COL_DESC");
			this.colHead   = (String) map.get("COL_HEAD");

		}
	}

}
