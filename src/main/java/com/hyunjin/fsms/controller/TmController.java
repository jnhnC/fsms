package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyunjin.fsms.controller.ExController.ExResponse;
import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.ExService;
import com.hyunjin.fsms.service.TmService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class TmController {

	private final CmService cmService;
	private final TmService tmService;
	private final ExService exService;

	@GetMapping("/tm")
	public String tm001(Model model, TmRequest tmRequest, HttpServletRequest request, HttpSession session) throws Exception {
		return "tm/tm001";
	}


	@GetMapping("/api/tm")
	public @ResponseBody List<TmResponse> tmList(TmRequest tmRequest, HttpSession session) throws Exception {

		// Parameter
		Map<String, Object> map = new HashMap<>();

		map.put("page", "TM");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("startDate", tmRequest.getStartDate());
		map.put("endDate", tmRequest.getEndDate());

		// DB
		//List<Map<String, Object>> teams = tmService.fspTm001S01(map);
		List<Map<String, Object>> sos = cmService.fspZSosS01(map);

		// DTO
		List<TmResponse> tmResponses = sos.stream().map(TmResponse::new).collect(toList());


		return tmResponses;
	}


	@GetMapping("/tm/{soNo}")
	public String tm002(Model model, @PathVariable("soNo") String soNo, TmRequest tmRequest) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("soNo", soNo);
		map.put("bpCd", tmRequest.getBpCd() == null ? "C1091" : tmRequest.getBpCd());
		map.put("updtUserId", tmRequest.getMajorCd() == null ? "F1022" : tmRequest.getMajorCd());
		map.put("majorCd", tmRequest.getMajorCd() == null ? "XS007" : tmRequest.getMajorCd());


		// DB
		List<Map<String, Object>> teamLeaders = tmService.fspTm002S04(map);
		Map<String, Object> soInfo = tmService.fspTm002S01(soNo);
		List<Map<String, Object>> products = tmService.fspTm002S02(map);
		int abilityYn = tmService.fspTm002S03(map);
		String updateResult = tmService.fspTm002U02(map);
		List<Map<String, Object>> exs = exService.fspEx002S02(map);

		// Response
		List<TlResponse> tlResponses = teamLeaders.stream().map(TlResponse::new).collect(toList());
		TmResponse tmResponse = new TmResponse(soInfo);
		List<PdResponse> pdResponses = products.stream().map(PdResponse::new).collect(toList());
		tmResponse.setResult(abilityYn);

		List<ExResponse> exResponses = exs.stream().map(ExResponse::new).collect(toList());


		model.addAttribute("teamLeaders", tlResponses);
		model.addAttribute("so", tmResponse);
		model.addAttribute("products", pdResponses);
		model.addAttribute("exs", exResponses);


		return "tm/tm002";
	}

	@PostMapping("/tm")
	public @ResponseBody RsResponse saveTeamLeader(TmRequest tmRequest) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("soNo", tmRequest.getSoNo());
		map.put("empNo", tmRequest.getEmpNo());
		map.put("poBpCd", tmRequest.getBpCd());
		map.put("updtUserId", tmRequest.getUpdtUserId());


		Map<String, Object> resultMap= tmService.fspTm002U01(map);
		RsResponse rsResponse = new RsResponse(resultMap);
		return rsResponse;
	}


	@Data
	static class TmRequest {
		private String bpCd;
		private String majorCd;
		private String startDate;
		private String endDate;
		private String soNo;
		private String empNo;
		private String updtUserId;
	}

	@Data
	@ToString
	static public class TmResponse {

		private String soNo;	     //주문번호
		private String orderDt1;	//주문일시
		private String orderDt;
		private String ownNm;		//대상자
		private String poStatus;
		private String poStatusNm;
		private String dlvyNm;		//장례식장
		private String poBpCd;
		private String soType;
		private String mBoss;
		private String bossNm;
		private String cfmFlag;
		private String mName;
		private String hsNm;		//사유
		private int result;
		private String empNo;
		private String bpCd;
		private String updtUserId;

		public TmResponse(Map<String,Object> map) {
			soNo = (String) map.get("SO_NO");
			orderDt   = (String) map.get("ORDER_DT");
			ownNm     = (String) map.get("OWN_NM");
			poStatus  = (String) map.get("PO_STATUS");
			poStatusNm= (String) map.get("PO_STATUS_NM");
			dlvyNm    = (String) map.get("DLVY_NM");
			poBpCd    = (String) map.get("PO_BP_CD");
			soType    = (String) map.get("SO_TYPE");
			mBoss     = (String) map.get("M_BOSS");
			bossNm     = (String) map.get("M_BOSS_NM");
			cfmFlag   = (String) map.get("CFM_FLAG");
			mName  = (String) map.get("M_NAME");
			hsNm   = (String) map.get("HS_NM");
			empNo   = (String) map.get("EMP_NO");
			bpCd   = (String) map.get("BP_CD");
			updtUserId   = (String) map.get("UPDT_USER_ID");
			/* result = (int) map.get("RESULT"); */
		}
	}
	@Data
	@ToString
	static public class PdResponse {

		private String itemNm;
		private int soQty;

		public PdResponse(Map<String,Object> map) {

			this.itemNm = (String) map.get("ITEM_NM");
			this.soQty = (int)Double.parseDouble(String.valueOf(map.get("SO_QTY")));
		}
	}

	@Data
	@ToString
	static public class TlResponse {

		private String empNo;
		private String empNm;
		private String subNm;
		private String roleNm;
		private String bpCd;
		private String updtUserId;


		public TlResponse(Map<String,Object> map) {
			this.empNo = (String) map.get("EMP_NO");
			this.empNm = (String) map.get("EMP_NM");
			this.subNm = (String) map.get("SUB_NM");
			this.roleNm = (String) map.get("ROLE_NM");
			this.bpCd = (String) map.get("PO_BP_CD");
			this.updtUserId = (String) map.get("UPDT_USER_ID");
		}
	}

	@Data
	@ToString
	static public class RsResponse {

		private String msgCd;
		private String msgText;

		public RsResponse(Map<String,Object> map) {
			this.msgCd = (String) map.get("MSG_CD");
			this.msgText = (String) map.get("MSG_TEXT");
		}
	}

}
