package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.PsService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class PsController {

	private final CmService cmService;
	private final PsService psService;

	@GetMapping("/ps")
	public String ps001(Model model, PsRequest tmRequest, HttpServletRequest request, HttpSession session) throws Exception {
		return "ps/ps001";
	}


	@GetMapping("/api/ps")
	public @ResponseBody List<SoResponse> psList(PsRequest psRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "PS");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", psRequest.getStartDate());
		map.put("endDate", psRequest.getEndDate() );


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


	@PostMapping("/ps/1")
	public String ps002(Model model, PsRequest psRequest,  HttpSession session) throws Exception {


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

		System.out.println("map"+map);


		 //so_no
		 Map<String, Object> so = cmService.fspZSoS01(map);

		 System.out.println("so:"+so);

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


		  List<AlResponse>  atResponses = alterSupports.stream().map(AlResponse::new).collect(toList());

		  model.addAttribute("so" ,soResponse);
		  model.addAttribute("items" ,itemResponses);
		  model.addAttribute("comSupports" ,csResponses);
		  model.addAttribute("bMinors" ,bmResponses);
		  model.addAttribute("alterSupports" ,atResponses);

		  if(adSupCds !=  null) {
			  AcResponse acResponse = new AcResponse(adSupCds);
			  model.addAttribute("adSupCds" ,acResponse);
		  }

		return "ps/ps002";
	}


	@PostMapping("/api/ps/selSupports")
	public @ResponseBody List<CsResponse> selSupports(PsRequest psRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soldToParty", psRequest.getSoldToParty() );
		map.put("hsType",  psRequest.getHsType() );
		map.put("itemCd", psRequest.getItemCd() );


		System.out.println(map);


		//#{soldToParty},#{hsType},#{itemCd}
		List<Map<String,Object>> selSupports = psService.fspPs002S06(map);
		System.out.println(selSupports);
		List<CsResponse> csResponses = selSupports.stream().map(CsResponse::new).collect(toList());

		return csResponses;
	}


	@PostMapping("/ps")
	public @ResponseBody RsResponse savePs(PsRequest psRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soNo", psRequest.getSoNo() );
		map.put("adMemo", psRequest.getAdMemo() );
		map.put("adSign", psRequest.getAdSign() );
		map.put("adType", psRequest.getAdType() );
		map.put("adPackItem", psRequest.getAdChItem() );
		map.put("empNo",  session.getAttribute("empNo") );
		map.put("infoAgreeYn", psRequest.getInfoAgreeYn() );
		map.put("bMinors", psRequest.getBMinors() );
		map.put("adChItem", psRequest.getAdChItem() );

		System.out.println("savePs-map:"+map);


		Map<String,Object> result = psService.savePs(map);

		System.out.println(result);

		RsResponse response = new RsResponse(result);


		return response;
	}


	@Data
	static class PsRequest {
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
		private String adPackItem;
		private String soldToParty;
		private String adMemo;
		private String adSign;
		private String adType;
		private String infoAgreeYn;
		private String bMinors;
		private String adChItem;

	}

	@Data
	@ToString
	static public class SoResponse {
		private String soNo;	     //주문번호
		private String orderDt;
		private String orderDt1;
		private String bpNm;
		private String poStatusNm;
		private String ownNm;		//대상자
		private String dlvyNm;		//장례식장
		private String hsNm;		//사유
		private String adNm;		//상담결과
		private String bpCd;
		private String poBpCd;
		private String itemCd;
		private String hsType;
		private String hsCode;
		private String soldToParty;
		private String adPackItem;
		private String adChItem;
		private String adType;
		private String infoAgreeYn;
		private String ownTelNo1;
		private String itemAcct;
		private String billToParty;
		private String infoAgreeFinal;
		private String infoAgreeFinalSign;
		private String sign;
		private String addCd1;

		private String result;


		public SoResponse(Map<String,Object> map) {
			this.soNo = (String) map.get("SO_NO");
			this.orderDt   = (String) map.get("ORDER_DT");
			this.orderDt1   = String.valueOf(map.get("ORDER_DT1"));
			this.bpNm   = (String) map.get("BP_NM");
			this.poStatusNm   = (String) map.get("PO_STATUS_NM");
			this.ownNm     = (String) map.get("OWN_NM");
			this.dlvyNm    = (String) map.get("DLVY_NM");
			this.hsNm   = (String) map.get("HS_NM");
			this.adNm   = (String) map.get("AD_NM");
			this.poBpCd   = (String) map.get("PO_BP_CD");
			this.itemCd   = (String) map.get("ITEM_CD");
			this.hsType   = (String) map.get("HS_TYPE");
			this.hsCode   = (String) map.get("HS_CD");
			this.soldToParty   = (String) map.get("SOLD_TO_PARTY");
			this.adPackItem   = (String) map.get("AD_PACK_ITEM");
			this.adChItem   = (String) map.get("AD_CH_ITEM");
			this.adType   = (String) map.get("AD_TYPE");
			this.infoAgreeYn   = (String) map.get("INFO_AGREE_YN");
			this.ownTelNo1   = (String) map.get("OWN_TEL_NO1");
			this.itemAcct   = (String) map.get("ITEM_ACCT");
			this.billToParty   = (String) map.get("BILL_TO_PARTY");
			this.soldToParty  = (String) map.get("SOLD_TO_PARTY");
			this.adType   = (String) map.get("AD_TYPE");
			this.infoAgreeFinal   = (String) map.get("INFO_AGREE_FINAL");
			this.infoAgreeFinalSign   = String.valueOf(map.get("INFO_AGREE_FINAL_SIGN"));
			this.sign   = String.valueOf(map.get("SIGN"));
			this.addCd1   = String.valueOf(map.get("ADD_CD1"));
		}
	}

	@Data
	@ToString
	static public class ItemResponse {
		private String itemCd;
		private String itemNm;


		public ItemResponse(Map<String,Object> map) {
			this.itemCd = (String) map.get("ITEM_CD");
			this.itemNm = (String) map.get("ITEM_NM");
		}
	}

	@Data
	@ToString
	static public class CsResponse {
		private String minorNm;
		private String colDesc;


		public CsResponse(Map<String,Object> map) {
			this.minorNm = (String) map.get("MINOR_NM");
			this.colDesc = (String) map.get("COL_DESC");
		}
	}


	@Data
	@ToString
	static public class BmResponse {
		private String minerCode;
		private String minerName;


		public BmResponse(Map<String,Object> map) {
			this.minerCode = (String) map.get("CODE");
			this.minerName = (String) map.get("NAME");
		}
	}


	@Data
	@ToString
	static public class RsResponse {
		private String msgCd;
		private String msgText;


		public RsResponse(Map<String,Object> map) {
			this.msgCd   = (String) map.get("MSG_CD");
			this.msgText   = (String) map.get("MSG_TEXT");

		}
	}


	@Data
	@ToString
	static public class AcResponse {
		private String item_acct_cd;
		private String item_acct;


		public AcResponse(Map<String,Object> map) {
			this.item_acct_cd   = (String) map.get("ITEM_ACCT_CD");
			this.item_acct    = (String) map.get("ITEM_ACCT");

		}

	}


	@Data
	@ToString
	static public class AlResponse {
		private String minorNm;
		private String seqNo;
		private String colDesc;


		public AlResponse(Map<String,Object> map) {
			this.minorNm = (String) map.get("MINOR_NM");
			this.colDesc = (String) map.get("COL_DESC");
			this.seqNo = String.valueOf(map.get("SEQ_NO"));
		}
	}



}
