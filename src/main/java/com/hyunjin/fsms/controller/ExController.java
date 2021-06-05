package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyunjin.fsms.controller.PsController.SoResponse;
import com.hyunjin.fsms.controller.TmController.TmRequest;
import com.hyunjin.fsms.controller.TmController.TmResponse;
import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.ExService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class ExController {

	private final CmService cmService;
	private final ExService exService;

	@GetMapping("/ex")
	public String ex001(Model model, ExRequest exRequest,  HttpSession session) throws Exception {

		return "ex/ex001";
	}

	@GetMapping("/api/ex")
	public @ResponseBody List<SoResponse> tmList(ExRequest exRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "EX");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("startDate", exRequest.getStartDate());
		map.put("endDate", exRequest.getEndDate() );


//		List<Map<String,Object>> soInfos = exService.fspEx001S01(map);
		List<Map<String,Object>> sos = cmService.fspZSosS02(map);


		List<SoResponse> soResponses = sos.stream().map(SoResponse::new).collect(toList());

		return soResponses;
	}



	@PostMapping("/ex/1")
	public String ex002(Model model, ExRequest exRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soNo", exRequest.getSoNo());
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("majorCd", session.getAttribute("majorCd") );

		//select @so_no = N'202104090003', @updt_user_id = N'f1022', @po_bp_cd = N'c1091'
		Map<String, Object> so = cmService.fspZSoS01(map);
		/* Map<String, Object> soInfo = exService.fspEx002S01(exRequest.getSoNo()); */
		List<Map<String, Object>> expos = exService.fspEx002S02(map);


		System.out.println(expos);

		//List<Map<String, Object>> expos = exService.fspEx002S0(map);


		SoResponse toMap = new SoResponse(so);
		List<ExResponse> toMaps = expos.stream().map(ExResponse::new).collect(toList());


		model.addAttribute("so" ,toMap);
		model.addAttribute("expos" ,toMaps);



		return "ex/ex002";
	}


	@PostMapping("/ex")
	public @ResponseBody RsResponse SaveEx(Model model, ExRequest exRequest, HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();


		String  now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		map.put("giDt"	, now );

		map.put("soNo", exRequest.getSoNo() );
		map.put("empNo", session.getAttribute("empNo") );


		int cnt = Integer.parseInt(exRequest.getCheckCount());
		Map<String,Object> baEnrResult = new HashMap<>();
		Map<String,Object> uspIssueResult = new HashMap<>();
		Map<String,Object> uspBacodeResult = new HashMap<>();
		Map<String,Object> stateUpdate = new HashMap<>();

		for (int i = 0; i < cnt; i++) {
			map.put("itemClass"	,  	exRequest.getItemClass()[i].equals("null")? "" :  exRequest.getItemClass()[i] );
			map.put("plantCd"	, 	exRequest.getPlantCd()[i].equals("null")? "" :  	exRequest.getPlantCd()[i]);
			map.put("movType"	,	exRequest.getMovType()[i].equals("null")? "" :  	exRequest.getMovType()[i]);
			map.put("soSeq"		, 	exRequest.getSoSeq()[i]	== null ? "" :  	exRequest.getSoSeq()[i]);
			map.put("SO_TYPE"	,	exRequest.getSoType()[i].equals("null")? "" :  	exRequest.getSoType()[i]);
			map.put("itemCd"	, 	exRequest.getItemCd()[i].equals("null")? "" :  	exRequest.getItemCd()[i]);
			map.put("giQty"		,	exRequest.getGiQty()[i].equals("null")? "" :  		exRequest.getGiQty()[i]);
			map.put("slCd"		, 	exRequest.getSlCd()[i].equals("null")? "" :  		exRequest.getSlCd()[i]);
			map.put("fmBarcode"	, 	exRequest.getFmBarcode()[i].equals("null")? "" :  	exRequest.getFmBarcode()[i]);
			map.put("dnSeq"		, 	exRequest.getDnSeq()[i].equals("null")? "" :  	exRequest.getDnSeq()[i]);
			map.put("saItemFlag", 	exRequest.getSaItemFlag()[i].equals("null")? "" :  	exRequest.getSaItemFlag()[i]);

			if(exRequest.getItemClass()[i].equals("B")) {
				map.put("type"	,  "ID" );
			}else {
				map.put("type"	,  "DO" );
			}

			System.out.println(map);

			//1. 바코드 저장하기
			if (!map.get("fmBarcode").equals("")) {
				baEnrResult = exService.fspEx002U01(map);
			}

			System.out.println("baEnrResult:"+baEnrResult);
			System.out.println("exRequest.getSoSeq()[i]:"+exRequest.getSoSeq()[i]);

			//2. USP_SD_ISSUE_BY_SP 프로시저 진행
			uspIssueResult = exService.fspEx002U02(map);
			/*
			 * if (exRequest.getSoSeq()[i].equals("1")) { //용품일때는 바코드가 있어하고 인력은 필요없음 if
			 * (!map.get("fmBarcode").equals("")) { uspIssueResult =
			 * exService.fspEx002U02(map); } } else { uspIssueResult =
			 * exService.fspEx002U02(map); }
			 */

			String dnNo = (String) uspIssueResult.get("DN_NO");

			System.out.println(dnNo);
			map.put("dnNo", dnNo);


			//3. USP_BACODE_S_SO_PROCESS_KO843 프로시저 진행
			if (dnNo != null && !dnNo.equals("")) {
				System.out.println("USP_BACODE_S_SO_PROCESS_KO843");
				uspBacodeResult = exService.fspEx002U03(map);
			}

			System.out.println(uspBacodeResult);
			String msg_cd = (String) uspBacodeResult.get("MSG_CD");

			//4. S_DN_DTL_KO843 INSERT/UPDATE
			if (msg_cd == null || msg_cd.equals("")) {
				System.out.println("S_DN_DTL_KO843 INSERT/UPDATE");
				stateUpdate = exService.fspEx002U04(map);
			}

		}

		RsResponse rsResponse = new RsResponse(stateUpdate);

		return rsResponse;
	}



	@Data
	static class ExRequest {
		private String bpCd;
		private String majorCd;
		private String startDate;
		private String endDate;
		private String soNo;
		private String empNo;
		private String updtUserId;
		private String itemNm;


		private String checkCount;
		private String[] itemClass;
		private String[] plantCd;
		private String[] giDt;
		private String[] movType;
		private String[] soSeq;
		private String[] itemCd;
		private String[] giQty;
		private String[] slCd;
		private String[] fmBarcode;
		private String[] dnSeq;
		private String[] saItemFlag;
		private String[] soType;

	}

	@Data
	@ToString
	static public class ExResponse {
		private String 	itemNm		;	//품목명
		private int 	soQty		;	//품목수
		private String 	fmBarcode	;	//바코드
		private String 	fdDt		;	//출고일자
		private String 	itemCd		;	//
		private String 	dnNo		;	//
		private String 	dnSeq		;	//
		private String 	itemClass	;	//분류
		private String 	plantCd		;
		private String 	giDt		;
		private String 	movType		;
		private String 	soSeq		;
		private int 	giQty		;
		private String 	slCd		;
		private String 	saItemFlag	;
		private String 	soType	;
		private String poStatus;



		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		public ExResponse(Map<String,Object> map) {
			this.itemNm   = (String) map.get("ITEM_NM");
			this.soQty =  (int)Double.parseDouble(String.valueOf(map.get("SO_QTY"))) ;
			this.fmBarcode = (String) map.get("FM_BARCODE");
			this.fdDt = String.valueOf(map.get("F_DLVY_DT"));
			this.dnNo = String.valueOf(map.get("DN_NO"));
			this.dnSeq = String.valueOf(map.get("DN_SEQ")) ;

			this.itemClass = (String) map.get("ITEM_CLASS");
			this.soSeq =  String.valueOf(map.get("SO_SEQ"));
			this.itemCd = (String) map.get("ITEM_CD");
			this.slCd = (String) map.get("SL_CD");

			this.plantCd = (String) map.get("PLANT_CD");
			this.movType = (String) map.get("MOV_TYPE");
			this.giQty = (int)Double.parseDouble(String.valueOf(map.get("SO_QTY"))) ;
			this.saItemFlag = (String) map.get("SA_ITEM_FLAG") ;
			this.soType = (String) map.get("SO_TYPE") ;
			this.poStatus   = (String) map.get("PO_STATUS");


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

}
