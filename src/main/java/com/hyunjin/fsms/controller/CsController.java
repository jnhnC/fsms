package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

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
import com.hyunjin.fsms.service.CrService;
import com.hyunjin.fsms.service.CsService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
@Controller
@RequiredArgsConstructor
public class CsController {

	private final CmService cmService;
	private final CsService csService;
	private final CrService crService;

	@GetMapping("/cs")
	public String cr001(Model model, PsRequest tmRequest, HttpServletRequest request, HttpSession session) throws Exception {
		return "cs/cs001";
	}


	@GetMapping("/api/cs")
	public @ResponseBody List<SoResponse> csList(PsRequest psRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "CS");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", psRequest.getStartDate());
		map.put("endDate", psRequest.getEndDate() );

		System.out.println(map);
		List<Map<String,Object>> sos = cmService.fspZSosS01(map);
		System.out.println(sos);
		List<SoResponse> soResponses = sos.stream().map(SoResponse::new).collect(toList());

		return soResponses;
	}


	@PostMapping("/cs/1")
	public String ps002(Model model, PsRequest psRequest,  HttpSession session) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("majorCd", session.getAttribute("majorCd") );
		map.put("soNo", psRequest.getSoNo());
		map.put("poBpCd", psRequest.getPoBpCd() );
		map.put("itemCd", psRequest.getAdPackItem() );
		map.put("hsType", psRequest.getHsType() );
		map.put("hsCode", psRequest.getHsCode() );
		map.put("orderDt1", psRequest.getOrderDt1() );
		map.put("startDate", psRequest.getStartDate() );
		map.put("endDate", psRequest.getEndDate() );
		map.put("soldToParty", psRequest.getBillToParty() );

		System.out.println(map);

		 //so_no
		Map<String, Object> so = cmService.fspZSoS01(map);
		SoResponse soResponse = new SoResponse(so);
		model.addAttribute("so" ,soResponse);

		return "cs/cs002";
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
		private String billToParty;

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
		private String billToParty;
		private String adPackItem;

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
			this.billToParty   = (String) map.get("BILL_TO_PARTY");
			this.adPackItem   = (String) map.get("AD_PACK_ITEM");
		}
	}

	@Data
	@ToString
	static public class PriceResponse {
		private String itemCd;	     //주문번호
		private String itemNm;	     //주문번호
		private int listPrice;	     //주문번호
		private int paybackAmt;	     //주문번호
		private int discountAmt;	     //주문번호
		private int addChargeAmt;	     //주문번호


		public PriceResponse(Map<String,Object> map) {
			this.itemCd = (String) map.get("ITEM_CD");
			this.itemNm = (String) map.get("ITEM_NM");
			this.listPrice = (int)Double.parseDouble(String.valueOf(map.get("LIST_PRICE")));
			this.paybackAmt = (int)Double.parseDouble(String.valueOf(map.get("PAYBACK_AMT")));
			this.discountAmt =(int)Double.parseDouble(String.valueOf(map.get("DISCOUNT_AMT")));
			this.addChargeAmt =(int)Double.parseDouble(String.valueOf(map.get("ADD_CHARGE_AMT")));
			/*
			 * this.addChargeAmt =
			 * (int)Double.parseDouble(String.valueOf(map.get("ADD_CHARGE_AMT")));
			 */
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
	static public class CrResponse {
		private String room;
		private String name;
		private String adMemo;
		private String dlvyCd;
		private String dlvyType;
		private String mourner;
		private String loc2;

		private String dt1;
		private String dt1H;
		private String dt1M;
		private String dt2;
		private String dt2H;
		private String dt2M;
		private String dt3;
		private String dt3H;
		private String dt3M;
		private String adBsDt;
		private String adBsDtH;
		private String adBsDtM;
		private String adYpDt;
		private String adYpDtH;
		private String adYpDtM;
		private String adGjDt;
		private String adGjDtH;
		private String adGjDtM;
		private String adGjpDt;
		private String adGjpDtH;
		private String adGjpDtM;


		public CrResponse(Map<String,Object> map) {
			this.room = (String) map.get("M_ROOM_NO");
			this.name = (String) map.get("M_NAME");
			this.adMemo = (String) map.get("AD_MEMO");
			this.dlvyCd = (String) map.get("DLVY_CD");
			this.dlvyType = (String) map.get("DLVY_TYPE");
			this.mourner = (String) map.get("M_MOURNER");
			this.loc2 = (String) map.get("M_LOC2");

			this.dt1 = (String) map.get("M_DT1");
			this.dt1H = (String) map.get("M_DT1_H");
			this.dt1M = (String) map.get("M_DT1_M");

			this.dt2 = (String) map.get("M_DT2");
			this.dt2H = (String) map.get("M_DT2_H");
			this.dt2M = (String) map.get("M_DT2_M");

			this.dt3 = (String) map.get("M_DT3");
			this.dt3H = (String) map.get("M_DT3_H");
			this.dt3M = (String) map.get("M_DT3_M");

			this.adBsDt = (String) map.get("AD_BS_DT");
			this.adBsDtH = (String) map.get("AD_BS_DT_H");
			this.adBsDtM = (String) map.get("AD_BS_DT_M");

			this.adYpDt = (String) map.get("AD_YP_DT");
			this.adYpDtH = (String) map.get("AD_YP_DT_H");
			this.adYpDtM = (String) map.get("AD_YP_DT_M");

			this.adGjDt = (String) map.get("AD_GJ_DT");
			this.adGjDtH = (String) map.get("AD_GJ_DT_H");
			this.adGjDtM = (String) map.get("AD_GJ_DT_M");

			this.adGjpDt = (String) map.get("AD_GJP_DT");
			this.adGjpDtH = (String) map.get("AD_GJP_DT_H");
			this.adGjpDtM = (String) map.get("AD_GJP_DT_M");

		}
	}

}
