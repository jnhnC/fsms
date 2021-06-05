package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyunjin.fsms.controller.CmController.PtnResponse;
import com.hyunjin.fsms.controller.PsController.RsResponse;
import com.hyunjin.fsms.controller.PsController.SoResponse;
import com.hyunjin.fsms.service.CmService;
import com.hyunjin.fsms.service.CrService;
import com.hyunjin.fsms.service.PsService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class CrController {

	private final CmService cmService;
	private final PsService psService;
	private final CrService crService;

	@GetMapping("/cr")
	public String cr001() throws Exception {
		return "cr/cr001";
	}


	@GetMapping("/api/cr")
	public @ResponseBody List<SoResponse> psList(CrRequest crRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", "CR");
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", crRequest.getStartDate());
		map.put("endDate", crRequest.getEndDate() );

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


	@PostMapping("/cr/1")
	public String cr002(Model model,  CrRequest crRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo"));
		map.put("majorCd", session.getAttribute("majorCd") );
		map.put("soNo", crRequest.getSoNo() );
		map.put("itemCd", crRequest.getItemCd() );
		map.put("hsType", crRequest.getHsType() );
		map.put("hsCode", crRequest.getHsCode() );
		map.put("orderDt1", crRequest.getOrderDt1() );
		map.put("startDate", crRequest.getStartDate() );
		map.put("endDate", crRequest.getEndDate() );


		List<Map<String, Object>>  pts = cmService.fspZptnS01();

		List<PtnResponse> imgResponses = pts.stream().map(PtnResponse::new).collect(toList());

		 //so_no
		Map<String, Object> so = cmService.fspZSoS01(map);
	    Map<String, Object> cr = crService.fspCr002S01(map);

	    List<Map<String, Object>> tls = crService.fspCr002S02(map);
	    List<Map<String, Object>> nps = crService.fspCr002S03(map);

	    System.out.println("cr:"+cr);

		SoResponse soResponse = new SoResponse(so);
		CrResponse crResponse = new CrResponse(cr);
		List<TlResponse> tlResponses = tls.stream().map(TlResponse::new).collect(toList());
		List<NpResponse> npResponses = nps.stream().map(NpResponse::new).collect(toList());
		model.addAttribute("pts" ,imgResponses);
		model.addAttribute("so" ,soResponse);
		model.addAttribute("cr" ,crResponse);
		model.addAttribute("tls" ,tlResponses);
		model.addAttribute("nps" ,npResponses);


		return "cr/cr002";
	}

	@PostMapping("/cr")
	public @ResponseBody RsResponse saveCr(CrRequest crRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soNo", 		crRequest.getSoNo() );
		map.put("empNo", 		session.getAttribute("empNo") );
		map.put("mName", 		crRequest.getMName()  );
		map.put("mMourner", 	crRequest.getMMourner() );
		map.put("mRoomYn",	 	crRequest.getMRoomYn() );
		map.put("mRoomNo",	 	crRequest.getMRoomNo() );
		map.put("adItemCd", 	crRequest.getAdItemCd() );
		map.put("adChItem", 	crRequest.getAdChItem() );
		map.put("noPkgCd", 		crRequest.getNoPkgCd() );

		map.put("mDt1", 		crRequest.getDt1()+" "+crRequest.getDt1H()+":"+crRequest.getDt1M() );
		map.put("mDt2", 		crRequest.getDt2()+" "+crRequest.getDt2H()+":"+crRequest.getDt2M() );
		map.put("mDt3", 		crRequest.getDt3()+" "+crRequest.getDt3H()+":"+crRequest.getDt3M() );

		map.put("adBsDt", 		crRequest.getAdBsDt()+" "+crRequest.getAdBsDtH()+":"+crRequest.getAdBsDtM() );
		map.put("adYpDt", 		crRequest.getAdYpDt()+" "+crRequest.getAdYpDtH()+":"+crRequest.getAdYpDtM() );
		map.put("adGjDt", 		crRequest.getAdGjDt()+" "+crRequest.getAdGjDtH()+":"+crRequest.getAdGjDtM() );

		map.put("mLoc1", 		crRequest.getMLoc1() );
		map.put("mLoc2", 		crRequest.getMLoc2() );
		map.put("mType1", 		crRequest.getMType1() );
		map.put("mManagerCd", 	crRequest.getMManagerCd() );


		if(String.valueOf(map.get("mDt1")).length() != 16) {
			map.put("mDt1","");
		}
		if(String.valueOf(map.get("mDt2")).length() != 16) {
			map.put("mDt2","");
		}
		if(String.valueOf(map.get("mDt3")).length() != 16) {
			map.put("mDt3","");
		}
		if(String.valueOf(map.get("adBsDt")).length() != 16) {
			map.put("adBsDt","");
		}
		if(String.valueOf(map.get("adYpDt")).length() != 16) {
			map.put("adYpDt","");
		}
		if(String.valueOf(map.get("adGjDt")).length() != 16) {
			map.put("adGjDt","");
		}


		Map<String,Object> result = crService.fspCr002U01(map);
		System.out.println(result);
		RsResponse response = new RsResponse(result);

		return response;
	}

	@Data
	static class CrRequest {
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

		private String mName;
		private String mMourner;
		private String mRoomYn;
		private String mRoomNo;
		private String mLoc1;
		private String mLoc2;
		private String mType1;
		private String mManagerCd;
		private String adItemCd;
		private String adChItem;
		private String noPkgCd;

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



	}

	/*
	 * @Data
	 *
	 * @ToString static public class SoResponse { private String soNo; //주문번호
	 * private String orderDt; private String orderDt1; private String bpNm; private
	 * String poStatusNm; private String ownNm; //대상자 private String dlvyNm; //장례식장
	 * private String hsNm; //사유 private String adNm; //상담결과 private String bpCd;
	 * private String poBpCd; private String itemCd; private String hsType; private
	 * String hsCode;
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
	 * map.get("HS_TYPE"); this.hsCode = (String) map.get("HS_CD"); } }
	 */
	@Data
	@ToString
	static public class CrResponse {
		private String roomYn;
		private String room;
		private String name;
		private String adMemo;
		private String dlvyCd;
		private String dlvyType;
		private String mourner;
		private String loc1;
		private String loc2;
		private String type;
		private String managerNm;
		private String managerCd;
		private String noPkgCd;
		private String noPkgNm;

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
			this.roomYn = (String) map.get("M_ROOM_YN");
			this.room = (String) map.get("M_ROOM_NO");
			this.name = (String) map.get("M_NAME");
			this.adMemo = (String) map.get("AD_MEMO");
			this.dlvyCd = (String) map.get("DLVY_CD");
			this.dlvyType = (String) map.get("DLVY_TYPE");
			this.mourner = (String) map.get("M_MOURNER");
			this.loc1 = (String) map.get("M_LOC1");
			this.loc2 = (String) map.get("M_LOC2");
			this.type = (String) map.get("M_TYPE1");
			this.managerNm = (String) map.get("M_MANAGER_NM");
			this.managerCd = (String) map.get("M_MANAGER_CD");
			this.noPkgCd = (String) map.get("NO_PKG_CD");
			this.noPkgNm = (String) map.get("NO_PKG_NM");

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


	@Data
	@ToString
	static public class TlResponse {
		private String empNo;
		private String empNm;
		private String subNm;
		private String roleNm;

		public TlResponse(Map<String,Object> map) {
			this.empNo   = (String) map.get("EMP_NO");
			this.empNm   = (String) map.get("EMP_NM");
			this.subNm   = (String) map.get("SUB_NM");
			this.roleNm   = (String) map.get("ROLE_NM");
		}
	}

	@Data
	@ToString
	static public class NpResponse {
		private String code;
		private String codeName;

		public NpResponse(Map<String,Object> map) {
			this.code   = (String) map.get("CODE");
			this.codeName   = (String) map.get("CODE_NAME");
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
