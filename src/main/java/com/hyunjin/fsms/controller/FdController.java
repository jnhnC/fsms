package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hyunjin.fsms.controller.CrController.RsResponse;
import com.hyunjin.fsms.controller.PsController.SoResponse;
import com.hyunjin.fsms.controller.CmController.AtResponse;
import com.hyunjin.fsms.controller.CmController.BmResponse;
import com.hyunjin.fsms.controller.CmController.ImgResponse;
import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.CsService;
import com.hyunjin.fsms.service.FdService;
import com.hyunjin.fsms.service.PsService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class FdController {

	private final CmService cmService;
	private final FdService fdService;
	private final PsService psService;

	@GetMapping("/fd")
	public String cr001(Model model, SoRequest soRequest, HttpServletRequest request, HttpSession session) throws Exception {
		return "fd/fd001";
	}


	@GetMapping("/api/fd")
	public @ResponseBody List<SoResponse> psList(SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "FD");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", soRequest.getStartDate());
		map.put("endDate", soRequest.getEndDate() );

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


	@PostMapping("/fd/1")
	public String ps002(Model model,  SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo"));
		map.put("majorCd", session.getAttribute("majorCd") );
		map.put("soNo", soRequest.getSoNo());
		map.put("poBpCd", soRequest.getPoBpCd() );
		map.put("itemCd", soRequest.getAdPackItem() );
		map.put("hsType", soRequest.getHsType() );
		map.put("hsCode", soRequest.getHsCode() );
		map.put("orderDt1", soRequest.getOrderDt1() );
		map.put("startDate", soRequest.getStartDate() );
		map.put("endDate", soRequest.getEndDate() );
		map.put("soldToParty", soRequest.getSoldToParty() );
		System.out.println(map);

		Map<String, Object> so = cmService.fspZSoS01(map);
		so.put("HS_TYPE",soRequest.getHsType());
		Map<String,Object> amt = cmService.fspZAmtS01(map);
		System.out.println("fdamt:"+amt);
		map.put("bMajorCd", "XS005" );
		List<Map<String, Object>> xs005s = cmService.fspZbminorS01(map);

		List<Map<String, Object>> imgs = cmService.fspZimgS01(map);

		List<Map<String, Object>> wss = fdService.fspFd002S01(map);


		SoResponse soResponse = new SoResponse(so);


		List<BmResponse> bmResponses = xs005s.stream().map(BmResponse::new).collect(toList());
		List<ImgResponse> imgResponses = imgs.stream().map(ImgResponse::new).collect(toList());
		List<WsResponse> wsResponses = wss.stream().map(WsResponse::new).collect(toList());
		AtResponse atResponse = new AtResponse(amt);

		model.addAttribute("so" ,soResponse);
		model.addAttribute("xs005s" ,bmResponses);
		model.addAttribute("imgs" ,imgResponses);
		model.addAttribute("amt" ,atResponse);
		if(wss.size() != 0) model.addAttribute("wss" ,wsResponses);


		return "fd/fd002";
	}


	@PostMapping("/fd")
	public @ResponseBody RsResponse saveFd(SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("trCount", soRequest.getTrCount());
		map.put("soNo", soRequest.getSoNo());
		map.put("empNo", session.getAttribute("empNo"));
		map.put("status", soRequest.getStatus());
		map.put("actSeq", soRequest.getActSeq());
		map.put("actDt", soRequest.getActDt());
		map.put("actDtInHour",soRequest.getActDtInHour());
		map.put("actDtInMinute",soRequest.getActDtInMinute());
		map.put("actDtOutHour",soRequest.getActDtOutHour());
		map.put("actDtOutMinute",soRequest.getActDtOutMinute());
		map.put("actRemark", soRequest.getActRemark());


		Map<String, Object> result = fdService.saveFd(map);

		RsResponse response = new RsResponse(result);

		return response;

	}




	@Data
	static class SoRequest {
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
		private String trCount;
		private String bMajorCd;
		private String xs005;

		private String actSeq[];
		private String actDt[];
		private String actDtInHour[];
		private String actDtInMinute[];
		private String actDtOutHour[];
		private String actDtOutMinute[];
		private String actRemark[];
		private String status[];



	}
	/*
	 * @Data
	 *
	 * @ToString static public class SoResponse { private String soNo; //주문번호
	 * private String orderDt; private String orderDt1; private String bpNm; private
	 * String poStatusNm; private String ownNm; //대상자 private String dlvyNm; //장례식장
	 * private String hsNm; //사유 private String adNm; //상담결과 private String bpCd;
	 * private String poBpCd; private String itemCd; private String hsType; private
	 * String hsCode; private String billToParty; private String adPackItem;
	 *
	 * private String result;
	 *
	 *
	 * public SoResponse(Map<String,Object> map) { this.soNo = (String)
	 * map.get("SO_NO"); this.orderDt = (String) map.get("ORDER_DT"); this.orderDt1
	 * = String.valueOf(map.get("ORDER_DT1")); this.bpNm = (String)
	 * map.get("BP_NM"); this.poStatusNm = (String) map.get("PO_STATUS_NM");
	 * this.ownNm = (String) map.get("OWN_NM"); this.dlvyNm = (String)
	 * map.get("DLVY_NM"); this.hsNm = (String) map.get("HS_NM"); this.adNm =
	 * (String) map.get("AD_NM"); this.poBpCd = (String) map.get("PO_BP_CD");
	 * this.itemCd = (String) map.get("ITEM_CD"); this.hsType = (String)
	 * map.get("HS_TYPE"); this.hsCode = (String) map.get("HS_CD"); this.billToParty
	 * = (String) map.get("BILL_TO_PARTY"); this.adPackItem = (String)
	 * map.get("AD_PACK_ITEM"); } }
	 */


	@Data
	@ToString
	static public class WsResponse {
		private String actDt;
		private String actDtInHour;
		private String actDtInMinute;
		private String actDtOutHour;
		private String actDtOutMinute;
		private String workTime;
		private String actRemark;
		private String actSeq;


		public WsResponse(Map<String,Object> map) {
			this.actDt 	=	String.valueOf(map.get("ACT_DT"));
			this.actDtInHour   = String.valueOf(map.get("ACT_DT_IN_HOUR"));
			this.actDtInMinute   = 	String.valueOf(map.get("ACT_DT_IN_MINUTE"));
			this.actDtOutHour   = String.valueOf(map.get("ACT_DT_OUT_HOUR"));
			this.actDtOutMinute   = String.valueOf(map.get("ACT_DT_OUT_MINUTE"));
			this.workTime   = String.valueOf(map.get("WORK_TIME"));
			this.actRemark   = String.valueOf(map.get("ACT_REMARK"));
			this.actSeq   =  String.valueOf(map.get("ACT_SEQ"));
		}
	}
}
