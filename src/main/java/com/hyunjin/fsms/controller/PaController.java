package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyunjin.fsms.controller.CmController.ADDResponse;
import com.hyunjin.fsms.controller.CmController.BmResponse;
import com.hyunjin.fsms.controller.PsController.RsResponse;
import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.PaService;
import com.hyunjin.fsms.service.PsService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class PaController {

	private final CmService cmService;
	private final PsService psService;
	private final PaService paService;

	@GetMapping("/pa")
	public String ps001() throws Exception {
		return "pa/pa001";
	}

	@GetMapping("/paa")
	public String ps003() throws Exception {
		System.out.println("003");
		return "pa/pa003";
	}


	@GetMapping("/api/pa")
	public @ResponseBody List<SoResponse> paList(PaRequest paRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "PA");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", paRequest.getStartDate());
		map.put("endDate", paRequest.getEndDate() );


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

	@GetMapping("/api/paa")
	public @ResponseBody List<PaaResponse> paaList(PaRequest paRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "PA");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", paRequest.getStartDate());
		map.put("endDate", paRequest.getEndDate() );


		List<Map<String,Object>> paas = paService.fspPa003S01(map);

		/*
		 * for(Map<String,Object> so : sos) { map.put("soNo", (String)so.get("SO_NO"));
		 * System.out.println(map); Map<String, Object> adSupCd =
		 * psService.fspPs002S09(map); if(adSupCd !=null) { so.put("ITEM_ACCT",
		 * adSupCd.get("ITEM_ACCT")); }else { so.put("ITEM_ACCT", ""); } }
		 */
		System.out.println("paas:"+paas);

		List<PaaResponse> paaResponses = paas.stream().map(PaaResponse::new).collect(toList());

		return paaResponses;
	}


	@PostMapping("/pa/1")
	public String ps002(Model model, PaRequest paRequest,  HttpSession session) throws Exception {


		Map<String,Object> map = new HashMap<>();
		map.put("soNo",  paRequest.getSoNo());
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo"));
		map.put("majorCd", session.getAttribute("majorCd") );
		map.put("itemCd", paRequest.getItemCd() );
		map.put("hsType", paRequest.getHsType());
		map.put("hsCode", paRequest.getHsCode() );
		map.put("startDate", paRequest.getStartDate() );
		map.put("endDate", paRequest.getEndDate() );
		map.put("adPackItem", paRequest.getAdPackItem() );
		map.put("soldToParty", paRequest.getSoldToParty() );
		map.put("bMinors", paRequest.getBMinors() );

		System.out.println("map"+map);


		 //so_no
		 Map<String, Object> so = cmService.fspZSoS01(map);


		// List<Map<String, Object>> xs005s = cmService.fspZbminorS01(map);
		 List<Map<String, Object>> addItems = cmService.fspZaddItemS(map);



		 List<Map<String, Object>> pas = paService.fspPa002S01(map);



		 System.out.println("pas:"+pas);

		 SoResponse soResponse = new SoResponse(so);
		 model.addAttribute("so" ,soResponse);

		 List<ADDResponse> bmResponses = addItems.stream().map(ADDResponse::new).collect(toList());
		 model.addAttribute("addItems" ,bmResponses);

		 List<PaResponse> paResponses = pas.stream().map(PaResponse::new).collect(toList());
		 model.addAttribute("pas" ,paResponses);



		 System.out.println(pas);

		return "pa/pa002";
	}


	@PostMapping("/pa")
	public @ResponseBody RsResponse savePa(PaRequest paRequest,  HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("trCount", paRequest.getTrCount());
		map.put("soNo", paRequest.getSoNo());
		map.put("status", paRequest.getStatus());
		map.put("seq", paRequest.getSeq());
		map.put("addQty", paRequest.getAddQty());
		map.put("itemCd", paRequest.getItemCd());
		map.put("empNo", session.getAttribute("empNo"));


		Map<String, Object> result = paService.savePa(map);

		RsResponse response = new RsResponse(result);

		return response;

	}




	@PostMapping("/paa")
	public @ResponseBody RsResponse savePaa(PaRequest paRequest,  HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("soNo", paRequest.getSoNo());
		map.put("empNo", session.getAttribute("empNo"));
		map.put("itemAddNo", paRequest.getItemAddNo());
		map.put("soQty", paRequest.getSoQty());
		map.put("itemCd", paRequest.getPaaItemCd());
		map.put("poBpCd", paRequest.getPoBpCd());

		System.out.println(map);
		Map<String, Object> result  = paService.fspPa003I01(map);
		RsResponse response = new RsResponse(result);

		return response;

	}




	@Data
	static class PaRequest {
		private String bpCd;
		private String poBpCd;
		private String majorCd;
		private String startDate;
		private String endDate;
		private String soNo;
		private String empNo;
		private String updtUserId;
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
		private String subs;
		private String pakage;
		private String seq[];
		private String addQty[];
		private String status[];
		private String itemCd[];
		private String trCount;
		private String itemAddNo;
		private String soQty;
		private String paaItemCd;


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
			this.adPackItem   = (String) map.get("AD_PACK_ITEM");
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
	static public class PaResponse {
		private String itemAddNo;
		private String item_acct;
		private String soNo;
		private String itemCd;
		private int addQty;
		private String addDt;
		private String seq;
		private String invQty;
		private String ownNm;
		private String itemNm;
		private String dlvyNm;
		private int soQty;
		private String bpNm;
		private String reqNm;
		private String poBpCd;
		private String poStatus;
		private String empNm;


		public PaResponse(Map<String,Object> map) {
			this.itemAddNo   = (String) map.get("ITEM_ADD_NO");
			this.soNo    = (String) map.get("SO_NO");
			this.itemCd    = (String) map.get("ITEM_CD");
			this.poBpCd    =   String.valueOf(map.get("PO_BP_CD"));

			this.addDt    =  String.valueOf(map.get("ADD_DT"));
			this.seq    =   String.valueOf(map.get("SEQ"));
			this.invQty    =   String.valueOf(map.get("INV_QTY"));
			this.ownNm    =   String.valueOf(map.get("OWN_NM"));
			this.itemNm    =   String.valueOf(map.get("ITEM_NM"));
			this.dlvyNm    =   String.valueOf(map.get("DLVY_NM"));
			this.bpNm    =   String.valueOf(map.get("BP_NM"));
			this.reqNm    =   String.valueOf(map.get("REQ_NM"));
			this.poStatus    =   String.valueOf(map.get("PO_STATUS"));
			this.empNm    =   String.valueOf(map.get("EMP_NM"));
			this.addQty    =   (int)Double.parseDouble(String.valueOf(String.valueOf(map.get("ADD_QTY"))));



		}

	}

	@Data
	@ToString
	static public class PaaResponse {
		private String itemAddNo;
		private String item_acct;
		private String soNo;
		private String itemCd;
		private int addQty;
		private String addDt;
		private String seq;
		private String invQty;
		private String ownNm;
		private String itemNm;
		private String dlvyNm;
		private int soQty;
		private String bpNm;
		private String reqNm;
		private String poBpCd;
		private String poStatus;
		private String empNm;


		public PaaResponse(Map<String,Object> map) {
			this.itemAddNo   = (String) map.get("ITEM_ADD_NO");
			this.soNo    = (String) map.get("SO_NO");
			this.itemCd    = (String) map.get("ITEM_CD");
			this.poBpCd    =   String.valueOf(map.get("PO_BP_CD"));

			this.soQty    = (int)Double.parseDouble(String.valueOf(map.get("SO_QTY")));
			this.addDt    =  String.valueOf(map.get("ADD_DT"));
			this.seq    =   String.valueOf(map.get("SEQ"));
			this.invQty    =   String.valueOf(map.get("INV_QTY"));
			this.ownNm    =   String.valueOf(map.get("OWN_NM"));
			this.itemNm    =   String.valueOf(map.get("ITEM_NM"));
			this.dlvyNm    =   String.valueOf(map.get("DLVY_NM"));
			this.bpNm    =   String.valueOf(map.get("BP_NM"));
			this.reqNm    =   String.valueOf(map.get("REQ_NM"));
			this.poStatus    =   String.valueOf(map.get("PO_STATUS"));
			this.empNm    =   String.valueOf(map.get("EMP_NM"));



		}

	}



}
