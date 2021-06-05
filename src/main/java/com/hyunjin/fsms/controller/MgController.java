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
import com.hyunjin.fsms.controller.CrController.RsResponse;
import com.hyunjin.fsms.controller.PsController.SoResponse;
import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.FdService;
import com.hyunjin.fsms.service.MgService;
import com.hyunjin.fsms.service.PsService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class MgController {

	private final CmService cmService;
	private final MgService mgService;
	private final PsService psService;

	@GetMapping("/mg")
	public String cr001() throws Exception {
		return "mg/mg001";
	}


	@GetMapping("/api/mg")
	public @ResponseBody List<SoResponse> psList(SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "MG");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", soRequest.getStartDate());
		map.put("endDate", soRequest.getEndDate() );

		System.out.println(map);
		List<Map<String,Object>> sos = cmService.fspZSosS01(map);
		for(Map<String,Object> so :  sos) {
			map.put("soNo", (String)so.get("SO_NO"));
			/* System.out.println(map); */
			Map<String, Object> adSupCd  = psService.fspPs002S09(map);
			if(adSupCd !=null) {
				so.put("ITEM_ACCT", adSupCd.get("ITEM_ACCT"));
			}else {
				so.put("ITEM_ACCT", "");
			}
		}
		/* System.out.println(sos); */
		List<SoResponse> soResponses = sos.stream().map(SoResponse::new).collect(toList());

		return soResponses;
	}


	@PostMapping("/mg/1")
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

		 //so_no
		Map<String, Object> so = cmService.fspZSoS01(map);

		so.put("HS_TYPE",soRequest.getHsType());

		Map<String,Object> amt = cmService.fspZAmtS01(map);

		List<Map<String, Object>> wss = mgService.fspMg002S01(map);
		List<Map<String, Object>> ats = mgService.fspMg002S02();
		List<Map<String, Object>> mgs = mgService.fspMg002S03();

		/*
		 * System.out.println("wss:"+wss); System.out.println("ats:"+ats);
		 * System.out.println("mgs:"+mgs);
		 */
		SoResponse soResponse = new SoResponse(so);
		List<WsResponse> wsResponses = wss.stream().map(WsResponse::new).collect(toList());
		List<MjResponse> atResponses = ats.stream().map(MjResponse::new).collect(toList());
		List<MgResponse> mgResponses = mgs.stream().map(MgResponse::new).collect(toList());
		AtResponse atResponse = new AtResponse(amt);


		model.addAttribute("so" ,soResponse);
		model.addAttribute("ats" ,atResponses);
		model.addAttribute("mgs" ,mgResponses);
		model.addAttribute("amt" ,atResponse);

		if(wss.size() != 0) model.addAttribute("wss" ,wsResponses);

		return "mg/mg002";
	}


	@PostMapping("/mg")
	public @ResponseBody RsResponse saveFd(SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("soNo", soRequest.getSoNo());
		map.put("empNo", session.getAttribute("empNo"));


		int cnt = Integer.parseInt(soRequest.getTrCount());


		List<Map<String, Object>> results = new ArrayList<>();

		for (int i = 0; i < cnt; i++) {


			String status = "";
			String actSeq = "";
			String actCd = "";
			String actType = "";
			String actDtIn = "";
			String actDtInHour = "";
			String actDtInMinute = "";
			String actDtOut = "";
			String actDtOutHour = "";
			String actDtOutMinute = "";
			String actRemark = "";


			if(soRequest.getStatus().length != 0) {
				status = soRequest.getStatus()[i].equals("null") ? "" : soRequest.getStatus()[i];
			}

			if(soRequest.getActSeq().length != 0) {
				actSeq= soRequest.getActSeq()[i].equals("null") ? "" : soRequest.getActSeq()[i];
			}

			if(soRequest.getActCd().length != 0) {
				actCd= soRequest.getActCd()[i].equals("null") ? "" : soRequest.getActCd()[i];
			}

			if(soRequest.getActType().length != 0) {
				actType= soRequest.getActType()[i].equals("null") ? "" : soRequest.getActType()[i];
			}

			if(soRequest.getActDtIn().length != 0) {
				actDtIn = soRequest.getActDtIn()[i].equals("null") ? "" : soRequest.getActDtIn()[i];
			}

			if(soRequest.getActDtInHour().length != 0) {
				actDtInHour = soRequest.getActDtInHour()[i].equals("null") ? "" : soRequest.getActDtInHour()[i];
			}

			if(soRequest.getActDtInMinute().length != 0) {
				actDtInMinute =soRequest.getActDtInMinute()[i].equals("null") ? "" : soRequest.getActDtInMinute()[i];
			}

			if(soRequest.getActDtOut().length != 0) {
				actDtOut = soRequest.getActDtOut()[i].equals("null") ? "" : soRequest.getActDtOut()[i];
			}


			if(soRequest.getActDtOutHour().length != 0) {
				actDtOutHour = soRequest.getActDtOutHour()[i].equals("null") ? "" : soRequest.getActDtOutHour()[i];
			}


			if(soRequest.getActDtOutMinute().length != 0) {
				actDtOutMinute = soRequest.getActDtOutMinute()[i].equals("null") ? "": soRequest.getActDtOutMinute()[i];
			}

			if(soRequest.getActRemark().length != 0) {
				actRemark = soRequest.getActRemark()[i].equals("null") ? "" : soRequest.getActRemark()[i];
			}


			map.put("status", status);
			map.put("actSeq", actSeq);
			map.put("actCd", actCd);
			map.put("actType", actType);
			map.put("actDtIn", actDtIn + " " + actDtInHour + ":" + actDtInMinute);
			map.put("actDtOut", actDtOut + " " + actDtOutHour + ":" + actDtOutMinute);
			map.put("actRemark", actRemark);

			System.out.println(map);

			 Map<String, Object> result = mgService.fspMg002U01(map);
			System.out.println(result);
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

		private String actCd[];
		private String actType[];
		private String actSeq[];
		private String actDtIn[];
		private String actDtInHour[];
		private String actDtInMinute[];
		private String actDtOut[];
		private String actDtOutHour[];
		private String actDtOutMinute[];
		private String actRemark[];
		private String status[];



	}



	@Data
	@ToString
	static public class WsResponse {
		private String actDtIn;
		private String actDtInHour;
		private String actDtInMinute;
		private String actDtOut;
		private String actDtOutHour;
		private String actDtOutMinute;
		private String workTime;
		private String actRemark;
		private String actSeq;
		private String actCd;
		private String actType;
		private String actTypeNm;
		private String actNm;


		public WsResponse(Map<String,Object> map) {
			this.actDtIn 	=	String.valueOf(map.get("ACT_DT_IN"));
			this.actDtInHour   = String.valueOf(map.get("ACT_DT_IN_HOUR"));
			this.actDtInMinute   = 	String.valueOf(map.get("ACT_DT_IN_MINUTE"));
			this.actDtOut 	=	String.valueOf(map.get("ACT_DT_OUT"));
			this.actDtOutHour   = String.valueOf(map.get("ACT_DT_OUT_HOUR"));
			this.actDtOutMinute   = String.valueOf(map.get("ACT_DT_OUT_MINUTE"));
			this.workTime   = String.valueOf(map.get("WORK_TIME"));
			this.actRemark   = String.valueOf(map.get("ACT_REMARK"));
			this.actSeq   =  String.valueOf(map.get("ACT_SEQ"));
			this.actCd   =  String.valueOf(map.get("ACT_CD"));
			this.actType   =  String.valueOf(map.get("ACT_TYPE"));
			this.actTypeNm   =  String.valueOf(map.get("ACT_TYPE_NM"));
			this.actNm   =  String.valueOf(map.get("ACT_NM"));
		}
	}

	@Data
	@ToString
	static public class MjResponse {
		private String code;
		private String codeName;


		public MjResponse(Map<String,Object> map) {
			this.code 	=	String.valueOf(map.get("CODE"));
			this.codeName 	=	String.valueOf(map.get("CODE_NAME"));
		}
	}

	@Data
	@ToString
	static public class MgResponse {
		private String empNo;
		private String empNm;
		private String subNm;
		private String roleNm;

		public MgResponse(Map<String,Object> map) {
			this.empNo   = (String) map.get("EMP_NO");
			this.empNm   = (String) map.get("EMP_NM");
			this.subNm   = (String) map.get("SUB_NM");
			this.roleNm   = (String) map.get("ROLE_NM");
		}
	}
}
