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

import com.hyunjin.fsms.controller.CmController.AtResponse;
import com.hyunjin.fsms.controller.CmController.BmResponse;
import com.hyunjin.fsms.controller.CmController.ImgResponse;
import com.hyunjin.fsms.controller.CrController.CrResponse;
import com.hyunjin.fsms.controller.CrController.NpResponse;
import com.hyunjin.fsms.controller.CrController.RsResponse;
import com.hyunjin.fsms.controller.MgController.MjResponse;
import com.hyunjin.fsms.controller.MgController.WsResponse;
import com.hyunjin.fsms.controller.PsController.SoResponse;
import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.CrService;
import com.hyunjin.fsms.service.FcService;
import com.hyunjin.fsms.service.MgService;
import com.hyunjin.fsms.service.PsService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class FcController {

	private final CmService cmService;
	private final PsService psService;
	private final CrService crService;
	private final MgService mgService;
	private final FcService fcService;

	@GetMapping("/fc")
	public String fc001() throws Exception {
		return "fc/fc001";
	}


	@GetMapping("/api/fc")
	public @ResponseBody List<SoResponse> fcList(FcRequest fcRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "FC");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", fcRequest.getStartDate());
		map.put("endDate", fcRequest.getEndDate() );

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


	@PostMapping("/fc/1")
	public String cp002(Model model,  FcRequest fcRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("majorCd", session.getAttribute("majorCd") );
		map.put("soNo", fcRequest.getSoNo() );
		map.put("poBpCd", fcRequest.getPoBpCd() );
		map.put("hsType", fcRequest.getHsType() );
		map.put("hsCode", fcRequest.getHsCode() );
		map.put("orderDt1", fcRequest.getOrderDt1() );
		map.put("adType", fcRequest.getAdType() );
		map.put("itemCd", fcRequest.getAdPackItem() );
		map.put("soldToParty", fcRequest.getSoldToParty() );


		System.out.println(map);
		Map<String, Object> so = cmService.fspZSoS01(map);
		List<Map<String, Object>> pds= new ArrayList<>();
		if(fcRequest.getAdType().equals("1")) {
			pds = psService.fspPs002S05(map);
		}else {
			pds = psService.fspPs002S06(map);
		}

		Map<String,Object> amt = cmService.fspZAmtS01(map);

		Map<String, Object> fc = fcService.fspFc001S01(map);
		/*
		 * if(fcRequest.getAdType().equals("1")) { pds = psService.fspPs002S05(map);
		 * }else { pds = psService.fspPs002S06(map); }
		 */
		 Map<String, Object> cr = crService.fspCr002S01(map);
		 List<Map<String, Object>> wss = mgService.fspMg002S01(map);
		 List<Map<String, Object>> ats = mgService.fspMg002S02();
		 List<Map<String, Object>> nps = crService.fspCr002S03(map);

		 map.put("bMajorCd", "XS005" );
		 List<Map<String, Object>> xs005s = cmService.fspZbminorS01(map);
		 List<Map<String, Object>> imgs = cmService.fspZimgS01(map);


		SoResponse soResponse = new SoResponse(so);
		List<WsResponse> wsResponses = wss.stream().map(WsResponse::new).collect(toList());
		List<MjResponse> atResponses = ats.stream().map(MjResponse::new).collect(toList());
		List<CsResponse> csResponses = pds.stream().map(CsResponse::new).collect(toList());
		CrResponse crResponse = new CrResponse(cr);
		List<NpResponse> npResponses = nps.stream().map(NpResponse::new).collect(toList());
		AtResponse atResponse = new AtResponse(amt);
		List<BmResponse> bmResponses = xs005s.stream().map(BmResponse::new).collect(toList());
		List<ImgResponse> imgResponses = imgs.stream().map(ImgResponse::new).collect(toList());


		if(fc != null ) {
			FcResponse fcResponse = new FcResponse(fc);
			model.addAttribute("fc" ,fcResponse);
		}

		model.addAttribute("so" ,soResponse);
		model.addAttribute("pds" ,csResponses);
		model.addAttribute("cr" ,crResponse);
		model.addAttribute("nps" ,npResponses);
		model.addAttribute("ats" ,atResponses);
		model.addAttribute("wss" ,wsResponses);
		model.addAttribute("amt" ,atResponse);
		model.addAttribute("xs005s" ,bmResponses);
		model.addAttribute("imgs" ,imgResponses);


		return "fc/fc002";
	}




	@PostMapping("/fc")
	public @ResponseBody RsResponse saveFc(FcRequest fcRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soNo", 		fcRequest.getSoNo() );
		map.put("empNo", 		session.getAttribute("empNo") );
		map.put("chRemark", 	"" );
		map.put("chSign", 	"Y" );
		map.put("dt", fcRequest.getDt()+" "+fcRequest.getDtH()+":"+fcRequest.getDtM() );

		System.out.println(map);
		Map<String,Object> result = fcService.fspFc002U01(map);

		System.out.println(result);
		RsResponse response = new RsResponse(result);
		return response;
	}




	@Data
	static class FcRequest {
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
		private String adType;
		private String adPackItem;
		private String soldToParty;
		private String infoAgreeFinal;
		private String infoAgreeFinalSign;
		private String infoAgreeDt2;
		private String dt;
		private String dtH;
		private String dtM;

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
	static public class FcResponse {
		private String soNo;
		private String chGubun;
		private String chSign;
		private String chDt;
		private String chDtH;
		private String chDtM;
		private String chId;
		private String chRemark;


		public FcResponse(Map<String,Object> map) {
			this.soNo = (String) map.get("SO_NO");
			this.chGubun = (String) map.get("CH_GUBUN");
			this.chSign = (String) map.get("CH_SIGN");
			this.chDt = String.valueOf(map.get("CH_DT"));
			this.chDtH = String.valueOf(map.get("CH_DT_H"));
			this.chDtM = String.valueOf(map.get("CH_DT_M"));
			this.chId = (String) map.get("CH_ID");
			this.chRemark = (String) map.get("CH_REMARK");
		}
	}

	@Data
	@ToString
	static public class Result {
		private String sign;


		public Result(String sign) {
			this.sign = sign;
		}
	}



}
