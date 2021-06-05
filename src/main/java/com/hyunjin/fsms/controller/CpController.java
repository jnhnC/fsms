package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hyunjin.fsms.controller.CmController.AtResponse;
import com.hyunjin.fsms.controller.CmController.PtnResponse;
import com.hyunjin.fsms.controller.CrController.CrResponse;
import com.hyunjin.fsms.controller.CrController.NpResponse;
import com.hyunjin.fsms.controller.CrController.RsResponse;
import com.hyunjin.fsms.controller.PsController.SoResponse;
import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.CpService;
import com.hyunjin.fsms.service.CrService;
import com.hyunjin.fsms.service.PsService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;




@Controller
@RequiredArgsConstructor
public class CpController {

	private final CmService cmService;
	private final PsService psService;
	private final CrService crService;
	private final CpService cpService;

	@GetMapping("/cp")
	public String cp001() throws Exception {
		return "cp/cp001";
	}


	@GetMapping("/api/cp")
	public @ResponseBody List<SoResponse> cpList(CpRequest cpRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "CP");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", cpRequest.getStartDate());
		map.put("endDate", cpRequest.getEndDate() );

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


	@PostMapping("/cp/1")
	public String cp002(Model model,  CpRequest cpRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("majorCd", session.getAttribute("majorCd") );
		map.put("soNo", cpRequest.getSoNo() );
		map.put("poBpCd", cpRequest.getPoBpCd() );
		map.put("adType", cpRequest.getAdType() );
		map.put("hsType", cpRequest.getHsType() );
		map.put("hsCode", cpRequest.getHsCode() );
		map.put("orderDt1", cpRequest.getOrderDt1() );
		map.put("adType", cpRequest.getAdType() );
		map.put("soldToParty", cpRequest.getSoldToParty() );
		map.put("itemCd", cpRequest.getAdPackItem());



		List<Map<String, Object>>  pts = cmService.fspZptnS01();

		Map<String, Object> so = cmService.fspZSoS01(map);

		String sign = cpService.fspCp002S01(map);
		Result result2 = new Result(sign);

		List<Map<String, Object>> pds= new ArrayList<>();
		if(cpRequest.getAdType().equals("1")) {
			pds = psService.fspPs002S05(map);
		}else {
			pds = psService.fspPs002S06(map);
		}

		Map<String,Object> amt = cmService.fspZAmtS01(map);
		Map<String, Object> cr = crService.fspCr002S01(map);
		List<Map<String, Object>> nps = crService.fspCr002S03(map);

		List<Map<String, Object>> pas = cmService.fspZpayS01(map);

		List<PtnResponse> imgResponses = pts.stream().map(PtnResponse::new).collect(toList());
		SoResponse soResponse = new SoResponse(so);
		List<CsResponse> csResponses = pds.stream().map(CsResponse::new).collect(toList());
		CrResponse crResponse = new CrResponse(cr);
		List<NpResponse> npResponses = nps.stream().map(NpResponse::new).collect(toList());
		List<PaResponse> paResponses = pas.stream().map(PaResponse::new).collect(toList());
		AtResponse atResponse = new AtResponse(amt);

		model.addAttribute("pts" ,imgResponses);
		model.addAttribute("so" ,soResponse);
		model.addAttribute("sign" ,result2);
		model.addAttribute("pds" ,csResponses);
		model.addAttribute("cr" ,crResponse);
		model.addAttribute("nps" ,npResponses);
		model.addAttribute("pas" ,paResponses);
		model.addAttribute("amt" ,atResponse);

		System.out.println(pts);
		return "cp/cp002";
	}

	@PostMapping("/cp/sign")
	public  @ResponseBody Result saveSign(Model model, HttpSession session,
					@RequestParam(value="soNo", required=true) String soNo,
					@RequestParam(value="file", required=true) MultipartFile[] file,
					@RequestParam(value="infoAgreeFinal", required=true) String infoAgreeFinal) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soNo", 		soNo );
		map.put("infoAgreeFinal", infoAgreeFinal );
		map.put("infoAgreeFinalSign", file[0].getBytes() );


		System.out.println("map:"+map);

		Map<String,Object> result = cpService.fspCp002U01(map);

		System.out.println(result);
		RsResponse response = new RsResponse(result);

//		Map<String, Object> so = cmService.fspZSoS01(map);

		//Map<String, Object> so = cpService.fspZSoS01(map);
		String so = cpService.fspCp002S01(map);
		Result result2 = new Result(so);
		return result2;
	}



	@PostMapping("/cp/payAt")
	public  @ResponseBody  Map<String, Object> payAt(Model model,  CpRequest cpRequest,  HttpSession session) throws Exception {


		String url = "https://www.kkokjee.com/openapi/v1/partner/payment/cardpay.json";
		String access_token = "8087caf69c5058260b514cb8e31511442cb4fa6576ec4cb2120ad7ad43ccf9f9";
		String store_screen_name = "111111";
		String employee_screen_name = "111111";
		String card_no = cpRequest.getCardNo1()+cpRequest.getCardNo2()+cpRequest.getCardNo3()+cpRequest.getCardNo4();
		String card_date = cpRequest.getCardYY() + cpRequest.getCardMM();
		String amount = cpRequest.getAmount().replaceAll(",", "");
		String tax = "0";
		String fee = "0";
		String installment = cpRequest.getInstallment();
		String comment = "test";


		String urlAndParam= url+"?"+
							"access_token="+access_token+"&"+
							"store_screen_name="+store_screen_name+"&"+
							"employee_screen_name="+employee_screen_name+"&"+
							"card_no="+card_no+"&"+
							"card_date="+card_date+"&"+
							"amount="+amount+"&"+
							"tax="+tax+"&"+
							"fee="+fee+"&"+
							"installment="+installment+"&"+
							"comment="+comment+"&";

		System.out.println(urlAndParam);
		JSONObject json = readJsonFromUrl(urlAndParam);
	    System.out.println(json.toString());

	    Map<String, Object> map = new HashMap<>();
	    Map<String, Object> data = new ObjectMapper().readValue(json.get("data").toString(), Map.class);
	    Map<String, Object> employee = (Map<String, Object>) data.get("employee") ;

		map.put("soNo", cpRequest.getSoNo());
		map.put("seq", cpRequest.getSeq());
		map.put("empNo", session.getAttribute("empNo") );
		map.put("payType", "C1");
		map.put("billAmt", amount);
		map.put("cardAppNo", data.get("approval_no"));
		map.put("orderNo", data.get("order_no"));
		map.put("cancelOrderNo", "");
		map.put("payStatus", "1");
		map.put("uuid", data.get("uuid"));

		Map<String, Object> pay = cpService.fspCp002U02(map);

		System.out.println(pay);

	     Map<String, Object> result = new ObjectMapper().readValue(json.toString(), Map.class);

	    return result;
	}

	@PostMapping("/cp/payAtCancle")
	public  @ResponseBody  Map<String, Object> payAtCancle(Model model,  CpRequest cpRequest,  HttpSession session) throws Exception {


		String url = "https://www.kkokjee.com/openapi/v1/partner/payment/cardcancel.json";
		String access_token = "8087caf69c5058260b514cb8e31511442cb4fa6576ec4cb2120ad7ad43ccf9f9";
		String store_screen_name = "111111";
		String employee_screen_name = "111111";

		String orderNo = cpRequest.getOrderNo();
		String urlAndParam= url+"?"+
							"access_token="+access_token+"&"+
							"store_screen_name="+store_screen_name+"&"+
							"employee_screen_name="+employee_screen_name+"&"+
							"order_no="+orderNo;

		System.out.println(urlAndParam);
		JSONObject json = readJsonFromUrl(urlAndParam);
	    System.out.println(json.toString());

	    Map<String, Object> map = new HashMap<>();
	    Map<String, Object> data = new ObjectMapper().readValue(json.get("data").toString(), Map.class);
	    Map<String, Object> employee = (Map<String, Object>) data.get("employee") ;


		map.put("soNo", cpRequest.getSoNo());
		map.put("seq", cpRequest.getSeq());
		map.put("cancelOrderNo",data.get("order_no"));
		map.put("payStatus", "2");
		map.put("uuid", data.get("uuid"));

		  System.out.println(map);
		Map<String, Object> pay = cmService.fspZpayU01(map);



		System.out.println(pay);

	     Map<String, Object> result = new ObjectMapper().readValue(json.toString(), Map.class);

	    return result;
	}


	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}

	public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			JSONObject json = new JSONObject(jsonText);
			return json;
		} finally {
			is.close();
		}
	}


	@PostMapping("/cp/payList")
	public  @ResponseBody List<PaResponse> payList(Model model,  CpRequest cpRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soNo", cpRequest.getSoNo() );


		System.out.println(map);

		List<Map<String, Object>> pas = cmService.fspZpayS01(map);
		System.out.println(pas);
		List<PaResponse> paResponses = pas.stream().map(PaResponse::new).collect(toList());
		System.out.println(paResponses);

		return paResponses;
	}



	@Data
	static class CpRequest {
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
		private String amount;
		private String cardNo1;
		private String cardNo2;
		private String cardNo3;
		private String cardNo4;
		private String cardYY;
		private String cardMM;
		private String installment;
		private String seq;
		private String orderNo;


	}

	/*
	 * @Data
	 *
	 * @ToString static public class SoResponse { private String soNo; //주문번호
	 * private String orderDt; private String orderDt1; private String bpNm; private
	 * String poStatusNm; private String ownNm; //대상자 private String dlvyNm; //장례식장
	 * private String hsNm; //사유 private String adNm; //상담결과 private String bpCd;
	 * private String poBpCd; private String itemCd; private String hsType; private
	 * String hsCode; private String billToParty; private String adPackItem; private
	 * String soldToParty; private String adType; private String infoAgreeFinal;
	 * private String infoAgreeFinalSign; private String sign;
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
	 * map.get("AD_PACK_ITEM"); this.soldToParty = (String)
	 * map.get("SOLD_TO_PARTY"); this.adType = (String) map.get("AD_TYPE");
	 * this.infoAgreeFinal = (String) map.get("INFO_AGREE_FINAL");
	 * this.infoAgreeFinalSign = String.valueOf(map.get("INFO_AGREE_FINAL_SIGN"));
	 * this.sign = String.valueOf(map.get("SIGN")); } }
	 */

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
	static public class PaResponse {
		private String soNo;
		private String seq;
		private String payType;
		private int billAmt;
		private String cardAppNo;
		private String rcptMeth;
		private String paymentType;
		private String orderNo;
		private String cancelOrderNo;
		private String payStatus;
		private String uuid;
		private String insrtDt;


		public PaResponse(Map<String,Object> map) {
			soNo = (String) map.get("SO_NO");
			seq  = String.valueOf(map.get("SEQ"));
			payType = (String) map.get("PAY_TYPE");
			billAmt = (int)Double.parseDouble(String.valueOf(map.get("BILL_AMT")));
			cardAppNo = String.valueOf(map.get("CARD_APP_NO"));
			rcptMeth = (String) map.get("RCPT_METH");
			paymentType = (String) map.get("PAYMENT_TYPE");
			orderNo = String.valueOf(map.get("ORDER_NO"));
			cancelOrderNo = String.valueOf(map.get("CANCEL_ORDER_NO"));
			payStatus = (String) map.get("PAY_STATUS");
			uuid = (String) map.get("UUID");
			insrtDt = String.valueOf(map.get("INSRT_DT"));

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
