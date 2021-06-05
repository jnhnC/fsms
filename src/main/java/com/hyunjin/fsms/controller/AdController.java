package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyunjin.fsms.controller.CrController.RsResponse;
import com.hyunjin.fsms.controller.PsController.SoResponse;
import com.hyunjin.fsms.controller.MgController.MjResponse;
import com.hyunjin.fsms.service.AdService;
import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.PsService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class AdController {

	private final AdService adService;
	private final CmService cmService;
	private final PsService psService;

	@GetMapping("/ad")
	public String ad001() throws Exception {
		return "ad/ad001";
	}


	@GetMapping("/api/ad")
	public @ResponseBody List<SoResponse> adList(AdRequest adRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "AD");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", adRequest.getStartDate());
		map.put("endDate", adRequest.getEndDate() );

		System.out.println(map);
		List<Map<String,Object>> sos = cmService.fspZSosS01(map);
		for(Map<String,Object> so :  sos) {
			map.put("soNo", (String)so.get("SO_NO"));
			System.out.println(map);
			Map<String, Object> adSupCd  = psService.fspPs002S09(map);
			if(adSupCd !=null) {
				so.put("ITEM_ACCT", adSupCd.get("ITEM_ACCT"));
			}else {
				so.put("ITEM_ACCT", "");
			}
		}
		System.out.println(sos);
		List<SoResponse> soResponses = sos.stream().map(SoResponse::new).collect(toList());

		return soResponses;
	}


	@PostMapping("/ad/1")
	public String ps002(Model model, AdRequest adRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soNo", adRequest.getSoNo());
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("majorCd", session.getAttribute("majorCd") );
		map.put("poBpCd", adRequest.getPoBpCd() );
		map.put("itemCd", adRequest.getItemCd() );
		map.put("hsType", adRequest.getHsType() );
		map.put("hsCode", adRequest.getHsCode() );
		map.put("orderDt1", adRequest.getOrderDt1() );

		System.out.println(map);
		 //so_no
		Map<String, Object> so = cmService.fspZSoS01(map);


		List<Map<String, Object>> adds = adService.fspAd002S03();
		List<Map<String, Object>> deds = adService.fspAd002S04();

		List<Map<String, Object>> inAdds = adService.fspAd002S01(map);
		List<Map<String, Object>> indeds = adService.fspAd002S02(map);


		SoResponse soResponse = new SoResponse(so);

		List<AdResponse> inAddsResponse = inAdds.stream().map(AdResponse::new).collect(toList());
		List<AdResponse> indedsResponse = indeds.stream().map(AdResponse::new).collect(toList());

		Map<String, Object> total = new HashMap<>();

		int addTotAmt = 0;
		for(AdResponse inAdd : inAddsResponse) {
			addTotAmt += Integer.parseInt(inAdd.getTotAmt1());
		}

		int dedTotAmt = 0;
		for(AdResponse inded : indedsResponse) {
			dedTotAmt += Integer.parseInt(inded.getTotAmt1());
		}

		total.put("addTotAmt", addTotAmt);
		total.put("dedTotAmt", dedTotAmt);

		List<MjResponse> addsResponse = adds.stream().map(MjResponse::new).collect(toList());
		List<MjResponse> dedsResponse = deds.stream().map(MjResponse::new).collect(toList());



		model.addAttribute("so" ,soResponse);
		model.addAttribute("inAdds" ,inAddsResponse);
		model.addAttribute("indeds" ,indedsResponse);
		model.addAttribute("adds" ,addsResponse);
		model.addAttribute("deds" ,dedsResponse);
		model.addAttribute("total" ,total);


		return "ad/ad002";
	}

	@PostMapping("/ad")
	public @ResponseBody RsResponse saveAd(AdRequest adRequest,  HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("soNo", adRequest.getSoNo());
		map.put("empNo", session.getAttribute("empNo"));
		map.put("bpCd", session.getAttribute("bpCd"));


		int addCnt = Integer.parseInt(adRequest.getAddTrCount());
		int dedCnt = Integer.parseInt(adRequest.getDedTrCount());


		List<Map<String, Object>> results = new ArrayList<>();

		for (int i = 0; i < addCnt; i++) {

			String status = "";
			String addCd = "";
			String addPoQty = "";
			String addTotoAmt1 = "";

			if(adRequest.getAddStatus().length != 0) {
				status = adRequest.getAddStatus()[i].equals("null") ? "" : adRequest.getAddStatus()[i];
			}

			if(adRequest.getAddCd().length != 0) {
				addCd = adRequest.getAddCd()[i].equals("null") ? "" : adRequest.getAddCd()[i];
			}
			if(adRequest.getAddPoQty().length != 0) {
				addPoQty = adRequest.getAddPoQty()[i].equals("null") ? "" : adRequest.getAddPoQty()[i];
			}
			if(adRequest.getAddTotAmt1().length != 0) {
				addTotoAmt1 = adRequest.getAddTotAmt1()[i].equals("null") ? "" : adRequest.getAddTotAmt1()[i];
			}

			map.put("itemCd", addCd);
			map.put("poQty", addPoQty);
			map.put("totAmt1", addTotoAmt1.replaceAll(",", ""));
			map.put("status", status);
			map.put("costGubun", "1");

			System.out.println(map);

			 Map<String, Object> result = adService.fspAd002U01(map);
			//results.add(fdService.fspFd002U01(map));
		}


		for (int i = 0; i < dedCnt; i++) {

			String status = "";
			String dedCd = "";
			String dedPoQty = "";
			String dedTotoAmt1 = "";


			if(adRequest.getDedStatus().length != 0) {
				status = adRequest.getDedStatus()[i].equals("null") ? "" : adRequest.getDedStatus()[i];
			}

			if(adRequest.getDedCd().length != 0) {
				dedCd = adRequest.getDedCd()[i].equals("null") ? "" : adRequest.getDedCd()[i];
			}
			if(adRequest.getDedPoQty().length != 0) {
				dedPoQty = adRequest.getDedPoQty()[i].equals("null") ? "" : adRequest.getDedPoQty()[i];
			}
			if(adRequest.getDedTotAmt1().length != 0) {
				dedTotoAmt1 = adRequest.getDedTotAmt1()[i].equals("null") ? "" : adRequest.getDedTotAmt1()[i];
			}

			map.put("itemCd", dedCd);
			map.put("poQty", dedPoQty);
			map.put("totAmt1", dedTotoAmt1.replaceAll(",", ""));
			map.put("status", status);
			map.put("costGubun", "2");
			System.out.println(map);

			 Map<String, Object> result = adService.fspAd002U01(map);
			//results.add(fdService.fspFd002U01(map));


		}

		Map<String, Object> result = new HashMap<>();

		for(Map<String, Object> r : results){
			if(r.get("MSG_CD").equals("0")) {
				result.put("MSG_CD", "0");
				break;
			}else {
				result.put("MSG_CD", "1");
			}
		}

		RsResponse response = new RsResponse(result);

		return response;

	}

	@Data
	static class AdRequest {
		private String bpCd;
		private String poBpCd;
		private String majorCd;
		private String startDate;
		private String endDate;
		private String soNo;
		private String empNo;
		private String updtUserId;
		private String itemCd;
		private String hsType;
		private String hsCode;
		private String orderDt1;


		private String addTrCount;
		private String[] addCd;
		private String[] addPoQty;
		private String[] addTotAmt1;
		private String[] addStatus;

		private String dedTrCount;
		private String[] dedCd;
		private String[] dedPoQty;
		private String[] dedTotAmt1;
		private String[] dedStatus;

	}


	@Data
	@ToString
	static public class AdResponse {
		private String itemCd;
		private String itemNm;
		private String totAmt1;
		private String totAmt;
		private String poQty;


		public AdResponse(Map<String,Object> map) {
			this.itemCd = (String) map.get("ITEM_CD");
			this.itemNm = (String) map.get("ITEM_NM");
			this.totAmt1   = String.valueOf(map.get("TOT_AMT1"));
			this.totAmt   = String.valueOf(map.get("TOT_AMT"));
			this.poQty   = String.valueOf(map.get("PO_QTY"));
		}
	}



}
