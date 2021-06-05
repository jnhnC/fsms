package com.hyunjin.fsms.controller;

import static java.util.stream.Collectors.toList;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hyunjin.fsms.controller.CrController.RsResponse;
import com.hyunjin.fsms.service.CmService;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Controller
@RequiredArgsConstructor
public class CmController {

	private final CmService cmService;



	@PostMapping("/login")
	public @ResponseBody LoginResponse login(SoRequest soRequest) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("id", soRequest.getId() );
		map.put("pw", soRequest.getPw() );

		System.out.println("map"+map);
		Map<String,Object> login = cmService.wspZzUserLogin(map);
		LoginResponse loginResponse = new LoginResponse(login);
		System.out.println(login);

		return loginResponse;
	}

	@GetMapping("/apk")
	public String apk() throws Exception {
		return "apk/apk";

	}



	@GetMapping("/api/so/1")
	public @ResponseBody SoResponse so(SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();
		map.put("soNo", soRequest.getSoNo() );

		System.out.println("map"+map);
		Map<String,Object> so = cmService.fspZSoS01(map);
		System.out.println(so);
		SoResponse soResponse = new SoResponse(so);

		return soResponse;
	}

	@GetMapping("/api/sos/1")
	public @ResponseBody List<SoResponse> sos(SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("page", soRequest.getPage());
		map.put("bpCd", session.getAttribute("bpCd"));
		map.put("empNo", session.getAttribute("empNo") );
		map.put("startDate", soRequest.getStartDate());
		map.put("endDate", soRequest.getEndDate() );

		System.out.println("map"+map);
		List<Map<String,Object>> sos = cmService.fspZSosS01(map);
		System.out.println(sos);
		List<SoResponse> soResponses = sos.stream().map(SoResponse::new).collect(toList());

		return soResponses;
	}

	@PostMapping("/api/amt")
	public @ResponseBody AtResponse amt(SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("itemCd", soRequest.getItemCd());
		map.put("soldToParty", soRequest.getSoldToParty() );
		map.put("hsType", soRequest.getHsType() );

		//#{soldToParty},#{hsType},#{itemCd})
		Map<String,Object> amt = cmService.fspZAmtS01(map);
		AtResponse atResponse = new AtResponse(amt);

		return atResponse;
	}

	@PostMapping("/api/bminor")
	public @ResponseBody List<BmResponse>  bminor(SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		map.put("majorCd", soRequest.getMajorCd());

		System.out.println("map"+map);
		List<Map<String, Object>> bminor = cmService.fspZbminorS01(map);
		System.out.println(bminor);
		List<BmResponse> bmResponse = bminor.stream().map(BmResponse::new).collect(toList());

		return bmResponse;
	}

	//단일파일 업로드
	@PostMapping("/picUpload")
	public Map<String, Object>  upload(@RequestParam("file") MultipartFile file, SoRequest soRequest, HttpSession session) throws Exception {
		String rootPath = FileSystemView.getFileSystemView().getHomeDirectory().toString();

	    Calendar cal = Calendar.getInstance();
		System.out.println(cal);


	    String filePath = "nui" + "\\" + "uploadFiles_fsms" + "\\"+ String.valueOf(cal.get(Calendar.YEAR))+ "\\" + file.getOriginalFilename();
	    System.out.println(filePath);


	    System.out.println( soRequest.getXs005());

	    Map<String, Object> map = new HashMap<>();
	    map.put("soNo", soRequest.getSoNo());
	    map.put("gubun", soRequest.getXs005());
	    map.put("empNo", session.getAttribute("empNo"));
	    map.put("programId", soRequest.getSoNo() );
	    map.put("filename", file.getOriginalFilename());
	    map.put("fileSize", file.getSize());
	    map.put("filePath", filePath);

	    System.out.println("pic:"+ map);

	    Map<String, Object> result = cmService.fspZimgI01(map);
	    System.out.println(result);
	    return result;
	}


	@GetMapping("/picDelete/{imageId}")
	public Map<String, Object> delete(@PathVariable("imageId") String imageId, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<>();
	    map.put("imageId", imageId);

	    Map<String, Object> result = cmService.fspZimgD01(map);
	    System.out.println(result);
	    return result;
	}


	@PostMapping("/pic")
	public  @ResponseBody List<ImgResponse> picList(SoRequest soRequest,  HttpSession session) throws Exception {
		Map<String,Object> map = new HashMap<>();

		map.put("soNo", soRequest.getSoNo() );

		System.out.println( soRequest.getSoNo() );

		List<Map<String, Object>> imgs = cmService.fspZimgS01(map);

		System.out.println(imgs);
		List<ImgResponse> imgResponses = imgs.stream().map(ImgResponse::new).collect(toList());
		return imgResponses;
	}


	@PostMapping("/mms")
	public  @ResponseBody RsResponse mms(SoRequest soRequest,  HttpSession session) throws Exception {
		Map<String,Object> map = new HashMap<>();

		String url =
				"상품조회 내용입니다"+
				"\n http://182.162.91.75:8080/fsms/tc/"+soRequest.getSoNo()+
				"\n감사합니다";

		map.put("hp", soRequest.getHp() );
		map.put("message", url );
		map.put("sndNum", soRequest.getSndNum() );
		map.put("mgNo", soRequest.getSoNo() );
		map.put("prgmId", soRequest.getPrgmId() );
		map.put("empNo", session.getAttribute("empNo") );

		System.out.println( map );

		Map<String, Object> result = cmService.fspZmmsI01(map);
		RsResponse response = new RsResponse(result);
		System.out.println(result);
		return response;
	}


	@GetMapping("/partner")
	public @ResponseBody List<PtnResponse> partner(SoRequest soRequest,  HttpSession session) throws Exception {

		Map<String,Object> map = new HashMap<>();

		List<Map<String, Object>>  pts = cmService.fspZptnS01();

		List<PtnResponse> imgResponses = pts.stream().map(PtnResponse::new).collect(toList());

		return imgResponses;
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
		private String page;
		private String soldToParty;
		private String hsType;
		private String itemCd;
		private String xs005;
		private String hp;
		private String prgmId;
		private String sndNum;
		private String id;
		private String pw;
		private String url;

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
		}
	}


	@Data
	@ToString
	static public class AtResponse {
		private String itemCd;
		private String itemNm;
		private int listPrice;
		private int discountAmt;


		public AtResponse(Map<String,Object> map) {
			this.itemCd = (String)map.get("ITEM_CD");
			this.itemNm = (String) map.get("ITEM_NM");
			this.listPrice = map.get("LIST_PRICE") == null ? '0' : (int)Double.parseDouble(String.valueOf(map.get("LIST_PRICE")));
			this.discountAmt = map.get("LIST_PRICE") == null ? '0' : (int)Double.parseDouble(String.valueOf(map.get("DISCOUNT_AMT")));
		}
	}

	@Data
	@ToString
	static public class BmResponse {
		private String minorCd;
		private String minorNm;


		public BmResponse(Map<String,Object> map) {
			this.minorCd = (String) map.get("MINOR_CD");
			this.minorNm = (String) map.get("MINOR_NM");
		}
	}

	@Data
	@ToString
	static public class ImgResponse {
		private String imageId;
		private String type;
		private String filePath;


		public ImgResponse(Map<String,Object> map) {
			this.imageId = (String) map.get("IMAGE_ID");
			this.type = (String) map.get("TYPE");
			this.filePath = (String) map.get("FILE_PATH");
		}
	}

	@Data
	@ToString
	static public class PtnResponse {
		private String bpCd;
		private String bpNm;


		public PtnResponse(Map<String,Object> map) {
			this.bpCd = (String) map.get("BP_CD");
			this.bpNm = (String) map.get("BP_NM");

		}
	}

	@Data
	@ToString
	static public class ADDResponse {
		private String invQty;
		private String invQty2;
		private String itemCd;
		private String itemNm;


		public ADDResponse(Map<String,Object> map) {
			this.invQty = (String) map.get("INV_QTY");
			this.invQty2 = (String) map.get("INV_QTY2");
			this.itemCd = (String) map.get("ITEM_CD");
			this.itemNm = (String) map.get("ITEM_NM");

		}
	}

	@Data
	@ToString
	static public class LoginResponse {
		private String viewName;
		private String coCd;
		private String usrId;
		private String useYn;
		private String resultTxt;
		private String deptNm;
		private String result;
		private String usrNm;
		private String deptCd;


		public LoginResponse(Map<String,Object> map) {
			this.viewName = (String) map.get("VIEW_NAME");
			this.coCd = (String) map.get("CO_CD");
			this.usrId = (String) map.get("USR_ID");
			this.useYn = (String) map.get("USE_YN");
			this.resultTxt = (String) map.get("RESULT_TXT");
			this.deptNm = (String) map.get("DEPT_NM");
			this.result = (String) map.get("RESULT");
			this.usrNm = (String) map.get("USR_NM");
			this.deptCd = (String) map.get("DEPT_CD");

		}
	}
}



